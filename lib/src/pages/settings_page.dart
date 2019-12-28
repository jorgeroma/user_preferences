import 'package:flutter/material.dart';
import 'package:user_preferences/src/shared/preferencias_usuario.dart';
import 'package:user_preferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Jorge';

  TextEditingController _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    prefs.pagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.color;
    _nombre = prefs.nombre;
    _textController = new TextEditingController(text: _nombre);
  }

  _setSelectedRadio(int valor){
    prefs.genero = valor;
    _genero = valor;
    setState(() {});
  }

  _setColorSecundario(bool valor){
    prefs.color = valor;
    _colorSecundario = valor;
    setState(() {});
  }

  _setNombre(String valor){
    prefs.nombre = valor;
    _nombre = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.color)?Colors.purpleAccent:Colors.blue,
      ),
      drawer: MenuWidget(SettingsPage.routeName),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Colors Secundario'),
            onChanged: _setColorSecundario,
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,            
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              onChanged: _setNombre,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono',
                
              ),
            ),
          )

        ],
      ),
      
    );
  }
}