import 'package:flutter/material.dart';
import 'package:ibarra_portal/home_page.dart';
import 'package:ibarra_portal/register_page.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';
  /* Pagina de configuración de login */

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    /* Cuerpo de la pagina de la aplicación - Elemento vacío */
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            children: [
              /* Elementos de la pagina - inicio */

              /* Padding top distancia entre el borde superio hasta la imagen */
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
              ),
              /* Imagen .asset se usa para ingresar una durl relativa desde donde se va a recuperar la imagen */
              Image.asset(
                'assets/images/logo.png',
                height: 200.0,
              ),
              /* Texto- Text Style se usa para dar Estilos a los textos */
              Text(
                "Portal Ciudadano",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600),
              ),
              /* Container se usa para definir un contenedor, dento de el 
              se pueden agregar elementos 
              decoration: se usa para agregar estilos al container*/
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

                /* margin se usa para poner un margen a los elementos que se encuentran
                dentro del container, de la amisma manera el padding */
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(10.0),

                // color: Colors.white,
                /* agrega un widget hijo */
                child: Column(
                  /* y dentro del hijo se agrega un un widget con varios hijo */
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    /* Elemento input para el numero de cedula */
                    _userTextField(),
                    SizedBox(
                      height: 15.0,
                    ),
                    /* Elemento input para el numero de contraseña */
                    _passwordTextField(),
                    SizedBox(
                      height: 25.0,
                    ),
                    /* Elemento boton de registro */
                    _bottonLogin(),
                    SizedBox(
                      height: 15.0,
                    ),

                    /* BOntones de texto */
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text('¿No tiene cuenta? Regístrese aquí'),
                    ),
                    /* BOntones de texto */
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                      onPressed: () {},
                      child: Text('¿Olvidó su contraseña?'),
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

/* Instanciamos el elemento del campo de texto */
Widget _userTextField() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          /* Diseño */
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

Widget _passwordTextField() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              icon: Icon(
                Icons.fingerprint,
                color: Colors.grey,
              ),
              fillColor: Colors.red,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              hintText: "Ingresa tu contraseña",
              labelStyle: TextStyle(
                color: Colors.grey, // <-- Change this
              ),
              labelText: "Ingresa tu contraseña"),
          onChanged: (value) {},
        ));
  });
}

/* instacia el boton de login */
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Text('Ingresar'),
      ),
    );
  });
}
