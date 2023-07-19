import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lista_todo/providers/task.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiver/iterables.dart';

// rgb(25, 67, 80) dark green
// rgb(255, 136, 130) pink orange
// rgb(255, 194, 180) light pink
// rgb(157, 190, 185) light green

// tela que apresenta as tarefas de uma lista

class List extends ConsumerStatefulWidget {
  const List({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListState();
}

class _ListState extends ConsumerState<List> {
  @override
  Widget build(BuildContext context) {
    String listName = ModalRoute.of(context)!.settings.arguments
        as String; // nome da lista de tarefas atual
    var tasks = ref
        .watch(tasksProvider.notifier)
        .findTasks(listName); // lista de tarefas
    var completeds = ref.watch(tasksProvider.notifier).findComplete(
        listName); // lista de estados das tarefas (concluida, nao concluida)
    var zipped = zip([tasks, completeds])
        .toList(); // lista de pares tarefa estado(concluida, nao concluida)
    String taskName =
        ''; // variavel para guardar o nome de uma nova tarefa a ser criada
    // Widgets tree
    /*
    Scaffold
      SizedBox
        ListView
          Container
            IconButton
          Column
            map() => Row
              IconButton
              Container
                Row
                  Text
                  ClipRRect
          IconButton
            onPressed: showDialog
              BackDropFilter
                AlertDialog
                  SizedBox
                    TextField
                  actions:
                    TextButton
                    TextButton
    */
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            // Voltar para a área de listas
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 40),
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
            // Tarefas da lista
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: zipped
                  .map((e) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Botão para remover tarefa
                          IconButton(
                              onPressed: () {
                                ref
                                    .read(tasksProvider.notifier)
                                    .deleteTask(
                                        name: listName, task: e[0].toString())
                                    .then((value) => Navigator.pushNamed(
                                        context, '/list',
                                        arguments: listName));
                              },
                              icon: const Icon(Icons.delete)),
                          Container(
                            margin: const EdgeInsets.all(12.0),
                            padding: const EdgeInsets.fromLTRB(24, 0, 12, 0),
                            width: 300,
                            height: 75,
                            color: const Color.fromARGB(255, 157, 190, 185),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Descrição da tarefa
                                Text(
                                  e[0].toString(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    decoration: e[1].toString() == 'true'
                                        ? TextDecoration.lineThrough
                                        : null,
                                    decorationThickness:
                                        e[1].toString() == 'true' ? 2.0 : null,
                                    decorationColor: e[1].toString() == 'true'
                                        ? const Color.fromARGB(255, 25, 67, 80)
                                        : null,
                                  ),
                                ),
                                // Alternar entre concluída e não concluída
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Material(
                                    color:
                                        const Color.fromRGBO(25, 67, 80, 0.3),
                                    child: InkWell(
                                      onTap: () {
                                        ref
                                            .read(tasksProvider.notifier)
                                            .toggleTask(
                                                listName, e[0].toString())
                                            .then((_) => Navigator.pushNamed(
                                                context, '/list',
                                                arguments: listName));
                                      },
                                      onHover: (value) {},
                                      child: SizedBox(
                                        height: 33,
                                        width: 33,
                                        child: Icon(
                                          e[1].toString() == 'true'
                                              ? Icons.check_box_rounded
                                              : Icons
                                                  .check_box_outline_blank_rounded,
                                          color: const Color.fromARGB(
                                              255, 25, 67, 80),
                                          size: 23,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),
            // Criar nova tarefa
            IconButton(
              onPressed: () {
                // Caixa de dialogo
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        title: const Text('Nova tarefa'),
                        content: SizedBox(
                          height: 240,
                          child: TextField(
                            focusNode: FocusNode(),
                            maxLines: null,
                            maxLength: 20,
                            expands: true,
                            onChanged: (value) => setState(() {
                              taskName = value;
                            }),
                          ),
                        ),
                        actions: <Widget>[
                          // Cancelar, encerrando dialogo
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancelar'),
                          ),
                          // Concluir, adicionando uma nova lista
                          TextButton(
                            onPressed: () {
                              ref
                                  .read(tasksProvider.notifier)
                                  .fillList(
                                    name: listName,
                                    taskName: taskName,
                                  )
                                  .then((_) => Navigator.pushNamed(
                                      context, '/list',
                                      arguments: listName));
                            },
                            child: const Text('Adicionar'),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
