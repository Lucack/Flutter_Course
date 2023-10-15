import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  void responder() {
    print("Pergunta respondida");
  }

  var perguntaSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      "Qual a sua cor favorita?",
      "Qual é o seu animal favorito?",
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Perguntas"),
          ),
          body: Column(
            children: [
              Text(perguntas[perguntaSelecionada]),
              ElevatedButton(
                child: Text("Resposta1"),
                onPressed: responder,
              ),
              ElevatedButton(
                child: Text("Resposta2"),
                onPressed: responder,
              ),
              ElevatedButton(
                child: Text("Resposta3"),
                onPressed: responder,
              ),
            ],
          )),
    );
  }
}
