import 'package:flutter/material.dart';

class SmallBtn extends StatelessWidget {
  const SmallBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text(
        '→',
        style: TextStyle(fontSize: 25),
      ),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          fixedSize: const Size(80, 60),
          onPrimary: const Color.fromARGB(255, 53, 75, 52),
          primary: Colors.white),
    );
  }
}
