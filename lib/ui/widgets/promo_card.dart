
// import 'package:flutter/material.dart';
// import 'package:vector_math/vector_math.dart' as v_math;



// class PromoCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//       ClipPath(
        
//         clipper: DolDurmaClipper(right: 40, holeRadius: 20),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(
//               Radius.circular(15),
//             ),
//             color: Colors.blueAccent,
//           ),
//           width: 300,
//           height: 95,
//           padding: EdgeInsets.all(15),
//           child: Text('first example'),
//         ),
//       ),
  
   
//     ]);
//   }
// }

// class DolDurmaClipper extends CustomClipper<Path> {
//   DolDurmaClipper({required this.right, required this.holeRadius});

//   final double right;
//   final double holeRadius;

//   @override
//   Path getClip(Size size) {
//     final path = Path()
//       ..moveTo(0, 0)
//       ..lineTo(size.width - right - holeRadius, 0.0)
//       ..arcToPoint(
//         Offset(size.width - right, 0),
//         clockwise: false,
//         radius: Radius.circular(1),
//       )
//       ..lineTo(size.width, 0.0)
//       ..lineTo(size.width, size.height)
//       ..lineTo(size.width - right, size.height)
//       ..arcToPoint(
//         Offset(size.width - right - holeRadius, size.height),
//         clockwise: false,
//         radius: Radius.circular(1),
//       );

//     path.lineTo(0.0, size.height);

//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(DolDurmaClipper oldClipper) => true;
// }

import 'package:flutter/material.dart';
import 'package:oz_cofe/model/PromoModel.dart';
import 'package:flutter/material.dart';
import 'package:oz_cofe/model/PromoModel.dart';

class PromoCard extends StatelessWidget {
  final PromoModel promo;
  const PromoCard({super.key, required this.promo});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            // Shadow behind clipped circle
            Positioned(
              right: 70 - 15, // Adjust position based on clipper settings
              top: 20,
              bottom: 20,
              child: Container(
                width: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      spreadRadius: 2,
                      offset: Offset(2, 0),
                    ),
                  ],
                ),
              ),
            ),

            // Main clipped promo card
            ClipPath(
              clipper: DolDurmaClipper(right: 70, holeRadius: 30),
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Icon with light circle background
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE3F2F5),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(Icons.percent, color: Color(0xFF056780), size: 28),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Title and Description
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            promo.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            promo.description,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Dashed Vertical Divider
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      height: 48,
                      width: 1,
                      child: CustomPaint(
                        painter: DashLinePainter(),
                      ),
                    ),

                    // Voucher Count
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          promo.numberOfVocher.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Voucher",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DashLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1;

    const dashHeight = 4;
    const dashSpace = 3;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DolDurmaClipper extends CustomClipper<Path> {
  DolDurmaClipper({required this.right, required this.holeRadius});

  final double right;
  final double holeRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - right - holeRadius, 0.0)
      ..arcToPoint(
        Offset(size.width - right, 0),
        clockwise: false,
        radius: const Radius.circular(1),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - right, size.height)
      ..arcToPoint(
        Offset(size.width - right - holeRadius, size.height),
        clockwise: false,
        radius: const Radius.circular(1),
      );

    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;
}
