import 'package:flutter/material.dart';
import 'package:seven_segment_clock/seven_segment.dart';
import 'package:flutter_svg/svg.dart';

class SevenSegmentClock extends StatelessWidget {
  late DateTime _dateTime;
  late double _height;
  late Color? _color;
  static bool _isOn = false;

  SevenSegmentClock(
    double height, {
    DateTime? dateTime,
    Color? color,
    super.key,
  }) : _height = height,
       _color = color,
       _dateTime = dateTime ?? DateTime.now();

  Widget twoDots() {
    return SizedBox(
      height: _height,
      width: _height * (8 / 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          2,
          (i) => SvgPicture.asset(
            'dot.svg',
            colorFilter: ColorFilter.mode(
              _isOn ? _color ?? Colors.red : Colors.black26,
              BlendMode.srcIn,
            ),
            height: _height * (6 / 14) / 3,
            width: _height * (1 / 14),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _isOn = !_isOn;
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SevenSegment((_dateTime.hour / 10).toInt(), _height, color: _color),
          SevenSegment((_dateTime.hour % 10), _height, color: _color),

          twoDots(),

          SevenSegment((_dateTime.minute / 10).toInt(), _height, color: _color),
          SevenSegment((_dateTime.minute % 10), _height, color: _color),

          twoDots(),

          SevenSegment((_dateTime.second / 10).toInt(), _height, color: _color),
          SevenSegment((_dateTime.second % 10), _height, color: _color),
        ],
      ),
    );
  }
}
