// This code creates a simple 4x4 puzzle game where the tiles are represented by numbered boxes. The user can tap on a tile to move it to the empty space and try to solve the puzzle. The canMoveTile function checks if a tile can be moved based on its position relative to the empty tile. The swapTiles function swaps the positions of the selected tile and the empty tile. The shufflePuzzle function randomly shuffles the puzzle by making
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


  @override
  void initState() {
    super.initState();
  }
}
