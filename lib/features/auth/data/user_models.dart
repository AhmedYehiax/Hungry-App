class UserModels {
  final String name;
  final String email;
  final String? token;
  final String? image; 
  final String? address;
  final String? visa;



  UserModels({
    required this.name,
    required this.email,
    this.token,
    this.image,
    this.address,
    this.visa,
  });

  factory UserModels.fromJson(Map<String, dynamic> json) {
    return UserModels(
      name: json['name']?? '',
      email: json['email']?? '',
      token: json['token']?? '',
      image: json['image'],
      address: json['address'],
      visa: json['visa'],
    );
  }
}