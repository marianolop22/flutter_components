import 'package:flutter/material.dart';


//librerias mias
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components App',
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes (),
      onGenerateRoute: ( RouteSettings routeSettings ) { //si no está configurada la pantalla (en routes) a la que quiero ir, te mando a la alerta
        return MaterialPageRoute (
          builder: (BuildContext context) => AlertPage()
        );
      },
    );
  }
}