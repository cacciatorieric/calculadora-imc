import 'package:flutter/material.dart';

class StandartButton extends StatelessWidget {
  const StandartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text(
        'Avançar',
        style: TextStyle(fontSize: 25),
      ),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          fixedSize: Size(MediaQuery.of(context).size.width*0.7, 58),
          onPrimary: Colors.white,
          primary: const Color.fromARGB(255, 53, 75, 52)),
    );
  }
}
