import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String username;
  final String name;
  final String email;

  const User({required this.username, required this.name, required this.email});

  @override
  List<Object?> get props => [username, name, email];

  User copyWith({String? username, String? name, String? email}) {
    return User(
      username: username ?? this.username,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'name': name, 'email': email};
  }

  @override
  String toString() {
    return 'User(username: $username, name: $name, email: $email)';
  }
}
