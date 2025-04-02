import '../models/course.dart';

final List<Course> courses = [
  Course(
    id: '1',
    title: 'Flutter Development',
    description: 'Learn Flutter from scratch and build beautiful cross-platform applications.',
    instructor: 'John Doe',
    thumbnailUrl: 'assets/images/flutter.jpg',
    youtubeUrl: 'https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG',
    lectures: [
      'Introduction to Flutter',
      'Setting up Flutter Development Environment',
      'Flutter Widgets Basics',
      'State Management in Flutter',
      'Navigation and Routing',
      'Working with APIs',
      'Database Integration',
      'Deploying Flutter Apps',
    ],
    quizzes: [
      Quiz(
        id: 'q1',
        title: 'Flutter Basics Quiz',
        description: 'Test your knowledge of Flutter fundamentals',
        dueDate: DateTime.now().add(const Duration(days: 7)),
        questions: [
          Question(
            question: 'What is Flutter?',
            options: [
              'A programming language',
              'A UI framework',
              'A database',
              'An operating system',
            ],
            correctOptionIndex: 1,
          ),
          Question(
            question: 'Which language is used to write Flutter apps?',
            options: [
              'Java',
              'Python',
              'Dart',
              'JavaScript',
            ],
            correctOptionIndex: 2,
          ),
        ],
      ),
    ],
  ),
  Course(
    id: '2',
    title: 'Web Development',
    description: 'Master modern web development with HTML, CSS, and JavaScript.',
    instructor: 'Jane Smith',
    thumbnailUrl: 'assets/images/webdevlopment.jpg',
    youtubeUrl: 'https://www.youtube.com/playlist?list=PL9gnSGHSqcnr_DxHsP7AW9ftq0AtAyYqJ',
    lectures: [
      'HTML Fundamentals',
      'CSS Styling',
      'JavaScript Basics',
      'Responsive Design',
      'Frontend Frameworks',
      'Backend Development',
      'Database Integration',
      'Web Security',
    ],
    quizzes: [
      Quiz(
        id: 'q2',
        title: 'Web Development Quiz',
        description: 'Test your knowledge of web development concepts',
        dueDate: DateTime.now().add(const Duration(days: 7)),
        questions: [
          Question(
            question: 'What does HTML stand for?',
            options: [
              'Hyper Text Markup Language',
              'High Text Markup Language',
              'Hyperlink and Text Markup Language',
              'Home Tool Markup Language',
            ],
            correctOptionIndex: 0,
          ),
          Question(
            question: 'Which of these is a CSS framework?',
            options: [
              'React',
              'Angular',
              'Bootstrap',
              'Node.js',
            ],
            correctOptionIndex: 2,
          ),
        ],
      ),
    ],
  ),
  Course(
    id: '3',
    title: 'AI & Machine Learning',
    description: 'Explore the world of artificial intelligence and machine learning.',
    instructor: 'Dr. Robert Johnson',
    thumbnailUrl: 'assets/images/aiml.png',
    youtubeUrl: 'https://www.youtube.com/playlist?list=PL9gnSGHSqcno1G2Xg3F6aIinPERyYlHfI',
    lectures: [
      'Introduction to AI',
      'Machine Learning Basics',
      'Deep Learning Fundamentals',
      'Neural Networks',
      'Natural Language Processing',
      'Computer Vision',
      'AI Ethics',
      'AI Applications',
    ],
    quizzes: [
      Quiz(
        id: 'q3',
        title: 'AI & ML Quiz',
        description: 'Test your understanding of AI and ML concepts',
        dueDate: DateTime.now().add(const Duration(days: 7)),
        questions: [
          Question(
            question: 'What is Machine Learning?',
            options: [
              'A programming language',
              'A type of computer',
              'A field of study that gives computers the ability to learn',
              'A software development tool',
            ],
            correctOptionIndex: 2,
          ),
          Question(
            question: 'Which of these is a popular deep learning framework?',
            options: [
              'Java',
              'Python',
              'TensorFlow',
              'HTML',
            ],
            correctOptionIndex: 2,
          ),
        ],
      ),
    ],
  ),
]; 