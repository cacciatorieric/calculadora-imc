import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CaixaGenerica extends StatelessWidget {
  const CaixaGenerica({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Evento ainda não habilitado, fique atento às proximas atualizações",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: const Color.fromARGB(220, 53, 75, 52),
                textColor: Colors.white,
                fontSize: 16.0,
              );
            },
            icon: const FaIcon(FontAwesomeIcons.google),
            color: const Color.fromARGB(255, 53, 75, 52),
            iconSize: 40,
          ),
          const SizedBox(
            width: 50,
          ),
          IconButton(
            onPressed: () { Fluttertoast.showToast(
                msg: "Evento ainda não habilitado, fique atento às proximas atualizações",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: const Color.fromARGB(220, 53, 75, 52),
                textColor: Colors.white,
                fontSize: 16.0,
              );},
            icon: const FaIcon(FontAwesomeIcons.facebook),
            color: const Color.fromARGB(255, 53, 75, 52),
            iconSize: 43,
          ),
        ],
      ),
    );
  }
}
