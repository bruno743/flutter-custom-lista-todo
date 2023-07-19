import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lista_todo/providers/task.dart';

// rgb(25, 67, 80) dark green
// rgb(255, 136, 130) pink orange
// rgb(255, 194, 180) light pink
// rgb(157, 190, 185) light green

// pagina inicial, apresenta as listas de tarefas

class AllLists extends ConsumerStatefulWidget {
  const AllLists({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllListsState();
}

class _AllListsState extends ConsumerState<AllLists> {
  @override
  Widget build(BuildContext context) {
    String listName =
        ''; // variavel para guardar o nome de uma nova lista a ser criada

    // Widgets tree
    /*
    Scaffold
      AppBar
      SizedBox
        Column
          map() => Row
            IconButton
            GestureDetector
              Container
                Text
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
      appBar: AppBar(
        title: const Text(
          'Listas - Veja e gerencie listas de tarefas',
          style: TextStyle(color: Color.fromARGB(255, 25, 67, 80)),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 136, 130),
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
          children: [
            // Listas
            Column(
              children: ref
                  .read(tasksProvider.notifier)
                  .listas
                  .map(
                    (e) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Botão para apagar uma lista de tarefas
                        IconButton(
                            onPressed: () {
                              ref
                                  .read(tasksProvider.notifier)
                                  .deleteList(name: e.name.toString())
                                  .then((_) =>
                                      Navigator.pushNamed(context, '/pre'));
                            },
                            icon: const Icon(Icons.delete)),
                        // Acessar tarefas de uma lista
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 50, 10),
                            width: 275,
                            height: 50,
                            alignment: Alignment.center,
                            color: const Color.fromARGB(255, 157, 190, 185),
                            // Nome da lista
                            child: Text(
                              e.name.toString(),
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/list',
                              arguments: e.name.toString(),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            // Criar nova lista
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
                        title: const Text('Nova lista'),
                        content: SizedBox(
                          height: 240,
                          child: TextField(
                            focusNode: FocusNode(),
                            maxLines: null,
                            maxLength: 30,
                            expands: true,
                            onChanged: (value) => setState(() {
                              listName = value;
                            }),
                          ),
                        ),
                        actions: <Widget>[
                          // Cancelar, encerrando dialogo
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/pre');
                            },
                            child: const Text('Cancelar'),
                          ),
                          // Concluir, adicionando uma nova lista
                          TextButton(
                            onPressed: () {
                              ref
                                  .read(tasksProvider.notifier)
                                  .addList(name: listName);
                              Navigator.pushNamed(context, '/list',
                                  arguments: listName);
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
