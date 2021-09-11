import 'package:flutter/material.dart';
import 'package:ibarra_portal/deudas_page.dart';
import 'package:ibarra_portal/predios_page.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Menú de inicio'),
          backgroundColor: Colors.red,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                minWidth: 300.0,
                height: 80.0,
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrediosPage()),
                  ),
                },
                color: Colors.grey[300],
                padding: EdgeInsets.all(10.0),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(
                      Icons.account_tree_rounded,
                      color: Colors.red,
                    ),
                    Text("Consulta de Predios")
                  ],
                ),
              ),
              /* MaterialButton(
                minWidth: 200.0,
                height: 80.0,
                onPressed: () {},
                color: Colors.grey,
                child: Text('Consulta de Predios',
                    style: TextStyle(color: Colors.black87)),
              ), */
              SizedBox(
                height: 15.0,
              ),
              FlatButton(
                minWidth: 300.0,
                height: 80.0,
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeudasPage()),
                  ),
                },
                color: Colors.grey[300],
                padding: EdgeInsets.all(10.0),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(
                      Icons.attach_money_rounded,
                      color: Colors.red,
                    ),
                    Text("Consulta de Deudas")
                  ],
                ),
              ),
              /* MaterialButton(
                minWidth: 200.0,
                height: 80.0,
                onPressed: () {},
                color: Colors.grey,
                child: Text('Consulta de Deudas',
                    style: TextStyle(color: Colors.black87)),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
