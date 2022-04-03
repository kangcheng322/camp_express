class Orden {
  double total;
  DateTime date;
  List productos = [];
  List<String> cantidades = [];
  List precios = [];
  Orden(this.total, this.date, this.productos, this.cantidades, this.precios);
}
