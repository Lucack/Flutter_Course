import 'package:first_project/components/difficulty.dart';
import 'package:first_project/data/task_dao.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int difficulty;
  int nivel = 0;

  Task(this.nome, this.foto, this.difficulty, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {}
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white54,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(4)),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(4)),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Difficulty(
                            difficultyLevel: widget.difficulty,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 80,
                        width: 70,
                        child: ElevatedButton(
                            onLongPress: () {
                              TaskDao().delete(widget.nome);

                            },
                            onPressed: () {
                              setState(() {
                                widget.nivel++;
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.cyan),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text('UP', style: TextStyle(fontSize: 16))
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.difficulty > 0)
                              ? (widget.nivel / 4) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Nivel ${widget.nivel}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
