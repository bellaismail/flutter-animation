import 'package:flutter/material.dart';

typedef WidgetWithBeginAndEndAnimationValues = Widget Function(double, Color?);
class AppCustomWaveWidget extends StatefulWidget {
  const AppCustomWaveWidget({
    super.key,
    required this.widget,
    required this.begin,
    required this.end,
  });

  final WidgetWithBeginAndEndAnimationValues widget;
  final double begin;
  final double end;
  @override
  State<AppCustomWaveWidget> createState() => _AppCustomWaveWidgetState();
}

class _AppCustomWaveWidgetState extends State<AppCustomWaveWidget> with SingleTickerProviderStateMixin{
  late AnimationController _c;
  late Animation<double> _a;
  late Animation<Color?> _colorA;

  @override
  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _a = Tween<double>(begin: widget.begin, end: widget.end).animate(_c);
    _colorA = ColorTween(begin: Colors.grey.withOpacity(0.6), end: Colors.grey.withOpacity(0.4)).animate(_c);
    _c.repeat();
    // _c.addListener(_listener);
  }

  _listener() {
    _c.forward();
    setState(() {});
  }

  @override
  void dispose() {
    print('==> dismiss animation <==');
    // _c.removeListener(_listener);
    _c.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return widget.widget(_a.value, _colorA.value);
  }
}