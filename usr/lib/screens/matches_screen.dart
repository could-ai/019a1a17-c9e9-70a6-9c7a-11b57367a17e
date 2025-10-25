import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/profile.dart';

class MatchesScreen extends StatelessWidget {
  final List<Profile> matches;

  const MatchesScreen({super.key, required this.matches});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: matches.isEmpty
          ? const Center(
              child: Text('No matches yet. Keep swiping!'),
            )
          : ListView.builder(
              itemCount: matches.length,
              itemBuilder: (context, index) {
                final profile = matches[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(profile.imageUrl),
                  ),
                  title: Text('${profile.name}, ${profile.age}'),
                  subtitle: Text(profile.bio),
                  onTap: () {
                    // Placeholder for starting a chat
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Chat with ${profile.name} coming soon!')),
                    );
                  },
                );
              },
            ),
    );
  }
}