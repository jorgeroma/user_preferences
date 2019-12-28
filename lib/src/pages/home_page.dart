import 'package:flutter/material.dart';
import 'package:user_preferences/src/shared/preferencias_usuario.dart';

import 'package:user_preferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    prefs.pagina = routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.color)?Colors.purpleAccent:Colors.blue,
      ),
      drawer: MenuWidget(routeName),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${prefs.color}'),
          Divider(),
          Text('Género: ${prefs.genero}'),
          Divider(),
          Text('Nombre: ${prefs.nombre}'),
          Divider(),
        ],
      ),
      
    );
  }

  
}