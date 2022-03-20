import 'package:flutter/material.dart';

class Presentacion extends StatefulWidget {
  @override
  _PresentacionState createState() => _PresentacionState();
}

class _PresentacionState extends State<Presentacion>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  void initState() {
    super.initState();
    _cambiar();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _cambiar() async {
    await Future.delayed(const Duration(seconds: 4), () {
      // Navigator.pushReplacementNamed(context, "login");
      Navigator.of(context).pushReplacementNamed("login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 233, 167),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: FadeTransition(
                      opacity: _animation,
                      child: const Image(
                          image: AssetImage('assets/images/logo.png')),
                    ),
                  ),
                ]),
          ]),
    );
  }
}
