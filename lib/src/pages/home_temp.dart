import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  
  //const HomePageTemp({Key key}) : super(key: key);

  final List<String> options = ['uno','dos','tres','cuatro','cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text ('Components Temp')
      ),
      body: ListView(
        children: _createItemsMap()

      ),
    );
  }


  List<Widget> _createItems () {

    List<Widget> widgetList = new List<Widget>();

    for ( String item in options ) {

      final temp = ListTile (
        title: Text ( item ),
      );

      widgetList..add( temp )
                ..add( Divider ());
    }
    return widgetList;
  }

  List<Widget> _createItemsMap () {
    return options.map( ( item ){
      return Column(
        children: <Widget>[
          ListTile (
            title: Text ( item + '!'),
            subtitle: Text('un subtitulo'),
            leading: Icon (Icons.account_circle),
            trailing: Icon ( Icons.keyboard_arrow_right),
            onTap: (){},

          ),
          Divider()
        ],
      );
    }).toList();
  }




}