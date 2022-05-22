class Producto {
  String id;
  String nombre;
  double precio;
  String rango;
  String cantidad;
  double rating;
  String image;
  bool favorito;
  bool cesta = false;
  int cantidadCarrito = 0;
  double subtotal = 0;
  String email;
  Producto(this.id, this.nombre, this.precio, this.rango, this.cantidad,
      this.rating, this.image, this.favorito, this.email);
}
