// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:camp_express/controller/login_controller.dart';
import 'package:camp_express/controller/productos_controller.dart';
import 'package:camp_express/screens/cart/carrito.dart';
import 'package:camp_express/screens/favoritos/favoritos.dart';
import 'package:camp_express/screens/home/help/ayuda.dart';
import 'package:camp_express/screens/home/home.dart';
import 'package:camp_express/screens/inicio/login.dart';
import 'package:camp_express/screens/inicio/registro.dart';
import 'package:camp_express/screens/inicio/resetear.dart';
import 'package:camp_express/screens/profile/edit/editar_perfil.dart';
import 'package:camp_express/screens/profile/edit/tarjetasdart';
import 'package:camp_express/screens/profile/noti/notificacion.dart';
import 'package:camp_express/screens/profile/perfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

void main() {
  Get.put(LoginController());
  Get.put(ProductosController());

  testWidgets(
      'Login: Verificar cuando el usuario pueda y no pueda iniciar sesión',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: Scaffold(
      body: Login(),
    )));
    expect(find.text('Correo electrónico'), findsOneWidget);
    expect(find.text('Contraseña'), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextField_correo')), 'luc@gmail.com');
    await tester.enterText(
        find.byKey(const Key('TextField_contrasena')), '123');
    await tester.tap(find.byKey(const Key('boton_iniciar_sesión')));
    await tester.pump();
    expect(find.text('Correo y/o contraseña inválido'), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextField_correo')), 'luci@gmail.com');
    await tester.enterText(
        find.byKey(const Key('TextField_contrasena')), '123');
    await tester.tap(find.byKey(const Key('boton_iniciar_sesión')));
    await tester.pump();
    expect(find.text('Correo y/o contraseña inválido'), findsNothing);
  });
  testWidgets('Registro: Crear usuario y no permitir usuarios repetidos',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: Scaffold(
      body: Registro(),
    )));
    expect(find.text('Correo electrónico'), findsOneWidget);
    expect(find.text('Contraseña'), findsOneWidget);
    expect(find.text('Confirmar contrseña'), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextField_correo')), 'luci@gmail.com');
    await tester.enterText(
        find.byKey(const Key('TextField_contrasena')), '123');
    await tester.enterText(find.byKey(const Key('TextField_confirmar')), '123');
    await tester.ensureVisible(find.byKey(const Key('boton_registro')));
    await tester.tap(find.byKey(const Key('boton_registro')));
    await tester.pump();
    expect(find.text('El correo ya existe'), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('TextField_correo')), 'kang@gmail.com');
    await tester.enterText(
        find.byKey(const Key('TextField_contrasena')), '123');
    await tester.enterText(find.byKey(const Key('TextField_confirmar')), '123');
    await tester.ensureVisible(find.byKey(const Key('boton_registro')));
    await tester.tap(find.byKey(const Key('boton_registro')));
    await tester.pump();
    expect(find.text('El correo ya existe'), findsNothing);
  });
  testWidgets(
      'Resetear contraseña: Verificar que el campo de texto y el botón estén bien creados',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: Scaffold(
      body: Resetear(),
    )));
    expect(find.text('Resetear contraseña'), findsOneWidget);
    expect(find.text('Correo electrónico'), findsOneWidget);
    expect(find.text('Resetear'), findsOneWidget);
    expect(find.text('Iniciar sesión'), findsOneWidget);
  });
  testWidgets(
      'Home: Verificar que los widgets estén bien y que el menú lateral funcione',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: Scaffold(
      body: Home(),
    )));
    expect(find.text('Productos'), findsOneWidget);
    expect(find.text('Campo'), findsOneWidget);
    expect(find.text('Artesanías'), findsOneWidget);
    expect(find.text('Populares'), findsOneWidget);
    expect(find.text('Ver todo'), findsNWidgets(2));
    expect(find.text('Papas criollas'), findsNWidgets(2));
    expect(find.text('Mazorca'), findsNWidgets(2));
    await tester.tap(find.byIcon(UniconsLine.search));
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pump();
    expect(find.text('Cerrar sesión'), findsOneWidget);
    expect(find.text('Vender'), findsOneWidget);
    expect(find.text('Ayuda'), findsOneWidget);
    await tester.tap(find.byKey(const Key('cerrar_sesion')));
    await tester.pump();
  });
  testWidgets('Favoritos: Verificar que los widgets estén bien',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: Scaffold(
      body: Favoritos(),
    )));
    expect(find.text('Favoritos'), findsOneWidget);
  });
  testWidgets('Carrito: Verificar que los widgets estén bien',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: Scaffold(
      body: Carrito(),
    )));
    expect(find.text('Carrito'), findsOneWidget);
    expect(find.text('Total'), findsOneWidget);
    expect(find.text('0.0\$'), findsOneWidget);
    expect(find.text('Comprar'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.tap(find.byKey(const Key('boton_carrito')));
    await tester.pump();
  });
  testWidgets('Notificaciones: Verificar que los campos estén bien',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: Scaffold(
      body: Notificacion(),
    )));
    expect(find.text('Notificaciones'), findsOneWidget);
    expect(find.text('¡BIENVENIDO!'), findsOneWidget);
    expect(find.byIcon(Icons.more_vert), findsNWidgets(2));
  });
  testWidgets('Ayuda: Verificar que los campos estén bien',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: Scaffold(
      body: Ayuda(),
    )));
    expect(find.text('Canales de atención'), findsOneWidget);
    expect(find.text('camp_express@gmail.com'), findsOneWidget);
    expect(find.text('3192220499'), findsOneWidget);
    expect(find.text('3212270498'), findsOneWidget);
    expect(find.text('Línea de atención al cliente: 01-800-0912348'),
        findsOneWidget);
    expect(find.text('Camp Express'), findsOneWidget);
    expect(find.text('Camp_Express'), findsOneWidget);
    expect(find.text('Camp Express Oficial'), findsOneWidget);
  });
}
