import 'package:chat/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarios = [
    Usuario(
      uid: '1',
      nombre: 'Zarinna',
      email: 'zarinna@correo.com',
      online: true,
    ),
    Usuario(
      uid: '2',
      nombre: 'Eros',
      email: 'eros@correo.com',
      online: true,
    ),
    Usuario(
      uid: '3',
      nombre: 'Shiroe',
      email: 'shiroe@correo.com',
      online: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Nombre', style: TextStyle(color: Colors.black54)),
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.black54),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400]),
            // child: Icon(Icons.offline_bolt, color: Colors.red),
          )
        ],
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, i) => ListTile(
          title: Text(usuarios[i].nombre),
          leading: CircleAvatar(
            child: Text(usuarios[i].nombre.substring(0, 2)),
          ),
          trailing: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: usuarios[i].online ? Colors.green[300] : Colors.red,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        separatorBuilder: (_, i) => Divider(),
        itemCount: usuarios.length,
      ),
    );
  }
}
