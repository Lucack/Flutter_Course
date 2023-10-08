class Product {
  String? nome;
  double? preco;

  Product(this.nome,this.preco);
  
  // Product(String nomeParametro, double precoParametro){
  //   this.nome = nomeParametro;
  //   this.preco = precoParametro;   
  // }
}
void main(List<String> args) {
  var p1 = new Product('Lapis',4.69);
  var p2 = Product('Bolsa', 78.89);
  // p1.nome = 'Lapis';
  // p1.preco = 4.69;
  print("O produto ${p1.nome} tem preço R\$ ${p1.preco}");
  print("O produto ${p2.nome} tem preço R\$ ${p2.preco}");


}