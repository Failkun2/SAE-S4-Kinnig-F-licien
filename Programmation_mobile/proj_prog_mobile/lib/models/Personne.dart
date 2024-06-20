class Personne{
  final String prenom;
  final String nom;
  final int numBureau;
  final int numTelFixe;
  final int numTelMob;
  final String email;
  final String department;
  final String? imageUrl;

  Personne({
    required this.prenom,
    required this.nom,
    required this.numBureau,
    required this.numTelFixe,
    required this.numTelMob,
    required this.email,
    required this.department,
    this.imageUrl,
  });
  factory Person.fromJson(Map<String, dynamic> json){
    return Personne(
      prenom: json['prenom'],
      nom: json['nom'],
      numBureau: json['numBureau'],
      numTelFixe: json['numTelFixe'],
      numTelMob: json['numTelMob'],
      email: json['email'],
      department: json['departement'],
      imageUrl: json['imageUrl'],
    );
  }
}
