class User {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final List<String> enrolledCourses;
  final Map<String, double> courseProgress;
  final Map<String, double> quizScores;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    this.enrolledCourses = const [],
    this.courseProgress = const {},
    this.quizScores = const {},
  });

  // Create a user from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profileImage: json['profileImage'] as String?,
      enrolledCourses: List<String>.from(json['enrolledCourses'] ?? []),
      courseProgress: Map<String, double>.from(json['courseProgress'] ?? {}),
      quizScores: Map<String, double>.from(json['quizScores'] ?? {}),
    );
  }

  // Convert user to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'enrolledCourses': enrolledCourses,
      'courseProgress': courseProgress,
      'quizScores': quizScores,
    };
  }

  // Create a copy of the user with updated fields
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImage,
    List<String>? enrolledCourses,
    Map<String, double>? courseProgress,
    Map<String, double>? quizScores,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      enrolledCourses: enrolledCourses ?? this.enrolledCourses,
      courseProgress: courseProgress ?? this.courseProgress,
      quizScores: quizScores ?? this.quizScores,
    );
  }
} 