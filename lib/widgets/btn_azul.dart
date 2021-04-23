import 'package:flutter/material.dart';

class BtnAzul extends StatelessWidget {
  // final String text;
  final Widget child;
  final Function onPressed;

  const BtnAzul({
    Key key,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);
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
        child: Center(child: this.child
            // Text(
            //   this.text,
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 17,
            //   ),
            // ),
            ),
      ),
      onPressed: this.onPressed,
    );
  }
}
