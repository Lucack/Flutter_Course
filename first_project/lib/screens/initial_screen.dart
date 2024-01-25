
import 'package:first_project/components/task.dart';
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
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task(
                'Aprender Flutter',
                'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                3),
            Task(
                'Estudar Inglês',
                'https://img.freepik.com/vetores-gratis/fundo-de-livro-em-ingles-desenhado-a-mao_23-2149483336.jpg?w=740&t=st=1706116710~exp=1706117310~hmac=6f31e0bea4893f8082c68d2c602b87102252e5712f84d39470841cfbbc5ae303',
                2),
            Task(
                'Terminar Artigo',
                'https://img.freepik.com/vetores-gratis/pessoa-escrevendo-ilustracao-em-vetor-plana-carta-de-amor-caneta-na-mao-humana-pessoa-que-envia-ou-recebe-carta-correspondencia-comunicacao-relacionamento-conceito-de-amizade_74855-24968.jpg?w=740&t=st=1706116749~exp=1706117349~hmac=0db77fdd6ddf412bc3244b946df443b277d19c67092f7dfc230944d08873d1ba',
                4),
            Task(
                'Comprar Impressora',
                'https://img.freepik.com/vetores-gratis/impressora_53876-59954.jpg?w=740&t=st=1706116777~exp=1706117377~hmac=90ca45a305bc43324d1c04bce5b29d87df2758e52bbd1fc219050116593dd5a5',
                0),
            Task(
                'Comprar Teclado',
                '',
                0),
            SizedBox(height: 80,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          opacidade = !opacidade;
        });

      }, child: const Icon(Icons.remove_red_eye),),);
  }}