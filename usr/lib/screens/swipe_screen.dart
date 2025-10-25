import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/profile.dart';

class SwipeScreen extends StatelessWidget {
  final MatchEngine matchEngine;

  const SwipeScreen({super.key, required this.matchEngine});

  @override
  Widget build(BuildContext context) {
    return SwipeCards(
      matchEngine: matchEngine,
      itemBuilder: (BuildContext context, int index) {
        final profile = matchEngine.currentItem?.content as Profile?;
        if (profile == null) return Container();

        return Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                  child: CachedNetworkImage(
                    imageUrl: profile.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      '${profile.name}, ${profile.age}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8.0),
                    Text(profile.bio),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      onStackFinished: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No more profiles!')),
        );
      },
      itemChanged: (SwipeItem item, int index) {},
      upSwipeAllowed: false,
      fillSpace: true,
    );
  }
}