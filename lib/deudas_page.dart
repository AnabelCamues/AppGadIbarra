import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DeudasPage extends StatefulWidget {
  static String id = 'deudas_page';

  @override
  _DeudasPageState createState() => _DeudasPageState();
}

class _DeudasPageState extends State<DeudasPage> {
  // @override
  String cedula = '1700610064';
  String url =
      'https://desarrollosigm.ibarra.gob.ec/apimv/rest/getDeudasByCedula.php?cc=';
  Future<dynamic> _getListado() async {
    final respuesta = await http.get(Uri.parse(url + cedula));

    if (respuesta.statusCode == 200) {
      return jsonDecode(respuesta.body);
    } else {
      throw Exception("Fallo la conexión");
    }
  }

  @override
  void initState() {
    super.initState();
    _getListado();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Listado de deudas'),
            backgroundColor: Colors.red,
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: FutureBuilder<dynamic>(
            future: _getListado(),
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
    lista.add(ListTile(
      onTap: () {
        print(elemento["op_operacion"]);
      },
      title: Text(elemento["op_operacion"] + " (" + elemento["op_saldo"] + ")",
          style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(elemento["op_comentario"]),
      // trailing: Icon(Icons.arrow_forward_ios),
    ));
  });
  return lista;
}
