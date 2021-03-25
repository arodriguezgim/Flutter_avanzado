import 'package:flutter/material.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email = "";
  String _password = "";

  _submit() {
    // Cuando pulso el boton Sign In
    final isOk = _formKey.currentState.validate();
    //print("form is Ok: $isOk");
    if (isOk) {
      // Adelante
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTablet ? 430 : 300,
          minWidth: 300,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: 'DIRECCION EMAIL',
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.5),
                onChanged: (text) {
                  _email = text;
                },
                validator: (text) {
                  if (!text.contains("@")) {
                    return "Email inválido";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: responsive.dp(2),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: Row(
                  children: [
                    Expanded(
                      child: InputText(
                        label: 'PASSWORD',
                        obscureText: true,
                        borderEnabled: false,
                        fontSize:
                            responsive.dp(responsive.isTablet ? 1.2 : 1.5),
                        onChanged: (text) {
                          _password = text;
                        },
                        validator: (text) {
                          if (text.trim().length == 0) {
                            return "Password Inválido";
                          }
                          return null;
                        },
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Password Olvidado",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: responsive.dp(1.6)),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: responsive.dp(5),
              ),
              TextButton(
                child: Text(
                  'Entrar',
                  style: TextStyle(
                      backgroundColor: Colors.pinkAccent,
                      fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.6)),
                ),
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.pinkAccent,
                    onSurface: Colors.grey,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40)),
                onPressed: _submit,
              ),
              SizedBox(
                height: responsive.dp(3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Eres un nuevo usuario en TravelAPP?",
                    style: TextStyle(fontSize: responsive.dp(1.5)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    child: Text(
                      'Registrarse',
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: responsive.dp(1.5)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: responsive.dp(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
