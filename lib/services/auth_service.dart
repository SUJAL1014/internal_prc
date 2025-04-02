import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService with ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;
  String? _error;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _currentUser != null;
  String? get error => _error;

  // Initialize the service and check if user is already logged in
  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('user');
      
      if (userJson != null) {
        _currentUser = User.fromJson(jsonDecode(userJson));
      }
    } catch (e) {
      _error = 'Failed to initialize authentication: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Sign up a new user
  Future<bool> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));
      
      // In a real app, you would make an API call to your backend
      // For this example, we'll just create a local user
      
      // Check if email already exists (simulated)
      if (email == 'test@example.com') {
        _error = 'Email already exists';
        _isLoading = false;
        notifyListeners();
        return false;
      }
      
      // Create a new user
      final newUser = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        email: email,
      );
      
      // Save user to local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonEncode(newUser.toJson()));
      
      _currentUser = newUser;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = 'Failed to sign up: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Log in an existing user
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));
      
      // In a real app, you would make an API call to your backend
      // For this example, we'll just check against a hardcoded user
      
      if (email == 'test@example.com' && password == 'password') {
        // Create a user object
        final user = User(
          id: '1',
          name: 'Test User',
          email: email,
          enrolledCourses: ['1', '2'],
          courseProgress: {'1': 0.75, '2': 0.3},
          quizScores: {'1': 85.0, '2': 70.0},
        );
        
        // Save user to local storage
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(user.toJson()));
        
        _currentUser = user;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _error = 'Invalid email or password';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = 'Failed to log in: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Log out the current user
  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Clear user from local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user');
      
      _currentUser = null;
    } catch (e) {
      _error = 'Failed to log out: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Clear any error messages
  void clearError() {
    _error = null;
    notifyListeners();
  }
} 