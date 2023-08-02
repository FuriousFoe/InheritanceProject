class User {
  final String imagePath;
  final String name;
  final String email;
  final bool isDarKMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.isDarKMode, 
  });

  User copy({
    String? imagePath,
    String? name,
    String? email,
    bool? isDarKMode,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        isDarKMode: isDarKMode ?? this.isDarKMode,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        isDarKMode: json['isDarKMode'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'isDarKMode': isDarKMode,
      };
}
