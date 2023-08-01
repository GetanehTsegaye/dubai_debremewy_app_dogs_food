import 'package:flutter/material.dart';

class PuzzlePlayScreen extends StatefulWidget {
  @override
  _PuzzlePlayScreenState createState() => _PuzzlePlayScreenState();
}

class _PuzzlePlayScreenState extends State<PuzzlePlayScreen> {
  int moveCount = 0;
  bool isGameStarted = false;
  List<int> puzzlePieces = [];
  int emptyTileIndex = 15;
  Stopwatch stopwatch = Stopwatch();
  String formattedTime = '00:00:00';

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    // Reset game state
    setState(() {
      moveCount = 0;
      isGameStarted = true;
    });

    // Generate puzzle pieces
    puzzlePieces = List.generate(16, (index) => index + 1);
    emptyTileIndex = 15;
    shufflePuzzle();

    stopwatch.reset();
    stopwatch.start();
    updateTimer();
  }

  void shufflePuzzle() {
    // Shuffle the puzzle pieces
    puzzlePieces.shuffle();
  }

  @override
  void dispose() {
    stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Move Counter

            SizedBox(height: 20),
            // Puzzle Grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 4x4 grid
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: 16,
              itemBuilder: (context, index) {
                int puzzlePiece = puzzlePieces[index];

                if (puzzlePiece == 16) {
                  // Empty tile
                  return DragTarget<int>(
                    onWillAccept: (data) {
                      int dataIndex = puzzlePieces.indexOf(data!);
                      int emptyRow = emptyTileIndex ~/ 4;
                      int emptyCol = emptyTileIndex % 4;
                      int dataRow = dataIndex ~/ 4;
                      int dataCol = dataIndex % 4;
                      return (emptyRow == dataRow && (emptyCol - dataCol).abs() == 1) ||
                          (emptyCol == dataCol && (emptyRow - dataRow).abs() == 1);
                    },
                    onAccept: (data) {
                      setState(() {
                        int dataIndex = puzzlePieces.indexOf(data);
                        puzzlePieces[emptyTileIndex] = data;
                        puzzlePieces[dataIndex] = 16;
                        emptyTileIndex = dataIndex;
                        moveCount++;
                      });
                      checkIfGameIsSolved();
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        color: Colors.white,
                      );
                    },
                  );
                } else {
                  // Puzzle tile
                  return Draggable<int>(
                    data: puzzlePiece,
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Container(
                        color: Colors.blueGrey,
                        child: Image.asset(
                          'assets/images/puzzle/puzzle_piece_$puzzlePiece.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    feedback: Material(
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: Container(
                          color: Colors.transparent,
                          child: Image.asset(
                            'assets/images/puzzle/puzzle_piece_$puzzlePiece.jpg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: Container(),
                  );
                }
              },
            ),
            SizedBox(height: 20),
            // Timer
            Row(
              children: [
                Text('Time: $formattedTime'),
                SizedBox(width: 20),
                Text('Moves: $moveCount'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void checkIfGameIsSolved() {
    bool isSolved = true;
    for (int i = 0; i < puzzlePieces.length - 1; i++) {
      if (puzzlePieces[i] != i + 1) {
        isSolved = false;
        break;
      }
    }

    if (isSolved) {
      stopwatch.stop();
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Congratulations!'),
            content: Text('You solved the puzzle in $moveCount moves.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  startGame(); // Start a new game
                },
                child: Text('Play Again'),
              ),
            ],
          );
        },
      );
    }
  }

  void updateTimer() {
    if (!isGameStarted) return;

    Duration elapsed = stopwatch.elapsed;
    int hours = elapsed.inHours;
    int minutes = elapsed.inMinutes % 60;
    int seconds = elapsed.inSeconds % 60;
    setState(() {
      formattedTime = '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    });

    Future.delayed(Duration(seconds: 1), updateTimer);
  }
}
