// import 'package:dubai_debremewy_app_dogs_food/src/common_widgets/button_widgets.dart';
// import 'package:flutter/material.dart';
//
//
//
// class PuzzleScreen extends StatefulWidget {
//   @override
//   State<PuzzleScreen> createState() => _PuzzleScreenState();
// }
//
// class _PuzzleScreenState extends State<PuzzleScreen> {
//   // This is an array of all the puzzle pieces.
//   List<PuzzlePiece> puzzlePieces = [];
//
//   // This is the index of the empty space in the puzzle.
//   int emptySpaceIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize the puzzle pieces.
//     for (int i = 1; i < 17; i++) {
//       puzzlePieces.add(PuzzlePiece(
//         image: Image.asset('assets/images/puzzle/puzzle_piece_$i.jpg'),
//         index: i,
//       ));
//     }
//
//     // Shuffle the puzzle pieces.
//     // puzzlePieces.shuffle();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 300,
//               height: 300,
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 4,
//                   childAspectRatio: 1.0,
//                 ),
//                 itemCount: 16,
//                 itemBuilder: (context, index) {
//                   // If this is the empty space, don't show anything.
//                   if (index == emptySpaceIndex) {
//                     return Container();
//                   } else {
//                     final puzzlePiece = puzzlePieces[index];
//                     // Otherwise, show the puzzle piece.
//                     return GestureDetector(
//                       onTap: () {
//                         // If the puzzle piece is adjacent to the empty space, move it to the empty space.
//                         final emptyRow = emptySpaceIndex ~/ 4;
//                         final emptyCol = emptySpaceIndex % 4;
//                         final pieceRow = puzzlePiece.index ~/ 4;
//                         final pieceCol = puzzlePiece.index % 4;
//
//                         if ((emptyRow == pieceRow && (emptyCol - pieceCol).abs() == 1) ||
//                             (emptyCol == pieceCol && (emptyRow - pieceRow).abs() == 1)) {
//                           setState(() {
//                             puzzlePieces[emptySpaceIndex].index = puzzlePiece.index;
//                             puzzlePieces[index].index = emptySpaceIndex;
//                             emptySpaceIndex = index;
//                           });
//                         }
//                       },
//                       child: AnimatedPositioned(
//                         child: puzzlePiece.image,
//                         left: puzzlePiece.index % 4 * 75,
//                         top: puzzlePiece.index ~/ 4 * 75,
//                         duration: Duration(milliseconds: 500),
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ),
//             SizedBox(height: 10.0),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: gtButton(
//                 onTap:(){},
//                 gtText: 'PLAY',
//               ),
//             ),
//           ],
//         ),
//
//
//       ),
//
//     );
//   }
// }
//
// class PuzzlePiece {
//   final Image image;
//   int index;
//
//   PuzzlePiece({
//     required this.image,
//     required this.index,
//   });
// }

