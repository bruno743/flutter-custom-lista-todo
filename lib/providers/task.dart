import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:lista_todo/collections/list_collection.dart';
import 'package:path_provider/path_provider.dart';

// classe que fornece os metodos para interagir com o banco de dados

class TasksProvider extends ChangeNotifier {
  late Future<Isar> db;

  TasksProvider() {
    db = init();
    loadAll();
  }

  // inicia o banco
  Future<Isar> init() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open([ListCollectionSchema], directory: dir.path);
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  // variavel que ira armazenar o conteudo do banco de dados
  List<ListCollection> listas = [];

  // carrega os dados em uma variavel para que fiquem disponiveis para a aplicacao
  Future<void> loadAll() async {
    listas = await loadLists();
    notifyListeners();
  }

  // adiciona uma lista de tarefas ao banco de dados
  Future<void> addList({required String name}) async {
    final Isar isar = await db;
    await isar.writeTxn(() async {
      final newList = ListCollection(
        name: name,
        tasks: [],
        completeds: [],
      );
      await isar.listCollections.put(newList);
      listas.add(newList);
    });
    notifyListeners();
  }

  // adiciona uma tarefa a uma lista no banco de dados
  Future<void> fillList(
      {required String name, required String taskName}) async {
    final Isar isar = await db;
    final ListCollection? listC =
        await isar.listCollections.filter().nameEqualTo(name).findFirst();
    if (listC != null) {
      listC.tasks = listC.tasks.toList();
      listC.tasks.add(taskName);
      listC.completeds = listC.completeds.toList();
      listC.completeds.add(false);
      await isar.writeTxn(() async {
        await isar.listCollections.put(listC);
      });
      listas = await loadLists();
      notifyListeners();
    }
  }

  // exclui uma lista de tarefas do banco de dados
  Future<void> deleteList({required String name}) async {
    final Isar isar = await db;
    final ListCollection? listC =
        await isar.listCollections.filter().nameEqualTo(name).findFirst();
    if (listC != null) {
      await isar.writeTxn(() async {
        await isar.listCollections.delete(listC.id);
      });
      listas = await loadLists();
      notifyListeners();
    }
  }

  // exclui uma tarefa de uma lista especifica no banco de dados
  Future<void> deleteTask({required String name, required String task}) async {
    final Isar isar = await db;
    final ListCollection? listC =
        await isar.listCollections.filter().nameEqualTo(name).findFirst();
    if (listC != null) {
      listC.tasks = listC.tasks.toList();
      int index = listC.tasks.indexOf(task);
      listC.tasks.removeAt(index);
      listC.completeds = listC.completeds.toList();
      listC.completeds.removeAt(index);
      await isar.writeTxn(() async {
        await isar.listCollections.put(listC);
      });
      listas = await loadLists();
      notifyListeners();
    }
  }

  // metodo que obtem as listas
  Future<List<ListCollection>> loadLists() async {
    final Isar isar = await db;
    final listC =
        await isar.listCollections.where(sort: Sort.asc).anyId().findAll();
    return listC;
  }

  // metodo que obtem as tarefas de uma lista especifica
  List<String> findTasks(String name) {
    for (int i = 0; i < listas.length; i++) {
      if (listas[i].name == name) {
        return listas[i].tasks;
      }
    }
    return [];
  }

  // obtem as tarefas completas de uma lista
  List<bool> findComplete(String name) {
    for (int i = 0; i < listas.length; i++) {
      if (listas[i].name == name) {
        return listas[i].completeds;
      }
    }
    return [];
  }

  // muda o estado de uma tarefa
  Future<void> toggleTask(String name, String task) async {
    final Isar isar = await db;
    ListCollection? listC =
        await isar.listCollections.filter().nameEqualTo(name).findFirst();
    if (listC != null) {
      for (int j = 0; j < listC.tasks.length; j++) {
        if (listC.tasks[j] == task) {
          listC.completeds[j] = !listC.completeds[j];
          await isar.writeTxn(() async {
            await isar.listCollections.put(listC);
          });
          listas = await loadLists();
          notifyListeners();
        }
      }
    }
  }
}

final tasksProvider = ChangeNotifierProvider((ref) {
  return TasksProvider();
});
