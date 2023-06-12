import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/theme/my_theme.dart';

class ButtonTapEffect extends StatefulWidget {
  const ButtonTapEffect({Key? key, required this.child, required this.onTap, this.margin, this.borderRadius, this.onHover})
      : super(key: key);

  final Widget child;
  final VoidCallback onTap;
  final EdgeInsets? margin;
  final double? borderRadius;
  final Function(bool value)? onHover;

  @override
  State<ButtonTapEffect> createState() => _ButtonTapEffectState();
}

class _ButtonTapEffectState extends State<ButtonTapEffect> {
  bool onTapHappened = false;

  setOnTapHappenedValue(bool newValue) {
    setState(() {
      onTapHappened = newValue;
    });
  }

  onSimpleTapHappenedValue(bool newValue) {
    setState(() {
      onTapHappened = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: InkWell(
        onHover: widget.onHover,
        onTap: () {
          onSimpleTapHappenedValue(true);
          setState(() {});
          Future.delayed(100.ms, () => onSimpleTapHappenedValue(false));
          Future.delayed(180.ms, () => widget.onTap());
        },
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
        onTapDown: (details) => setOnTapHappenedValue(true),
        onTapCancel: () => setOnTapHappenedValue(false),
        // onTapUp: (details) {
        //   setOnTapHappenedValue(false);
        //   Future.delayed(100.ms, () => widget.onTap());
        //   // widget.onTap();
        // },
        child: widget.child,
      ),
    ).animate(target: onTapHappened ? 1 : 0).scaleXY(end: 0.88, duration: 40.ms);
  }
}
