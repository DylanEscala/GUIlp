import 'package:flutter/material.dart';



class ManagerHomePage extends StatefulWidget {
  ManagerHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ManagerHomeState createState() => _ManagerHomeState();
}

class _ManagerHomeState extends State<ManagerHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  List<Widget> consultarMascotas(){
    List<Widget> lista = [
      TextButton(
        child: const Text('New Pet'),
        onPressed: () {/* ... */},
      ),
      const SizedBox(width: 8),
      TextButton(
        child: const Text('New Pet'),
        onPressed: () {/* ... */},
      ),
      const SizedBox(width: 8),
    ];
    lista.add(TextButton(
      child: const Text('New Pet'),
      onPressed: () {/* ... */},
    ));
    return lista;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: (consultarMascotas()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
