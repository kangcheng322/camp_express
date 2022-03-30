class Producto {
  String id;
  String nombre;
  double precio;
  String rango;
  String cantidad;
  double rating;
  String image;
  bool favorito = false;
  bool cesta = false;
  Producto(this.id, this.nombre, this.precio, this.rango, this.cantidad,
      this.rating, this.image);
}
