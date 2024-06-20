import 'package:flutter/material.dart';
import '../models/Personne.dart';

class PersonneTile extends StatelessWidget{
  final Personne person;
  final VoidCallback onTap;

  const PersonTile({Key? key, required this.person, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListTile(
      title: Text('${person.prenom} ${person.nom}'),
      subtitle: Text(person.departement),
      onTap: onTap,
    )
  }
}