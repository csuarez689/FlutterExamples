import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 250;

  bool _checked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            _makeSlider(),
            _makeCheckbox(),
            _makeSwitch(),
            _makeImage(),
          ],
        ),
      ),
    );
  }

  Widget _makeSlider() => Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen:',
      value: _sliderValue,
      min: 100,
      max: 500,
      onChanged: !_checked
          ? null
          : (value) {
              setState(() {
                _sliderValue = value;
              });
            });

  Widget _makeCheckbox() => CheckboxListTile(
        title: Text('Activar Slider'),
        value: _checked,
        onChanged: (value) {
          setState(() => _checked = value);
        },
      );

//  Widget _makeCheckbox()=>Checkbox(
//         value: _checked,
//         onChanged: (value) {
//           setState(() => _checked = value);
//         },
//       );

  Widget _makeImage() => Expanded(
        child: FadeInImage(
            fit: BoxFit.contain,
            fadeInDuration: Duration(milliseconds: 500),
            width: _sliderValue,
            placeholder: AssetImage(
              'resources/images/17.1 jar-loading.gif',
            ),
            image: NetworkImage(
                'https://images.squarespace-cdn.com/content/v1/577a6968f5e231f12b55b675/1497545668124-Z2X78HRAPNFBSU5JZ7DE/ke17ZwdGBToddI8pDm48kDPSVix_P0MDZBRZb2oVKtV7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UdYFy350IatWBeYB4-13wU4qQrDCk0Tx7C109UxNEKv8Iy6s5IQUKHhVn5UapeK2tg/DSCF5042.JPG?format=1000w')),
      );

  Widget _makeSwitch() => SwitchListTile(
        activeColor: Colors.pinkAccent,
        title: Text('Activar Slider'),
        value: _checked,
        onChanged: (value) {
          setState(() => _checked = value);
        },
      );
}
