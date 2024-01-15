import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameHomePage(),
    );
  }
}

class GameHomePage extends StatefulWidget {
  @override
  _GameHomePageState createState() => _GameHomePageState();
}

class _GameHomePageState extends State<GameHomePage> {
  int player1Lives = 5;
  int player2Lives = 5;
  bool isPlayer1Turn = Random().nextBool();

  void _handleTap(bool isPlayer1Area) {
    setState(() {
      if (isPlayer1Turn) {
        player2Lives--;
      } else {
        player1Lives--;
      }
      isPlayer1Turn = !isPlayer1Turn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Game'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Implement settings logic
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          _buildPlayerArea(player1Lives, isPlayer1Turn, true),
          _buildPlayerArea(player2Lives, !isPlayer1Turn, false),
        ],
      ),
    );
  }

  Widget _buildPlayerArea(int lives, bool isTurn, bool isPlayer1Area) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _handleTap(isPlayer1Area),
        child: Container(
          color: isTurn ? Colors.white : Colors.grey,
          child: Center(
            child: Text(
              'Hearts: $lives',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
