import 'package:flutter/material.dart';

class CpuRamGraphCard extends StatelessWidget {
  const CpuRamGraphCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section Services / Status
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E222B),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Services / Status', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Chip(
                    label: Text('OK', style: TextStyle(color: Color(0xFF00E676), fontSize: 12)),
                    backgroundColor: Colors.black26,
                  ),
                ],
              ),
              const Divider(color: Colors.white24),
              _buildServiceRow('Server 1: Active', 'Active', Colors.green),
              _buildServiceRow('Server 2: Active', 'Pending', Colors.orange),
              _buildServiceRow('Server 2: Offline', 'OK', Colors.grey),
              _buildServiceRow('Server 2: Offline', 'Warning', Colors.amber),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Section Graphique CPU / RAM avec courbe native
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E222B),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('CPU / RAM Usage', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                  Text('CPU: 84%   RAM: 72%', style: TextStyle(color: Color(0xFF00E676), fontSize: 12)),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CustomPaint(
                  size: const Size(double.infinity, 130),
                  painter: CurvePainter(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildServiceRow(String title, String status, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.circle, size: 8, color: Colors.grey),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(color: Colors.white70, fontSize: 13)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(status, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

// Classe pour dessiner la courbe verte de manière fluide
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00E676)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.2, size.width * 0.5, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.8, size.width, size.height * 0.3);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}