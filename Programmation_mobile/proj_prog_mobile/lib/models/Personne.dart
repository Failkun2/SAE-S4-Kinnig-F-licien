class Personne{
  final String prenom;
  final String nom;
  final String email;
  final String department;
  final String? imageUrl;

  Personne({
    required this.prenom,
    required this.nom,
    required this.email
    required this.department
    this.imageUrl,
  });
  factory Person.fromJson(Map<String, dynamic> json){
    return Personne(
      prenom: json['prenom'],
      nom: json['nom'],
      email: json['email'],
      department: json['departement'],
      imageUrl: json['imageUrl'],
    );
  }
}
