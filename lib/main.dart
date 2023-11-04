// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:listexample/NotasModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  AudioCache audioCache = AudioCache();
  late List<NotaModel> listaNotas=[];

  List<Widget> dibujarSonidos() {
    List<Widget> tmp = [];
    listaNotas.forEach((NotaModel notaModel) {
      tmp.add(buildKey(colorKey: notaModel.color,notas: notaModel.nota,ruta: notaModel.assets));
    });
    return tmp;
  }

 void llenarLista(){
    listaNotas.add(new NotaModel(1,Colors.pink,"Do","audios/note1.wav"));
    listaNotas.add(new NotaModel(2,Colors.indigo,"Re","audios/note2.wav"));
    listaNotas.add(new NotaModel(3,Colors.green,"Mi","audios/note3.wav"));
    listaNotas.add(new NotaModel(4,Colors.yellow,"Fa","audios/note4.wav"));
    listaNotas.add(new NotaModel(5,Colors.orange,"Sol","audios/note5.wav"));
    listaNotas.add(new NotaModel(6,Colors.brown,"La","audios/note6.wav"));
    listaNotas.add(new NotaModel(7,Colors.blue,"Si","audios/note7.wav"));

  }


  Widget buildKey(
    
      {required Color colorKey, required String notas,required String ruta}) {
        //{required NotaModel notaModel}) {
    return Expanded(
      child: Container(
        color: colorKey,
        child: TextButton(
          onPressed: () {
           // playNote(notaModel.note);
            final player = AudioPlayer();
            player.play(AssetSource(ruta));
          },
          child: Text(notas,
              style: TextStyle(fontSize: 25.0, color: Colors.white)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
  llenarLista();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Xylophone"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...dibujarSonidos(),
        ],
      ),
    );
  }
}