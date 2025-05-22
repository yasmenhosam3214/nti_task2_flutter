

import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/donut.png'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Yasmen Hosam',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const Text('Flutterists', style: TextStyle(fontSize: 15)),
                const Text('100 points', style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("View Kodeco"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("logout"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
