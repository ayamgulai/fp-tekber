class User {
  final String username;
  final String password;

  User({
    required this.username,
    required this.password,
  });

  // Method untuk mengubah objek User menjadi Map (untuk dikirim ke backend)
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }

  // Method untuk membuat objek User dari Map (response dari backend)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
    );
  }
}
