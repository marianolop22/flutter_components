import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  //SliderPage({Key key}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}


class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 100.00;
  bool _blockCheck = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold (

      appBar: AppBar(
        title: Text('Slider')
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(
              child: _createImage()
            ),
          ],
        )
      ),

    );
  }

  Widget _createSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      //divisions: 20,
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: (_blockCheck) ? null :  ( double cValue ) {
        setState(() {
          _sliderValue = cValue;
        });
      },
    );
  }

  Widget _createImage() {

    return Image(
      image: NetworkImage( 'http://pngimg.com/uploads/batman/batman_PNG111.png' ),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckBox() {

    // return Checkbox(
    //   value: _blockCheck,
    //   onChanged: ( checked ){
    //     setState(() {
    //       _blockCheck = checked;
    //     });
    //   },
    // );

    return CheckboxListTile(
      value: _blockCheck,
      onChanged: ( checked ){
        setState(() {
          _blockCheck = checked;
        });
      },
      title: Text('Bloquear slider'),
    );
  }

  Widget _createSwitch() {

    return SwitchListTile(
      value: _blockCheck,
      onChanged: ( checked ){
        setState(() {
          _blockCheck = checked;
        });
      },
      title: Text('Bloquear slider'),
    );

  }
}