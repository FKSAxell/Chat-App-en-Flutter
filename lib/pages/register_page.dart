import 'package:chat/helpers/mostrar_alerta.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/widgets/btn_azul.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(titulo: 'Registro'),
                _Form(),
                Labels(
                    mensaje: '¿Ya tienes cuenta?',
                    textVinculo: 'Ingresa ahora!',
                    ruta: 'login'),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Términos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            textController: nameCtrl,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            isPassword: true,
            // keyboardType: TextInputType.emailAddress,
            textController: passCtrl,
          ),
          BtnAzul(
            text: 'Registrar',
            onPressed: (authService.registrando)
                ? null
                : () async {
                    //desaparecer teclado :D
                    FocusScope.of(context).unfocus();
                    final registroOk = await authService.register(
                      nameCtrl.text.trim(),
                      emailCtrl.text.trim(),
                      passCtrl.text.trim(),
                    );
                    if (registroOk == true) {
                      //TODO: Conectar a nuestro socket server
                      Navigator.pushReplacementNamed(context, 'usuarios');
                    } else {
                      //MOSTRAR ALERTA
                      mostrarAlerta(
                        context,
                        'Registro Incorrecto',
                        '$registroOk',
                      );
                    }
                  },
          )
        ],
      ),
    );
  }
}
