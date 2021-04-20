import 'package:flutter/material.dart';

class BtnAzul extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: StadiumBorder(),
        primary: Color(0xff0D47A1),
      ),
      child: Container(
        height: 55,
        width: double.infinity,
        child: Center(
          child: Text(
            'Ingresar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
      onPressed: () {
        print('valores');
      },
    );
  }
}
