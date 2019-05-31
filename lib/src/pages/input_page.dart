import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  //InputPage({Key key}) : super(key: key);

  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = "";
  String _email = "";
  String _password = "";
  String _date = "";
  String _powerSelected = "Volar";
  TextEditingController _inputFieldDateController = new TextEditingController();
  List<String> _powers = ['Volar', 'Rayos X', 'Super Aliento','Super Fuerza'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Inputs de Texto')
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate( context ),
          Divider(),
          _createDropDown(),
          Divider(),
          _createPerson (),
        ],
      ),
    );
  }

  Widget _createInput() {

    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_name.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon (Icons.accessibility), //icono interno
        icon: Icon (Icons.account_circle)
      ),
      onChanged: (inputName){
        _name = inputName;
        setState(() {
          
        });
      }

    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text ('Nombre es $_name' ),
      subtitle: Text ('Email $_email'),
      trailing: Text(_powerSelected),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon (Icons.alternate_email), //icono interno
        icon: Icon (Icons.email)
      ),
      onChanged: (inputEmail){
        _email = inputEmail;
        setState(() {
        });
      }
    );
  }


  Widget _createPassword () {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        suffixIcon: Icon (Icons.lock_open), //icono interno
        icon: Icon (Icons.lock)
      ),
      onChanged: (inputPassword){
        _password = inputPassword;
        setState(() {
        });
      }
    );
  }

  Widget _createDate( BuildContext context) {

    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de Nacimiento',
        labelText: 'Fecha de Nacimiento',
        suffixIcon: Icon (Icons.perm_contact_calendar), //icono interno
        icon: Icon (Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus( new FocusNode() );
        _selectDate( context );
      },
    );
  }

  void _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale ('es','ES')
    );

    if (picked != null) {
      setState(() {
        _date = DateFormat ( 'dd-MM-yyyy' ).format(picked);
        _inputFieldDateController.text = _date;
      });
    }
  }


  List<DropdownMenuItem<String>> getDropDownOptions() {

    List<DropdownMenuItem<String>> tmpList = new List()  ;

    _powers.forEach( (poder) {

      tmpList.add( DropdownMenuItem (

        child: Text (poder), //esto es lo que voy a mostrar
        value: poder,
      ));
    });

    return tmpList;
  }


  Widget _createDropDown() {

    return Row (
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
                  child: DropdownButton(
            value: _powerSelected,
            items: getDropDownOptions(),
            onChanged: ( opt ){
              setState(() {
                _powerSelected = opt;
                
              });
            },
          ),
        )
      ],
    );
  }



}