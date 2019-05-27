import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  //const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text ('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0) ,
        children: <Widget>[
          _cardTtype1()
        ],
      ),

    );
  }



  Widget _cardTtype1() {

    return Card (
      child: Column(
        children: <Widget>[
          ListTile (
            leading: Icon(Icons.photo_album, color:Colors.blue),
            title: Text ('Soy el titulo de esta tarjeta'),
            subtitle: Text('aquié estamos escribiendo mucho en un texto que no tiene sentido, pero podría ser que si entra va bien y bnueno'),
          ),
          Row (
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton (
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              FlatButton (
                child: Text('OK'),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
    


  }




}