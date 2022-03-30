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

  List<Producto> get producto => _producto;
  List<Producto> get favoritos => _favoritos;
  List<Producto> get carrito => _carrito;

  ajustarFavorito(String id) {
    var producto = _producto.firstWhere((element) => element.id == id);
    var indice = _producto.indexWhere((element) => element.id == id);
    if (producto.favorito == false) {
      producto.favorito = true;
      _favoritos.add(producto);
    } else {
      producto.favorito = false;
      var indice2 = _favoritos.indexWhere((element) => element.id == id);
      _favoritos.removeAt(indice2);
    }
    _producto.fillRange(indice, indice + 1, producto);
  }

  obtenerFavorito(String id) {
    var producto = _producto.firstWhere((element) => element.id == id);
    return producto.favorito;
  }

  agregarCarrito(String id) {
    var producto = _producto.firstWhere((element) => element.id == id);
    var indice = _producto.indexWhere((element) => element.id == id);
    if (producto.cesta == false) {
      producto.cesta = true;
      _carrito.add(producto);
    } else {
      producto.cesta = false;
      var indice3 = _carrito.indexWhere((element) => element.id == id);
      _carrito.removeAt(indice3);
    }
    _producto.fillRange(indice, indice + 1, producto);
  }

  estadoCarrito(String id) {
    var producto = _producto.firstWhere((element) => element.id == id);
    return producto.cesta;
  }
}
