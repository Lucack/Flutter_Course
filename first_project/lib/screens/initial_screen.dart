import 'package:first_project/components/task.dart';
import 'package:first_project/data/task_dao.dart';
import 'package:first_project/data/task_inherieted.dart';
import 'package:first_project/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add_chart),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh))
        ],
        title: const Text('Tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando...')
                      ],
                    ),
                  );
                  break;
                case ConnectionState.waiting:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando...')
                      ],
                    ),
                  );
                  break;
                case ConnectionState.active:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando...')
                      ],
                    ),
                  );
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          });
                    }
                    return const Center(
                      child: Column(
                        children: [
                          Icon(Icons.error_outline, size: 128),
                          Text('Não há tarefas!')
                        ],
                      ),
                    );
                  }
                  return const Text('Erro ao carregar tarefas!');
              }
              return const Text('Erro desconhecido');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => FormScreen(
                        taskContext: context,
                      ))).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
