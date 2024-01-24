import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.add_chart),
            title: Text('Tarefas'),
          ),
          body: ListView(
            children: [
              Task(
                  'Aprender Flutter',
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                  3),
              Task('Estudar Inglês',
                  'https://img.freepik.com/vetores-gratis/fundo-de-livro-em-ingles-desenhado-a-mao_23-2149483336.jpg?w=740&t=st=1706116710~exp=1706117310~hmac=6f31e0bea4893f8082c68d2c602b87102252e5712f84d39470841cfbbc5ae303'
                  , 2),
              Task('Terminar Artigo',
                  'https://img.freepik.com/vetores-gratis/pessoa-escrevendo-ilustracao-em-vetor-plana-carta-de-amor-caneta-na-mao-humana-pessoa-que-envia-ou-recebe-carta-correspondencia-comunicacao-relacionamento-conceito-de-amizade_74855-24968.jpg?w=740&t=st=1706116749~exp=1706117349~hmac=0db77fdd6ddf412bc3244b946df443b277d19c67092f7dfc230944d08873d1ba',
                  4),
              Task('Comprar Impressora',
                  'https://img.freepik.com/vetores-gratis/impressora_53876-59954.jpg?w=740&t=st=1706116777~exp=1706117377~hmac=90ca45a305bc43324d1c04bce5b29d87df2758e52bbd1fc219050116593dd5a5',
                  0),
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {})),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto,this.dificuldade, {super.key});

  @override
  State<Task> createState()

  =>

  _TaskState

  (

  );
}

class _TaskState extends State<Task> {
  int nivel = 0;

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
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(4)
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                      decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius:BorderRadius.circular(4),
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
                          Container(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: TextStyle(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >=1)? Colors.lightBlue : Colors.lightBlue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >=2)? Colors.lightBlue : Colors.lightBlue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >=3)? Colors.lightBlue : Colors.lightBlue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >=4)? Colors.lightBlue : Colors.lightBlue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >=5)? Colors.lightBlue : Colors.lightBlue[100],
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 80,
                        width: 70,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel++;
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Colors.cyan),
                                foregroundColor:
                                MaterialStateProperty.all(Colors.white)),
                            child: Column(
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
                      child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade>0)? (nivel/4) / 10 : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Nivel $nivel',
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
