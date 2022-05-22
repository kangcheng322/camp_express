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
  int cantidadCarrito;
  double subtotal;
  String email;
  Producto(
      this.id,
      this.nombre,
      this.precio,
      this.rango,
      this.cantidad,
      this.rating,
      this.image,
      this.favorito,
      this.email,
      this.cantidadCarrito,
      this.subtotal);
}
