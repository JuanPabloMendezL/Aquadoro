import 'package:aquadoro/aquadoro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalCard extends StatefulWidget {
  GoalCard({
    this.animationController,
  });

  @override
  _GoalCardState createState() => _GoalCardState();

  String actividad;
  int tConc;
  int tDesc;
 
 final AnimationController animationController;
}

class _GoalCardState extends State<GoalCard> {
  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.linear,
      ),
      axisAlignment: 0.0,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          //width: anchoPantalla * 0.9,
          decoration: BoxDecoration(
            color: Color.fromRGBO(223, 255, 255, 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 13),
                child: _actividadInput(),
                width: anchoPantalla*0.45,
              ),
              Spacer(),
              Container(
                child: _concInput(),
                width: anchoPantalla*0.15,
              ),
              Spacer(),
              Container(
                child: _descInput(),
                width: anchoPantalla*0.15,
              ),
              Spacer(),
              Container(
                width: anchoPantalla*0.13,
                child: FlatButton(
                  onPressed: (){
                    print('Navegando');
                    if(
                      (widget.actividad !=null) &&
                      (widget.tConc !=null) &&
                      (widget.tDesc !=null)
                      ){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Aquadoro(
                              actividad: widget.actividad,
                              tConc: widget.tConc,
                              tDesc: widget.tDesc,
                            )
                          ),
                        );
                      }else{
                        //No hace nada si !null
                      }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: anchoPantalla*0.1,
                    color: Colors.cyan[700], 
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }//build

  String initAct(){
    if(widget.actividad ==null){
      return " ";
    }else{
      return "${widget.actividad.toString()}";
    }
  }

  String initConc(){
    if(widget.tConc ==null){
      return " ";
    }else{
      return "${widget.tConc.toString()}";
    }
  }

  String initDesc(){
    if(widget.tDesc ==null){
      return " ";
    }else{
      return "${widget.tDesc.toString()}";
    }
  }

  Widget _actividadInput(){
    return TextFormField(
      initialValue: initAct(),
      decoration: InputDecoration(
        labelText: "Actividad",
        labelStyle: GoogleFonts.craftyGirls(fontSize: 13),
      ),
      onChanged: (activity){
        widget.actividad = activity;
        print(activity);
      },
    );
  }

  Widget _concInput(){
    return TextFormField(
      initialValue: initConc(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "Focus",
        labelStyle: GoogleFonts.craftyGirls(fontSize: 13),
      ),
      onChanged: (tiempoConc){
        widget.tConc = (double.parse(tiempoConc)).toInt();
        print(tiempoConc);
      },
    );
  }

  Widget _descInput(){
    return TextFormField(
      initialValue: initDesc(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "Relax",
        labelStyle: GoogleFonts.craftyGirls(fontSize: 13),
      ),
      onChanged: (tiempoDesc){
        widget.tDesc = (double.parse(tiempoDesc)).toInt();
        print(tiempoDesc);
      },
    );
  }
}