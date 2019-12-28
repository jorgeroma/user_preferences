import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{

//Modelo Singleton
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._();

  factory PreferenciasUsuario(){
    return _instancia;
  }

  PreferenciasUsuario._();


  SharedPreferences _prefs;
  // Ninguna de estas propiedades se usan
  // bool _colorSecundario;
  // int _genero;
  // String _nombre;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del _genero

  get genero{
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value){
    _prefs.setInt('genero', value);
  }
  
  
  // GET y SET del _colorSecundario

  get color{
    return _prefs.getBool('color') ?? false;
  }

  set color(bool value){
    _prefs.setBool('color', value);
  }


  // GET y SET del _nombre

  get nombre{
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(String value){
    _prefs.setString('nombre', value);
  }


  // GET y SET del _nombre

  get pagina{
    return _prefs.getString('pagina') ?? 'home';
  }

  set pagina(String value){
    _prefs.setString('pagina', value);
  }
  
}