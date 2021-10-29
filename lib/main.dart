import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Stateless Vs Stateful')),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [SinEstado(), ConEstado()],
      ),
    );
  }
}

class SinEstado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: EdgeInsets.all(100),
      child: Center(child: Text("Sin Estado (Stateless)")),
    );
  }
}

class ConEstado extends StatefulWidget {
  ConEstado({Key? key}) : super(key: key);

  @override
  _ConEstadoState createState() => _ConEstadoState();
}

class _ConEstadoState extends State<ConEstado> {
  late bool _activate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _activate = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _activate = !_activate;
        });
      },
      child: Container(
        color: (_activate ? Colors.blue : Colors.grey),
        padding: EdgeInsets.all(100),
        child: Center(
            child: (_activate
                ? Text("Cambie de estado! (Stateful)")
                : Text("Con Estado (Oprime sobre mi)"))),
      ),
    );
  }
}
