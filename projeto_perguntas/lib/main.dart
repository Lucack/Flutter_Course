import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;      
    });
    
    print("Pergunta respondida");
  }

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
              Text(perguntas[_perguntaSelecionada]),
              ElevatedButton(
                child: Text("Resposta1"),
                onPressed: _responder,
              ),
              ElevatedButton(
                child: Text("Resposta2"),
                onPressed: _responder,
              ),
              ElevatedButton(
                child: Text("Resposta3"),
                onPressed: _responder,
              ),
            ],
          )),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
