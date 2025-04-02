import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final user = authService.currentUser;
    
    if (user == null) {
      return const Scaffold(
        body: Center(
          child: Text('User not found'),
        ),
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: user.profileImage != null
                  ? NetworkImage(user.profileImage!)
                  : null,
              child: user.profileImage == null
                  ? const Icon(Icons.person, size: 50)
                  : null,
            ),
            const SizedBox(height: 16),
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Student ID: ${user.id}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            _buildStatCard(
              context,
              'Courses Enrolled',
              user.enrolledCourses.length.toString(),
              Icons.book,
            ),
            const SizedBox(height: 16),
            _buildStatCard(
              context,
              'Completed Courses',
              user.courseProgress.values.where((progress) => progress >= 1.0).length.toString(),
              Icons.check_circle,
            ),
            const SizedBox(height: 16),
            _buildStatCard(
              context,
              'Average Score',
              user.quizScores.isEmpty
                  ? 'N/A'
                  : '${(user.quizScores.values.reduce((a, b) => a + b) / user.quizScores.length).toStringAsFixed(1)}%',
              Icons.assessment,
            ),
            const SizedBox(height: 32),
            _buildSectionTitle('Account Settings'),
            _buildSettingsTile(
              context,
              'Personal Information',
              Icons.person,
              () {
                // TODO: Navigate to personal information
              },
            ),
            _buildSettingsTile(
              context,
              'Notification Settings',
              Icons.notifications,
              () {
                // TODO: Navigate to notification settings
              },
            ),
            _buildSettingsTile(
              context,
              'Download Settings',
              Icons.download,
              () {
                // TODO: Navigate to download settings
              },
            ),
            _buildSettingsTile(
              context,
              'Privacy Settings',
              Icons.privacy_tip,
              () {
                // TODO: Navigate to privacy settings
              },
            ),
            _buildSettingsTile(
              context,
              'Help & Support',
              Icons.help,
              () {
                // TODO: Navigate to help & support
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await authService.logout();
                if (context.mounted) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
              ),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).primaryColor,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
} 