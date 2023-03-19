import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(PuzzleGame());

class PuzzleGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PuzzleGamePage(),
    );
  }
}

class PuzzleGamePage extends StatefulWidget {
  @override
  PuzzleGamePageState createState() => PuzzleGamePageState();
}

class PuzzleGamePageState extends State<PuzzleGamePage> {
  List<int> puzzleList = List.generate(16, (index) => index + 1);
  int emptyTileIndex = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: puzzleList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index == emptyTileIndex) {
            return Container();
          } else {
            return GestureDetector(
              onTap: () {
                if (canMoveTile(index)) {
                  setState(() {
                    swapTiles(index);
                  });
                }
              },
              child: Container(
                color: Color.fromARGB(255, 52, 6, 52),
                child: Center(
                  child: Text(
                    puzzleList[index].toString(),
                    style: TextStyle(fontSize: 37.0, color: Colors.white),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  bool canMoveTile(int tileIndex) {
    int rowDiff = (tileIndex / 4).toInt() - (emptyTileIndex / 4).toInt();
    int colDiff = (tileIndex % 4) - (emptyTileIndex % 4);
    if (rowDiff.abs() > 1 || colDiff.abs() > 1) {
      return false;
    }
    return (rowDiff == 0) || (colDiff == 0);
  }

  void swapTiles(int tileIndex) {
    int temp = puzzleList[tileIndex];
    puzzleList[tileIndex] = puzzleList[emptyTileIndex];
    puzzleList[emptyTileIndex] = temp;
    emptyTileIndex = tileIndex;
  }

  void shufflePuzzle() {
    for (int i = 0; i < 1000; i++) {
      List<int> movableTiles = [];
      for (int j = 0; j < puzzleList.length; j++) {
        if (canMoveTile(j)) {
          movableTiles.add(j);
        }
      }
      int randomIndex = movableTiles[Random().nextInt(movableTiles.length)];
      swapTiles(randomIndex);
    }
  }

  @override
  void initState() {
    super.initState();
    shufflePuzzle();
  }
}
