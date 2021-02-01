import 'package:flutter/material.dart';



class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);
  final String title="Registrar Mascota";

  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<RegisterPage> {
  void crearusuario(String username, String password, String correo){

  }
  @override
  List<Widget> crearhijos(){
    TextEditingController _username=TextEditingController();
    TextEditingController _password=TextEditingController();
    TextEditingController _correo=TextEditingController();
    List<Widget> wid=[Row(mainAxisAlignment: MainAxisAlignment.center,children: [
      Column(mainAxisAlignment: MainAxisAlignment.start,children: [
        Container(width: 200,height: 40, child: TextField(controller: _username,decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Nombre de Usario'),),),
        SizedBox(height: 20,),
        Container(width: 200,height: 40, child:TextField(controller: _password,decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Contrasena'),),),
        SizedBox(height: 20,),
        Container(width: 200,height: 40, child:TextField(controller: _correo,decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Correo'),),),
        SizedBox(height: 20,),
        RaisedButton(onPressed: (){crearusuario(_username.text,_password.text,_correo.text);},child: Text('Registrar'),color: Colors.green,textColor: Colors.white,)
      ],),
    ],
    )];
    return wid;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(scrollDirection: Axis.vertical,shrinkWrap: true,
    children: crearhijos()),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
