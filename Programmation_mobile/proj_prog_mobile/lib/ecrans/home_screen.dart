import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/Personne.dart';
import '../services/api_service.dart';
import '../widgets/Personne_tile.dart';
import 'details_screen.dart';

class Homescreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override 
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  late Future<Liste<Personne>> futurePeople;
  String searchQuery = '';
  String? selectedDepartment;
  bool isAscending = true;

  @override
  void initState(){
    super.initState();
    futurePeople = ApiService.fetchPeople();
  }

  void updateSearchQuery(String query){
    setState((){
      searchQuery = query;
    });
  }

  void updateDepartment(String? departement){
    setState((){
      selectedDepartment = departement;
    });
  }

  void toggleSortOrder(){
    setState((){
      isAscending = !isAscending;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projet Mobile'),
        actions: [
          IconButton(
            icon: Icon(isAscending ? Icons.arrow_upward : Icons.arrow_downward),
            onpressed; toggleSortOrder,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Rechercher par nom',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: updateSearchQuery,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  hint: const Text('Selectionner un departement : '),
                  value: selectedDepartment,
                  onChanged: updateDepartment,
                  items: <String>[
                    'HR',
                    'IT',
                    'Finance',
                    //autres services
                  ].map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<Personne>>(
        future: futurePeople,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          } else if(snapshot.hasError){
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else{
            List<Person> people = snapshot.data!;
            if (searchQuery.isNotEmpty){
              people = people
                  .where((Personne) => Personne.prenom
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()))
                  .toList();
            }
            if(selectedDepartment != null){
              people = people
                  .where((Personne) => 
                      Personne.departement == selectedDepartment)
                  .toList();
            }
            people.sort((a, b) => isAscending
                ? a.name.compareTo(b.name)
                : b.name.compareTo(a.name));

            return ListView.builder(
              itemCount: people.length,
              itemBuilder: (context, index){
                return PersonTile(
                  person: people[index],
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(person: people[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}