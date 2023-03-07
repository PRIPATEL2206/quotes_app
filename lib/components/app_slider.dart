import 'package:flutter/material.dart';
import 'package:quotes/components/app_text.dart';

class AppSlider extends StatefulWidget {
  final double limit;
  final Function(double value) onChange;
  const AppSlider({super.key, required this.limit, required this.onChange});

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  late double limit;

  @override
  void initState() {
    super.initState();
    limit = widget.limit;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          text: " limit = ${limit.floor()}",
          fontSize: 20,
        ),
        Slider(
          max: 100,
          min: 1,
          label: "${limit.floor()}",
          value: limit,
          onChanged: (value) {
            widget.onChange(value);
            setState(() {
              limit = value;
            });
          },
        ),
      ],
    );
  }
}
