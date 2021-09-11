import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'register_page';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registro'),
          backgroundColor: Colors.red,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 200.0,
              ),
              Text(
                "Portal Ciudadano",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "Registro para la creación de cuenta en el Portal Ciudadano del Gobierno Autónomo Descentralizado Municipal de San Miguel de Ibarra (GAD-I)",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    _userTextField(),
                    SizedBox(
                      height: 15.0,
                    ),
                    _bottonLogin(),
                    SizedBox(
                      height: 15.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _userTextField() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              icon: Icon(
                Icons.account_circle,
                color: Colors.grey,
              ),
              fillColor: Colors.red,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              hintText: "Ruc o CI",
              labelStyle: TextStyle(
                color: Colors.grey, // <-- Change this
              ),
              labelText: "Ruc o CI"),
          onChanged: (value) {},
        ));
  });
}

Widget _bottonLogin() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: Colors.red,
      minimumSize: Size(double.infinity, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {},
        child: Text('Verificr Datos'),
      ),
    );
  });
}
