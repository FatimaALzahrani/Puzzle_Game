// This code creates a simple 4x4 puzzle game where the tiles are represented by numbered boxes. The user can tap on a tile to move it to the empty space and try to solve the puzzle. The canMoveTile function checks if a tile can be moved based on its position relative to the empty tile. The swapTiles function swaps the positions of the selected tile and the empty tile. The shufflePuzzle function randomly shuffles the puzzle by making
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(PuzzleGame());

class PuzzleGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puzzle Game',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: PuzzleGamePage(),
    );
  }
}

class PuzzleGamePage extends StatefulWidget {
  @override
  PuzzleGamePageState createState() => PuzzleGamePageState();
}

class PuzzleGamePageState extends State<PuzzleGamePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
