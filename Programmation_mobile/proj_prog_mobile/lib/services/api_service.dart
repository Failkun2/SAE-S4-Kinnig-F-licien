import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/Personne.dart';

class ApiService{
  static Future<List<Personne>> fetchPeople() async{
    final response = await http.get(Uri.parse('https://api.example.com/people'));
    if(response.statusCode == 200){
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Personne.fromJson(data)).toList();
    }else{
      throw Exception('erreur de chargement de personnes');
    }
  }
}