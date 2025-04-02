class Course {
  final String id;
  final String title;
  final String description;
  final String instructor;
  final String thumbnailUrl;
  final String youtubeUrl;
  final List<String> lectures;
  final List<Quiz> quizzes;
  final double progress;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.instructor,
    required this.thumbnailUrl,
    required this.youtubeUrl,
    required this.lectures,
    required this.quizzes,
    this.progress = 0.0,
  });
}

class VideoLecture {
  final String id;
  final String title;
  final String videoUrl;
  final String thumbnailUrl;
  final Duration duration;
  final bool isDownloaded;
  final double watchProgress;

  VideoLecture({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.duration,
    this.isDownloaded = false,
    this.watchProgress = 0.0,
  });
}

class CourseMaterial {
  final String id;
  final String title;
  final String fileUrl;
  final String fileType;
  final int fileSize;
  final bool isDownloaded;

  CourseMaterial({
    required this.id,
    required this.title,
    required this.fileUrl,
    required this.fileType,
    required this.fileSize,
    this.isDownloaded = false,
  });
}

class Quiz {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final List<Question> questions;
  final int timeLimit;

  Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.questions,
    this.timeLimit = 15,
  });
}

class Question {
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  Question({
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });
} 