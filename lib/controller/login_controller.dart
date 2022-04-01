import 'package:camp_express/domain/users.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final List<Usuario> _usuario = <Usuario>[Usuario(0, "kang", '123')].obs;
  final _mensaje = ''.obs;
  final _mensaje2 = ''.obs;
  final _campo = ''.obs;
  final _contrasena = ''.obs;
  final _confirmarContrasena = ''.obs;

  String get confirmarContrasena => _confirmarContrasena.value;
  String get contrasena => _contrasena.value;
  String get campo => _campo.value;
  String get mensaje => _mensaje.value;
  String get mensaje2 => _mensaje2.value;
  List<Usuario> get usuario => _usuario;

  comprobar(var correo, var contrasena) {
    var _validar =
        _usuario.firstWhereOrNull((element) => element.correo == correo);
    if (_validar != null) {
      if (_validar.constrasena == contrasena) {
        _mensaje.value = '';
        Get.toNamed("bottom_nav_bar");
      } else {
        _mensaje.value = 'Correo y/o contraseña inválido';
      }
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

  crearUsuario(var correo, var contrasena, var confirmarContrasena) {
    if (contrasena == confirmarContrasena && contrasena != '') {
      var _validar =
          _usuario.firstWhereOrNull((element) => element.correo == correo);
      if (_validar == null) {
        _usuario.add(Usuario(_usuario.length, correo, contrasena));
        Get.toNamed("login");
        _campo.value = '';
        _contrasena.value = '';
      } else {
        _mensaje2.value = 'El correo ya existe';
      }
    } else {
      _mensaje2.value = 'Contraseñas incorrectas';
    }
  }

  reiniciarMensaje() {
    _mensaje.value = '';
    _campo.value = '';
    _contrasena.value = '';
  }

  cerrarSesion() {
    Get.toNamed("login");
    _campo.value = '';
    _contrasena.value = '';
  }
}
