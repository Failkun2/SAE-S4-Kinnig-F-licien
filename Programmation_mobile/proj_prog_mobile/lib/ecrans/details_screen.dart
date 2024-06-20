import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/Personne.dart';

class DetailsScreen extends StatelessWidget{
  final Personne person;
  
  const DetailsScreet({Key? key, required this.person}) : super(key: key);

  void launchEmail() async{
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: person.email,
    );

    if(await canLaunch(emailLaunchUri.toString())){
      await launch(emailLaunchUri.toString());
    }else{
      throw 'Could not launch email client';
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/person.dart';

class DetailsScreen extends StatelessWidget {
  final Person person;

  const DetailsScreen({Key? key, required this.person}) : super(key: key);

  void _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: person.email,
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch email client';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${person.name} ${person.surname}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            person.imageUrl != null
                ? Image.network(person.imageUrl!)
                : const Icon(Icons.person, size: 100),
            const SizedBox(height: 16),
            Text('Nom : ${person.prenom} ${person.nom}'),
            const SizedBox(height: 8),
            Text('Adresse mail : ${person.email}'),
            const SizedBox(height: 8),
            Text('Departement : ${person.departement}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: launchEmail,
              child: const Text('Envoyer un e-mail'),
            ),
          ],
        ),
      ),
    );
  }
}