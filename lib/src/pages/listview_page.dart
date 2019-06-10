import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListPage extends StatefulWidget {
  //ListPage({Key key}) : super(key: key);

  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _numberList = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addElements();

    _scrollController.addListener( (){

      if ( _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //_addElements();
        _fetchData();
      }      

    } );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text ('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading ()
        ],
      )
      
      
    );
  }


  Widget _createList () {

    return  RefreshIndicator(
            onRefresh: _getPageOne,
            child: ListView.builder(
            controller: _scrollController,
            itemCount: _numberList.length,
            itemBuilder: ( BuildContext context, int index) {

              final imageAt = _numberList[index];

              return FadeInImage(
                image: NetworkImage('https://picsum.photos/500/300/?image=$imageAt'),
                placeholder: AssetImage('assets/jar-loading.gif'),
              );
            },
          ),
    );
  }

  Future<Null> _getPageOne () async {

    final duration = new Duration(seconds: 2);
    new Timer(duration, () {

      _numberList.clear();
      _lastItem++;
      _addElements();

    });

    return Future.delayed(duration);

  }

  void _addElements () {

    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _numberList.add(_lastItem); 
    }
    print ( _numberList );
    setState(() {
    });
  }

  Future<Null> _fetchData() async {

    _isLoading = true;
    setState(() {});

    final duration = new Duration( seconds: 2);
    return new Timer( duration , httpResponse );
  }

  void httpResponse () {

    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100.0,
      curve: Curves.fastOutSlowIn,
      duration: Duration ( milliseconds:  250)
    );

    _addElements();


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  Widget _createLoading() {

    if (_isLoading ) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
              )
            ],
          ),
          SizedBox(
            height: 20.0,

          )

        ],
      );
    } else {
      return Container();
    }




  }




}