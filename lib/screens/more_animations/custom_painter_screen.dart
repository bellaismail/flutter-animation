import 'package:flutter/material.dart';

class CustomPainterScreen extends StatefulWidget {
  const CustomPainterScreen({super.key});

  @override
  State<CustomPainterScreen> createState() => _CustomPainterScreenState();
}

class _CustomPainterScreenState extends State<CustomPainterScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _size;
  late Animation<Color?> _color;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _size = Tween(begin: 50.0, end: 150.0).animate(_controller);
    _color = ColorTween(begin: Colors.red, end: Colors.teal).animate(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('custom_painter'),),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => CustomPaint(
            painter: _Painter(color: _color.value!),
            size: Size(_size.value, _size.value),
            // child: Container(
            //   width: _size.value,
            //   height: _size.value,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: _color.value,
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}

class _Painter extends CustomPainter{
  final Color color;
  const _Painter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}