import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'screens/profile_screen.dart';
import 'screens/matches_screen.dart';
import 'models/profile.dart';

void main() {
  runApp(const DatingApp());
}

class DatingApp extends StatelessWidget {
  const DatingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dating App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Profile> _matches = [];
  late MatchEngine _matchEngine;
  final List<SwipeItem> _swipeItems = [];

  @override
  void initState() {
    super.initState();
    _loadProfiles();
  }

  void _loadProfiles() {
    final profiles = [
      Profile(
        name: 'Alice',
        age: 25,
        bio: 'Loves hiking and coffee.',
        imageUrl: 'https://via.placeholder.com/300',
      ),
      Profile(
        name: 'Bob',
        age: 28,
        bio: 'Tech enthusiast and gamer.',
        imageUrl: 'https://via.placeholder.com/300',
      ),
      // Add more mock profiles as needed
    ];

    for (var profile in profiles) {
      _swipeItems.add(SwipeItem(
        content: profile,
        likeAction: () {
          _matches.add(profile);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('You liked ${profile.name}!')),
          );
        },
        nopeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('You passed on ${profile.name}.')),
          );
        },
      ));
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      SwipeScreen(matchEngine: _matchEngine),
      ProfileScreen(),
      MatchesScreen(matches: _matches),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dating App'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Swipe'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Matches'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}