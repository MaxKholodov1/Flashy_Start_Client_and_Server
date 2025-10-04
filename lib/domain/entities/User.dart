class User {
  final String userName;
  final String email;
  final DateTime? createdAt;

  User({
    required this.userName,
    required this.email,
    this.createdAt,
  });
  }
