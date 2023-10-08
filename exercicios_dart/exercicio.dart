soma(int a,int b){
  print(a+b);
}

main() {
  // Tipos de variáveis
  int a = 3;
  double b = 5.1;
  var c = "Teste de String";
  
  // Bool
  bool estaChovendo = true;
  bool estaFrio = false;
  print(estaChovendo & estaFrio);
  
  // Listas
  var nomes = ['Ana', 'Bia', 'Carlos'];
  nomes.add('Daniel');
  print(nomes.length);
  print(nomes.elementAt(0));
  print(nomes[0]);

  // Set - sem repetição
  var conjunto = {0,1,2,3,4,4,4,4,4,4,4};
  print(conjunto.length); // Retorna 5
  print(conjunto is Set); // Retorna True
  
  // Map
  Map<String, double> notasAlunos = {
    'Ana': 9.7,
    'Bia': 9.2,
    'Carlos': 7.8,
  };
  print('');
  for (var chave in notasAlunos.keys){
    print('chave = $chave');
  }
  print('');
  for (var valor in notasAlunos.values){
    print('valor = $valor');
  }
  print('');
 for (var registro in notasAlunos.entries){
    print('${registro.key} = ${registro.value}');
  }

  // Dynamic - não muito usado
  dynamic x = 'Teste';
  x = 123;
  x = false;
  print(x);

  // Costantes
  final e = 3;
  // e = 4;
  print(e);

  const f = 1;
  print(f);

  // Funções
  soma(2,3);


}