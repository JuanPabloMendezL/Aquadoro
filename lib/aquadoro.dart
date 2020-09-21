import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flare_flutter/flare_actor.dart';

class Aquadoro extends StatefulWidget {

  Aquadoro({
    this.actividad,
    this.tConc,
    this.tDesc,
  });

  final String actividad;
  final int tConc;
  final int tDesc;

  @override
  _AquadoroState createState() => _AquadoroState();
}

class _AquadoroState extends State<Aquadoro> {
  String tipAct="Focus";
  String tPant;
  int contador = 0;

  bool kindAct = false;

  //variables px func pomodoro
  int startSate = 1;
  int tConcSeg = 0;
  int tDescSeg = 0;

  bool revTConc = false;
  bool revTDesc = false;

  bool botDesh = false;
  bool resetDesh = false;

  String animacionActual = 'Reset';

  @override
  void initState() {
    
    super.initState();

    tPant = '${widget.tConc.toString()}:00';
    resetDesh = true;
  }

  @override
  Widget build(BuildContext context) {

    double ancho = MediaQuery.of(context).size.width;

    return Scaffold(
      /*appBar: AppBar(
        centerTitle: true,
        title: Text('Aquadoro'),
        backgroundColor: Colors.cyan[600],
      ),*/
      body: Stack( 
        children: [
          fondPomo(),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  _nuestroAppbar(context),
                  SizedBox(height: 40),
                  _contAcq(),
                  SizedBox(
                    height: 20,
                  ),
                  _aquadoroStack(ancho),
                  Expanded (child: Container()),
                  _button(),
                  Expanded (child: Container()),
                ],
              ),
            ),

          ),
        ],
      ),
    );
  }

  Widget fondPomo(){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Colors.cyan[400],
          Colors.cyan[800],
          ]
        ),
      ),
    );
  }

  Widget _nuestroAppbar(BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width:50,
          child: FlatButton(
            padding: EdgeInsets.only(right: 10, top:10),
            onPressed: (){
              Navigator.pop(context);
            }, 
            child: Icon(
              Icons.arrow_back_ios, 
              size: 35, 
              color: Colors.cyan[100],
            ),
          ),
        ),
          Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 10,),             
            child: Text(
              widget.actividad, 
              style: GoogleFonts.craftyGirls(
                fontSize: 30, 
                fontWeight: FontWeight.bold, 
                color: Colors.cyan[50]),
            ),
          ),
        ),
      ]
    );
  }

  Widget _contAcq(){
    switch (contador){
      case 1:
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.av_timer, 
            color: Colors.teal[50],
            size: 45,
          ),
        ]
      );

      break;

      case 2:
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.av_timer, 
            color: Colors.teal[50],
            size: 45,
          ),
          Icon(
            Icons.av_timer, 
            color: Colors.teal[50],
            size: 45,
          ),
        ]
      );

      break;

      case 3:
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.av_timer, 
            color: Colors.teal[50],
            size: 45,
          ),
          Icon(
            Icons.av_timer, 
            color: Colors.teal[50],
            size: 45,
          ),
          Icon(
            Icons.av_timer, 
            color: Colors.teal[50],
            size: 45,
          ),
        ]
      );

      break;

      case 4:
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.av_timer, 
            color: Colors.teal[50],
            size: 45,
          ),
          Icon(
            Icons.av_timer, 
            color: Colors.teal[50],
            size: 45,
          ),
          Icon(
            Icons.av_timer, 
            color: Colors.teal[50],
            size: 45,
          ),
          Icon(
            Icons.av_timer, 
            color: Colors.teal[50],
            size: 45,
          ),
        ]
      );

      break;

      case 5:
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.av_timer, 
            color: Colors.teal[50],
            size: 45,
          ),
          Icon(
            Icons.av_timer, 
            color: Colors.teal[50],
            size: 45,
          ),
          Icon(
            Icons.av_timer, 
            color: Colors.teal[50],
            size: 45,
          ),
          Icon(
            Icons.av_timer, 
            color: Colors.teal[50],
            size: 45,
          ),
          Icon(
            Icons.av_timer, 
            color: Colors.teal[50],
            size: 45,
          ),
        ]
      );

      break;

      default: return Container(
        height: 45,
      );
    }

  }

  Widget _aquadoroStack(double ancho){
    return Stack(
      children: <Widget>[
        /*Container(
          width: 357, 
          height: 357,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage('assets/Acuadoro.png'), fit: BoxFit.cover),
          )
        ),*/
        Container(
          width: 400,
          height: 400,
          child: FlareActor(
            'assets/Acquadoro.flr',
            alignment: Alignment.center,
            fit: BoxFit.cover,
            animation: animacionActual,
          ),
        ),
        Positioned(
          top: 160,
          left: ancho*0.25,
          child: Container(
            height: 100,
            width: 170,
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(tipAct, 
                  style: GoogleFonts.craftyGirls(fontSize: 25, color: Colors.blueGrey[50]),
                  ),
                ),
                Center(
                  child: Text(
                    tPant,
                    style: GoogleFonts.craftyGirls(fontSize: 25, color: Colors.blueGrey[50]),
                  ),
                ),
              ]
            ),
          ),
        ),
      ],
    );
  }

  Widget _button(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget> [
        AbsorbPointer(
          absorbing: resetDesh,
          child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
            color: Colors.cyan[200],
            child: Row(
              children: <Widget>[
                Text('Reset', 
                style: GoogleFonts.craftyGirls(fontSize: 25, color: Colors.teal[900]),),

                Icon(Icons.rotate_left,
                size: 25, 
                color: Colors.teal[900],
                ),

              ]
            ),
            onPressed: () {
              animacionActual = "Reset";
              if(tConcSeg>1){
                revTConc = true;
                startSate = 1;
                print('Le diste on reset on focus');
              }else if(tConcSeg > 1)
              revTDesc = true;
              startSate = 1;
              kindAct = false;
              tipAct = 'Focus';
              tPant = '${widget.tConc.toString()}:00';
              print('Le duste en reser de relax y te regresa a focus');
            },
          ),
        ),

        AbsorbPointer(
          absorbing: botDesh,
          child: OutlineButton(
            borderSide: BorderSide (
              width: 3, color: Colors.blue[900], style: BorderStyle.solid
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              children: <Widget>[
                Text(tipAct, 
                  style: GoogleFonts.craftyGirls(
                    fontSize: 25, 
                    color: Colors.indigo[800],
                  ),
                ),
                Icon(
                  (kindAct) ? Icons.adjust : Icons.album, 
                  size: 25, 
                  color: Colors.blue[900]),
              ]
            ),
            onPressed: (){
              switch(startSate){
                case 1:
                //T Focus
                {
                  setState(() {
                    botDesh = true;
                    resetDesh = false;
                    animacionActual = 'LoopFocus';
                  });
                  tConcSeg = (widget.tConc*60);
                  Timer.periodic(Duration(seconds: 1), (t){               
                    setState(() {
                      if(tConcSeg<1 || revTConc == true){
                        t.cancel();
                        revTConc = false;
                        tPant = '${widget.tConc.toString()}:00';
                        botDesh = false;
                        resetDesh = true;

                        if(tConcSeg<1){
                          startSate = 2;
                          tipAct ="Relax";
                          kindAct = true;
                          tPant = '${widget.tDesc.toString()}:00';

                          if (contador == 4){
                            _mostAler(context);
                            contador = 5;
                            tPant = '${30}:00';
                          }else{
                            tPant = '${widget.tDesc}:00';
                          }
                        }


                      }else if(tConcSeg<60){
                        tPant = '$tConcSeg';
                        tConcSeg--;
                      }else{
                        int m = tConcSeg ~/60;
                        int s = tConcSeg - (60*m);
                        if(s<10){
                          tPant='$m:0$s';
                        }else{
                          tPant='$m:$s';
                        }
                        tConcSeg--;
                      }

                      if(tConcSeg<11){
                        animacionActual = "FinFocus";
                      }
                      
                    });

                  });
                }
                break;

                case 2:
                {
                  setState(() {
                    botDesh = true;
                    resetDesh = false;
                    animacionActual = "LoopRelax";
                  });
                  tDescSeg = (widget.tDesc*60);
                  Timer.periodic(Duration(seconds: 1), (t){               
                    setState(() {
                      if(tDescSeg<1 || revTDesc == true){
                        t.cancel();
                        revTDesc = false;
                        tPant = '${widget.tConc.toString()}:00';
                        botDesh = false;
                        resetDesh = true;

                        if(tConcSeg<1){
                          startSate = 1;
                          tipAct ="Focus";
                          kindAct = false;
                          tPant = '${widget.tConc.toString()}:00';
                          if (contador < 4){//mostrar alerta
                            contador++;
                          }
                        }


                      }else if(tDescSeg<60){
                        tPant = '$tDescSeg';
                        tDescSeg--;
                      }else{
                        int m = tDescSeg ~/60;
                        int s = tDescSeg - (60*m);
                        if(s<10){
                          tPant='$m:0$s';
                        }else{
                          tPant='$m:$s';
                        }
                        tDescSeg--;
                      }
                      if(tDescSeg<11){
                        animacionActual = "FinRelax";
                      }
                    });

                  });
                }

                break;

                case 3:
                {
                  setState(() {
                    botDesh = true;
                    resetDesh = false;
                  });
                  tDescSeg = (30*60);
                  Timer.periodic(Duration(seconds: 1), (t){               
                    setState(() {
                      if(tDescSeg<1 || revTDesc == true){
                        t.cancel();
                        revTDesc = false;
                        tPant = '${widget.tConc.toString()}:00';
                        botDesh = false;
                        resetDesh = true;

                        if(tConcSeg<1){
                          startSate = 1;
                          tipAct ="Focus";
                          kindAct = false;
                          tPant = '${widget.tConc.toString()}:00';
                          contador=0;
                        }


                      }else if(tDescSeg<60){
                        tPant = '$tDescSeg';
                        tDescSeg--;
                      }else{
                        int m = tDescSeg ~/60;
                        int s = tDescSeg - (60*m);
                        if(s<10){
                          tPant='$m:0$s';
                        }else{
                          tPant='$m:$s';
                        }
                        tDescSeg--;
                      }

                      if(tDescSeg<11){
                        animacionActual = "FinRelax";
                      }

                    });

                  });
                }
                break;
                default:
              }
            }
          ),
        ),

      ],


    );
  }

  void _mostAler(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.teal[200],
          elevation: 25,
          title: Text('\t\t Felicidades:', 
            style: GoogleFonts.craftyGirls(
              fontSize: 30, color: Colors.blue[900],
            )
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children:<Widget> [
              Text('Haz realizado 5 pomodoros seguidos', 
                style: GoogleFonts.craftyGirls(fontSize: 20.5, color: Colors.indigo[900]),
              ),
              Text('Te recomendamos dividir esta meta en una más pequeña para disminuir la carga',
                style: GoogleFonts.craftyGirls(fontSize: 20, color: Colors.indigo[900]),
              ),
              Text('¿Nos tomamos un descanso de 30 minutos?',
              style: GoogleFonts.craftyGirls(fontSize: 20.5, color: Colors.indigo[900]),
              ),
              Image.asset('assets/AlertImage.png', 
                fit: BoxFit.cover, height: 170,
              ),
            ]
          ),
          actions: [
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
              }, 
              child: Text('Subdividir', 
                style: GoogleFonts.craftyGirls(fontSize: 24, color: Colors.lightBlue[800])
              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
                setState(() {
                  startSate = 3;
                  print('Se mando al startState 3');
                });
              },
              child: Text('Descansar', 
                style: GoogleFonts.craftyGirls(fontSize: 24, color: Colors.lightBlue[700])
              ),
            )
          ],
        );
      }
    );
  }

}