import 'package:camp_express/domain/orden.dart';
import 'package:camp_express/domain/productos.dart';
import 'package:get/get.dart';

class ProductosController extends GetxController {
  final List<Producto> _producto = <Producto>[
    Producto('0', 'Papas criollas', 7200, "0\$ - 149.0\$", '470 g', 5.0,
        'assets/images/papas.png'),
    Producto('1', 'Mazorca', 6800, '150.0\$ - 499.0\$', '2 und', 3.5,
        'assets/images/maiz.png'),
    Producto('2', 'Patilla', 7497, '500.0\$ - 1500.0\$', '1 und', 2.5,
        'assets/images/sandia.png'),
    Producto('3', 'Arroz', 9600, '500.0\$ - 1500.0\$', '3000 g', 4.0,
        'assets/images/arroz.png'),
    Producto('4', 'Tomate', 7800, '500.0\$ - 1500.0\$', '1 kg', 3.5,
        'assets/images/tomate.png')
  ].obs;
  final List<Producto> _favoritos = <Producto>[].obs;
  final List<Producto> _carrito = <Producto>[].obs;
  late final RxDouble _total = 0.0.obs;
  final List<Orden> _ordenes = <Orden>[].obs;


  List<Producto> get producto => _producto;
  List<Producto> get favoritos => _favoritos;
  List<Producto> get carrito => _carrito;
  double get total => _total.value;
  List<Orden> get ordenes => _ordenes;

  // set producto(List<Producto> producto){
  //    _producto.add(producto);
  // } 
  
  void addProduct (Producto producto ) {
    _producto.add(producto);
    
  }
  //Marcar si un producto se encuentra en favoritos y guardar en una lista de favoritos
  ajustarFavorito(String id) {
    var producto = _producto.firstWhere((element) => element.id == id);
    var indice = _producto.indexWhere((element) => element.id == id);
    if (producto.favorito == false) {
      producto.favorito = true;
      _favoritos.add(producto); //modificar favorito en base de datos
      // actualizar la lista con la base de datos
    } else {
      producto.favorito = false;
      var indice2 = _favoritos.indexWhere((element) => element.id == id);
      _favoritos.removeAt(indice2); // modificar favorito en base de datos
      // actualizar la lista con la base de datos
    }
    _producto.fillRange(indice, indice + 1, producto);
  }

  //Si el producto está en favorito esto devuelve true o false para que el ícono de corazón se rellene o no
  obtenerFavorito(String id) {
    var producto = _producto.firstWhere((element) => element.id == id);
    return producto.favorito;
  }

//Marcar si un producto está en el carrito y guardarlo en una lista del carrito
  agregarCarrito(String id) {
    var producto = _producto.firstWhere((element) => element.id == id);
    var indice = _producto.indexWhere((element) => element.id == id);
    if (producto.cesta == false) {
      producto.cesta = true;
      _carrito.add(producto);
    } else {
      producto.cesta = false;
      producto.cantidadCarrito = 0;
      var indice3 = _carrito.indexWhere((element) => element.id == id);
      _carrito.removeAt(indice3);
      _total.value = _total.value - producto.subtotal;
      producto.subtotal = 0;
    }
    _producto.fillRange(indice, indice + 1, producto);
  }

//Si el producto está en el carrito, el botón de agregar al carrito cambiará a rojo o verde dependiendo
  estadoCarrito(String id) {
    var producto = _producto.firstWhere((element) => element.id == id);
    return producto.cesta;
  }

//Eliminar todos los productos de la lista del carrito
  vaciarCarrito() {
    _carrito.removeRange(0, _carrito.length);
    for (var i = 0; i < _producto.length; i++) {
      _producto.elementAt(i).cesta = false;
      _producto.elementAt(i).cantidadCarrito = 0;
      _producto.elementAt(i).subtotal = 0.0;
      _producto.fillRange(i, i + 1, _producto.elementAt(i));
    }
    _total.value = 0.0;
  }

//Aumentar la cantidad del producto al carrito
  addCantidad(String id) {
    var _actualizar = _producto.firstWhere((element) => element.id == id);
    var indice = _producto.indexWhere((element) => element.id == id);
    if (_actualizar.cantidadCarrito < 50) {
      _actualizar.cantidadCarrito += 1;
      _producto.fillRange(indice, indice + 1, _actualizar);
      suma(_actualizar.precio);
      subtotal(id);
    }
  }

//Disminuir la cantidad del producto al carrito
  resCantidad(String id) {
    var _actualizar = _producto.firstWhere((element) => element.id == id);
    var indice = _producto.indexWhere((element) => element.id == id);
    if (_actualizar.cantidadCarrito > 0) {
      _actualizar.cantidadCarrito -= 1;
      _producto.fillRange(indice, indice + 1, _actualizar);
      resta(_actualizar.precio);
      subtotal(id);
    }
  }

  int cantidadCarrito(String id) {
    var cant = _producto.firstWhere((element) => element.id == id);
    return cant.cantidadCarrito;
  }

//Sumar al precio total a pagar
  suma(double x) {
    _total.value = _total.value + x;
  }

//Restar al precio total a pagar
  resta(double x) {
    _total.value = _total.value - x;
  }

//Obtener el subtotal generado por la cantidad de un producto
  subtotal(String id) {
    var producto = _producto.firstWhere((element) => element.id == id);
    var indice = _producto.indexWhere((element) => element.id == id);
    producto.subtotal = producto.cantidadCarrito * producto.precio;
    _producto.fillRange(indice, indice + 1, producto);
  }

  double obtenerSubtotal(String id) {
    var producto = _producto.firstWhere((element) => element.id == id);
    return producto.subtotal;
  }

//Agrega el total con el tiempo que se compró, además con los productos y sus cantidades, por último los precios a una lista de ordenes
  agregarOrden(DateTime date) {
    List productos = [];
    List<String> cantidades = [];
    List precios = [];
    for (var i = 0; i < _carrito.length; i++) {
      productos.add(_carrito.elementAt(i).nombre);
      var unir = _carrito.elementAt(i).cantidadCarrito.toString() + 'x';
      cantidades.add(unir);
      precios.add(_carrito.elementAt(i).precio);
    }
    _ordenes.add(Orden(_total.value, date, productos, cantidades, precios));
  }
}
