import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
        child: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/notes.png',
          height: 200,
          width: 200,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          'No Note :(',
          style: GoogleFonts.openSans(
            fontSize: 25,
            color: const Color.fromARGB(255, 46, 46, 46),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text('You have no task to do',
            style: GoogleFonts.openSans(
              fontSize: 18,
              color: const Color.fromARGB(255, 104, 104, 104),
              fontWeight: FontWeight.normal,
            ))
      ],
    ))),);
  }
}
