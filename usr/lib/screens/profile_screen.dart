import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: CachedNetworkImageProvider(
                'https://via.placeholder.com/150', // Placeholder for user's own profile
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Name: John Doe'),
            const Text('Age: 30'),
            const Text('Bio: Looking for meaningful connections!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Placeholder for edit profile
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit profile coming soon!')),
                );
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}