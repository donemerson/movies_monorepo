import 'package:flutter/material.dart';

class AnimatedNumTween extends StatefulWidget {
  final double valor;
  final Widget Function(double valor) widgetBuilder;
  final Duration duration;
  final bool withFloor;
  const AnimatedNumTween({
    Key? key,
    required this.valor,
    required this.widgetBuilder,
    this.duration = const Duration(milliseconds: 1000),
    this.withFloor = true,
  }) : super(key: key);

  @override
  _AnimatedNumTweenState createState() => _AnimatedNumTweenState();
}

class _AnimatedNumTweenState extends State<AnimatedNumTween>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 0.0, end: widget.valor).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) {
        var valor = _animation.value;
        if (_controller.isAnimating) {
          if (widget.withFloor) valor = valor.floorToDouble();
          return widget.widgetBuilder(valor);
        }
        return widget.widgetBuilder(widget.valor);
      },
    );
  }

  @override
  void didUpdateWidget(covariant AnimatedNumTween oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.valor != widget.valor) {
      _animation = Tween<double>(begin: oldWidget.valor, end: widget.valor)
          .animate(_controller);

      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
