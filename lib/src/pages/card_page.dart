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
          _cardTtype1(),
          SizedBox( height: 30.0,),
          _cardType2()
        ],
      ),

    );
  }



  Widget _cardTtype1() {

    return Card (

      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
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

  Widget _cardType2() {

    final card =  Container(
      child: Column (
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
            fadeInDuration: Duration( milliseconds: 200),
            height: 300,
            fit: BoxFit.cover
          ),
          // Image(
          //   image: NetworkImage('https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text ('Es un texto cualquiera de prueba')
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0,10.0)

          )
        ]
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }




}