import 'package:flutter/material.dart';

class NotaModel{
  late int id;
  late Color color;
  late String assets;
  late String nota;


  NotaModel(int id,Color color,String nota, String assets){
    this.id=id;
    this.nota=nota;
    this.color=color;
    this.assets=assets;
  }
 
}