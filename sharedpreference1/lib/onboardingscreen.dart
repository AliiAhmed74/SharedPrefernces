import 'package:flutter/material.dart';
import 'package:sharedpreference1/ProfileDataStorage.dart'; // Ensure this path is correct
import 'package:sharedpreference1/cache/cache-helper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    _checkLastPage();
  }

  Future<void> _checkLastPage() async {
    String? lastPage = await Cachehelper().getData(key: 'lastPage');
    if (lastPage == 'AnotherPage') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileData()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to our App.."),
            ElevatedButton(
              onPressed: () async {
                await Cachehelper().setData(key: 'lastPage', value: 'AnotherPage');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileData()),
                );
              },
              child: Text('Enter'),
            ),
          ],
        ),
      ),
    );
  }
}