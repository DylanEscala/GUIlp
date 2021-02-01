import 'package:flutter/material.dart';
import 'package:proyectolp/models/HTTPClient.dart';
import 'package:proyectolp/models/Pet.dart';
import 'package:proyectolp/widgets/PetWidget.dart';



class ManagerHomePage extends StatefulWidget {
  ManagerHomePage({Key key}) : super(key: key);
  final String title = "Ver mascotas";

  @override
  _ManagerHomeState createState() => _ManagerHomeState();
}

class _ManagerHomeState extends State<ManagerHomePage> {

  Future<List<Pet>> mascotas;

  @override
  void initState(){
    super.initState();
    mascotas = HTTPClient().verMascotas();

  }

  List<Widget> consultarMascotas(List<Pet> listaMascotas){
    List<Widget> lista = [];
    for(int i=0; i<listaMascotas.length; i++){
      lista.add(PetWidget(listaMascotas[i]).widgepantallainicio(context));
    }
    //petprueba.widgepantallainicio(context),petprueba2.widgepantallainicio(context),petprueba3.widgepantallainicio(context),petprueba.widgepantallainicio(context),petprueba3.widgepantallainicio(context)];
    /*llamada funcion que retorna lista de WidgetPet
    widgetpets()
    for (PetWidget mascota in null){
      lista.add(mascota.widgepantallainicio())
    }
    */
    //const SizedBox(width: 8),
    return lista;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Pet>>(
          future: mascotas,
          builder: (context, snapshot) {
            if(snapshot.hasData)
              return ListView(scrollDirection: Axis.vertical,shrinkWrap: true,
              children: (consultarMascotas(snapshot.data)),
              );
            else if (snapshot.hasError)
              return Text("${snapshot.error}");
            return CircularProgressIndicator();
      }
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
