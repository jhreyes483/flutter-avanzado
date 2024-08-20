

import 'package:chat/services/auth_service.dart';
import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  //const UsuariosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 245, 245),

      body: SafeArea(
        child: SingleChildScrollView(
              physics: BouncingScrollPhysics(), // efecto de salto cuando se hace socroll hacie abajo
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9, // ocupa el 90 % de la pantalla 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(titulo: 'Messenger'),
                _From(),
                Labels(rutaNavegar: 'register', texto1: 'No tienes cuenta ?', texto2: 'Crea una ahora!'),
                
                Text('Terminos y condiciones', style: TextStyle(fontWeight: FontWeight.w200))
              ],
            ),
          ),
        ),
      )
    );
  }
}


class _From extends StatefulWidget {
  //const _From({super.key});

  @override
  State<_From> createState() => __FromState();
}

class __FromState extends State<_From> {

  final emailCtrl = TextEditingController();
  final passCtrl  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric( horizontal: 50),

      child: Column(
        children: [
          CustomInput(
            icon           : Icons.mail_outline, 
            placeholder    : 'Correo', 
            keyboardType   : TextInputType.emailAddress,
            textController : emailCtrl, 
          ),
          CustomInput(
            icon           : Icons.lock, 
            placeholder    : 'Contraseña', 
            isPassword     : true,
            textController : passCtrl, 
          ),

          BotonAzul(
            text      : 'Ingrese', 
            onPressed : (){
              print('Texto de botón');
              print('Email: ${emailCtrl.text}');
              print('Contraseña: ${passCtrl.text}');

              final authService = Provider.of<AuthService>(context, listen: false);
              authService.login(emailCtrl.text, passCtrl.text);
            }
          )
        ],
      ),
    );
  }

}

