import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _date = '';
  String _selectedPower = 'Volar';
  List<String> _powers = [
    'Volar',
    'Rayos-X',
    'Inmortal',
    'Superfuerza',
    'Invisibilidad'
  ];

  TextEditingController _inputDateFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        children: <Widget>[
          _makeNameField(),
          Divider(),
          _makeEmailField(),
          Divider(),
          _makePasswordField(),
          Divider(),
          _makeDateField(context),
          Divider(),
          _makeDropdown(),
          Divider(),
          _createPersonTile()
        ],
      ),
    );
  }

  Widget _makeNameField() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Sólo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  Widget _makeEmailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Correo Electronico',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _makePasswordField() {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Contraseña',
        suffixIcon: Icon(Icons.visibility_outlined),
        icon: Icon(Icons.lock),
      ),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _makeDateField(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDateFieldController,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Fecha Nacimiento',
        suffixIcon: Icon(Icons.perm_contact_cal),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
      locale: Locale('es', 'AR'),
    );
    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputDateFieldController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> _getDropdownOptions() => _powers
      .map((item) => DropdownMenuItem(
            child: Text(item),
            value: item,
          ))
      .toList();

  Widget _makeDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30),
        Center(
          child: DropdownButton(
            value: _selectedPower,
            items: _getDropdownOptions(),
            onChanged: (selected) {
              setState(() => _selectedPower = selected);
            },
          ),
        ),
      ],
    );
  }

  Widget _createPersonTile() {
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Correo electronico: $_email'),
          Text('Contraseña: $_password'),
          Text('Fecha Nacimiento: $_date'),
          Text('Poder: $_selectedPower')
        ],
      ),
    );
  }
}
