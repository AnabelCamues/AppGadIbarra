import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PrediosPage extends StatefulWidget {
  static String id = 'predios_page';

  @override
  _PrediosPageState createState() => _PrediosPageState();
}

class _PrediosPageState extends State<PrediosPage> {
  Future<dynamic> _getListadoPredios() async {
    final respuestaPredios = await http.get(Uri.parse(
        'https://desarrollosigm.ibarra.gob.ec/apimv/rest/getPrediosByCedula.php?cc=1002182556'));

    if (respuestaPredios.statusCode == 200) {
      return jsonDecode(respuestaPredios.body);
    } else {
      throw Exception("Fallo la conexión");
    }
  }

  @override
  void initState() {
    super.initState();
    _getListadoPredios();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Listado de predios'),
            backgroundColor: Colors.red,
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: FutureBuilder<dynamic>(
            future: _getListadoPredios(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot);
                return ListView(children: listado(snapshot.data));
              } else {
                print("No hay información");
                return Text("Sin data");
              }
            },
          )),
    );
  }
}

List<Widget> listado(List<dynamic> info) {
  List<Widget> lista = [];
  info.forEach((elemento) {
    String calle = 'S/N';
    if (elemento["calle"] != null) {
      calle = elemento["calle"];
    }
    lista.add(ListTile(
        onTap: () {},
        title: Text(elemento["barrio"] + " (" + elemento["tipo_predio"] + ")",
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Clave catastral: " + elemento["clave_cat"],
              style: TextStyle(
                  fontSize: 10.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.red[900])),
          Text(elemento["barrio"] +
              " - " +
              calle +
              " - " +
              elemento["numero_vivienda"]),
          Text(
            elemento["avaluo_municipal"] + ' Usd',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ])
        // trailing: Icon(Icons.arrow_forward_ios),
        ));
  });
  return lista;
}
