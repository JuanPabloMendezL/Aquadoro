import 'package:aquadoro/goals_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart ';
import 'package:google_fonts/google_fonts.dart';

class PantallaDeCarga extends StatefulWidget {
  PantallaDeCarga({Key key}) : super(key: key);

  @override
  _PantallaDeCargaState createState() => _PantallaDeCargaState();
}

class _PantallaDeCargaState extends State<PantallaDeCarga> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: GoalsPage(),
      title: Text('Aquadoro',
        style: GoogleFonts.mansalva(
          fontWeight: FontWeight.bold, 
          fontSize: 60.0, 
          color: Colors.blueGrey[50]
        ),
      ),

      image: Image.asset('assets/Acuadoro.png'),
      photoSize:120.0,
      backgroundColor: Colors.blueAccent,

    );
  }
}