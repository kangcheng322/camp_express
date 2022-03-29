import 'package:camp_express/domain/productos.dart';
import 'package:get/get.dart';

class ProductosController extends GetxController {
  final List<Producto> _producto = <Producto>[
    Producto('0', 'Papas', 148, "0\$ - 149.0\$", '1500 g', 5.0,
        'assets/images/papas.png'),
    Producto('1', 'Maiz', 399, '150.0\$ - 499.0\$', '1 und', 3.5,
        'assets/images/maiz.png'),
    Producto('2', 'Sandía', 780, '500.0\$ - 1500.0\$', '1 und', 2.5,
        'assets/images/sandia.png'),
    Producto('3', 'Arroz', 1099, '500.0\$ - 1500.0\$', '3000 g', 4.0,
        'assets/images/arroz.png'),
    Producto('4', 'Tomate', 1300, '500.0\$ - 1500.0\$', '1 und', 3.5,
        'assets/images/tomate.png')
  ].obs;
  final List<Producto> _favoritos = <Producto>[].obs;

  List<Producto> get producto => _producto;
  List<Producto> get favoritos => _favoritos;

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
}
