import 'package:flutter/material.dart';


import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  
  //const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text ( 'Componentes')
      ),
      body: _list(),
    ); 
  }
      
  Widget _list() {

    return FutureBuilder (
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshopt) {
        return ListView(
          children: _listItems( snapshopt.data ),
        );
      },
    ); 
  }
      

  List <Widget> _listItems( List<dynamic> data) {

    final List<Widget> optionsList = [];

    data.forEach( (item) {
      final widgetTemp = ListTile (
        title: Text ( item['texto'] ),
        leading: getIcon(item['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: (){},
      );

      optionsList..add( widgetTemp )
                 ..add( Divider () );

    });

    return optionsList;




  }
}