import 'package:flutter/material.dart';
import 'ecrans/home_screen.dart';

void main(){
  runApp(const Proj_mobile()):
}

class Proj_prog_mobile extends StatelessWidget{
  const Proj_mobile({Key? key}) : super(key: key);

  @override
  Widgetbuild(BuildContext context){
    return MaterialApp(
      title: 'Projet Mobile',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: const HomeScreen(),
    );
  }
}