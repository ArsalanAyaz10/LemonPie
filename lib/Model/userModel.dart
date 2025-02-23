class UserModel {
  final String userId;
  final String username;
  final String email;
  final DateTime dateOfBirth;
  final String profilePic; // Added profilePic field

  UserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.dateOfBirth,
    required this.profilePic,
  });

  // Factory method to create a User instance from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id']?.toString() ?? "",
      username: json['username'] ?? "Unknown",
      email: json['email'] ?? "No Email",
      dateOfBirth: DateTime.tryParse(json['date_of_birth'] ?? "") ?? DateTime(2000, 1, 1),
      profilePic: json['profile_pic'] ?? "", // Get profile picture URL
    );
  }

  // Convert a User object to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'username': username,
      'email': email,
      'date_of_birth': dateOfBirth.toIso8601String(),
      'profile_pic': profilePic, // Include profile picture URL
    };
  }
}
