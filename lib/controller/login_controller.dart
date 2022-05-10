import 'package:camp_express/domain/usuario.dart';
import 'package:camp_express/screens/inicio/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../widgets/home/bottom_nav_bar.dart';

class LoginController extends GetxController {
  final List<Usuario> _usuario = <Usuario>[
    Usuario("0", "luci@gmail.com", '123', 'Sin editar', 'Sin editar')
  ].obs;
  final _mensaje = ''.obs;
  final _mensaje2 = ''.obs;
  final _campo = ''.obs;
  final _contrasena = ''.obs;
  final _confirmarContrasena = ''.obs;
  final _nombreUsuario = ''.obs;
  final _edad = ''.obs;
  final _genero = ''.obs;
  final List _aux = ['', '', ''].obs;

  String get confirmarContrasena => _confirmarContrasena.value;
  String get contrasena => _contrasena.value;
  String get campo => _campo.value;
  String get mensaje => _mensaje.value;
  String get mensaje2 => _mensaje2.value;
  List<Usuario> get usuario => _usuario;
  String get nombreUsuario => _nombreUsuario.value;
  String get edad => _edad.value;
  String get genero => _genero.value;
  List get aux => _aux;

//Comprobar que los campos sean válidos para el inicio de sesión
  comprobar(var correo, var contrasena) {
    var _validar =
        _usuario.firstWhereOrNull((element) => element.correo == correo);
    if (_validar != null) {
      // if (_validar.constrasena == contrasena) {
      //   _mensaje.value = '';
      //   Get.to(const BottomNavBar());
      // } else {
      //   _mensaje.value = 'Correo y/o contraseña inválido';
      // }
    } else {
      _mensaje.value = 'Correo y/o contraseña inválido';
    }
  }

  obtenerCampo(var campo) {
    _campo.value = campo;
  }

  obtenerContrsena(var contrasena) {
    _contrasena.value = contrasena;
  }

  obtenerConfirmarContrasena(var confirmarContrasena) {
    _confirmarContrasena.value = confirmarContrasena;
  }

//Crea un usuario en la interfaz de registro con sus respectivas validaciones
  // crearUsuario(var correo, var contrasena, var confirmarContrasena) {
  //   if (contrasena == confirmarContrasena && contrasena != '') {
  //     var _validar =
  //         _usuario.firstWhereOrNull((element) => element.correo == correo);
  //     if (_validar == null) {
  //       _usuario.add(Usuario(_usuario.length, correo, contrasena, 'Sin editar',
  //           'Sin editar', 'Sin definir'));
  //       Get.to(const Login());
  //       _campo.value = '';
  //       _contrasena.value = '';
  //       _mensaje2.value = '';
  //     } else {
  //       _mensaje2.value = 'El correo ya existe';
  //     }
  //   } else {
  //     _mensaje2.value = 'Contraseñas incorrectas';
  //   }
  // }

//El mensaje de error y los campos vuelven a su condición inicial
  // reiniciarMensaje() {
  //   _mensaje.value = '';
  //   _campo.value = '';
  //   _contrasena.value = '';
  // }

//La pantalla cambia a login
  // cerrarSesion() {
  //   Get.toNamed("login");
  //   _campo.value = '';
  //   _contrasena.value = '';
  // }

  //Muestra los datos del usuario en los campos a editar
  // mostrarDatosUsuario() {
  //   var datosUsuario =
  //       _usuario.firstWhere((element) => element.correo == _campo.value);
  //   _nombreUsuario.value = datosUsuario.usuario;
  //   _edad.value = datosUsuario.edad;
  // }

//Obtiene el género que la persona seleccionó
  // obtenerGenero(String genero) {
  //   _genero.value = genero;
  // }

//Edita un usuario, detectando si un campo se llenó y luego guardar el usuario
  // editarUsuario(var campo, int tipo, bool guardar) {
  //   if (tipo == 1) {
  //     _aux[0] = campo;
  //   }
  //   if (tipo == 2) {
  //     _aux[1] = campo;
  //   }
  //   if (tipo == 3) {
  //     _aux[2] = campo;
  //   }
  //   if (guardar) {
  //     var x = _usuario.firstWhere((element) => element.correo == _campo.value);
  //     var indice =
  //         _usuario.indexWhere((element) => element.correo == _campo.value);
  //     if (_aux[0] != '') {
  //       x.usuario = _aux[0];
  //     }
  //     if (_aux[1] != '') {
  //       x.constrasena = _aux[1];
  //     }
  //     if (_aux[2] != '') {
  //       x.edad = _aux[2];
  //     }
  //     if (_genero.value != '') {
  //       x.genero = _genero.value;
  //     }

  //     reasignarValor();
  //     _usuario.fillRange(indice, indice + 1, x);
  //   }
  // }

  //La lista auxiliar de los campos vuelven a su condición inicial
  // reasignarValor() {
  //   _aux[0] = '';
  //   _aux[1] = '';
  //   _aux[2] = '';
  // }

  //Devuelve el valor inicial para el menú de género
  // String dropDownValue() {
  //   var x = _usuario.firstWhere((element) => element.correo == _campo.value);
  //   return x.genero;
  // }

  // String obtenerNombreUsuario() {
  //   // var x = _usuario.firstWhere((element) => element.correo == _campo.value);
  //   User? user = FirebaseAuth.instance.currentUser;
  //   String? x = user!.email;
  //   final uid = user.uid;
  //   return x;
  // }

  String getUserEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;
    return email!;
  }
}
