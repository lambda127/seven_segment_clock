import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SevenSegment extends StatelessWidget {
  /*
     (a)(a)(a)  
  (f)         (b)
  (f)         (b)
  (f)         (b)
  (f)         (b)
     (g)(g)(g)  
  (e)         (c)
  (e)         (c)
  (e)         (c)
  (e)         (c)
     (d)(d)(d)      (dp)
  */

  /*
     0b(dp)(g)(f)(e)(d)(c)(b)(a)

  0 : 0b11000000
  1 : 0b11111001
  2 : 0b10100100
  3 : 0b10110000
  4 : 0b10011001
  5 : 0b10010010
  6 : 0b10000010
  7 : 0b11111000
  8 : 0b10000000
  9 : 0b10010000
  */

  late List<bool> _segments;
  late int _number;
  late double _height;
  late String _segData;
  late Color? _color;

  SevenSegment(number, double height, {Color? color, super.key})
    : _number = number,
      _height = height,
      _color = color,
      _segments = List.filled(8, false),
      _segData = "";

  void _init(int num) {
    _number = num;
    switch (_number) {
      case 0:
        _segData = "11000000";
        break;
      case 1:
        _segData = "11111001";
        break;
      case 2:
        _segData = "10100100";
        break;
      case 3:
        _segData = "10110000";
        break;
      case 4:
        _segData = "10011001";
        break;
      case 5:
        _segData = "10010010";
        break;
      case 6:
        _segData = "10000010";
        break;
      case 7:
        _segData = "11111000";
        break;
      case 8:
        _segData = "10000000";
        break;
      case 9:
        _segData = "10010000";
        break;
      default:
        break;
    }

    setSegment();
  }

  void setSegment() {
    Iterable.generate(8).forEach((i) => _segments[i] = (_segData[i] == '0'));
  }

  @override
  Widget build(BuildContext context) {
    _init(_number);

    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        height: _height,
        width: _height * (8 / 14),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //f
                SvgPicture.asset(
                  'column_bar.svg',
                  colorFilter: ColorFilter.mode(
                    _segments[2] ? _color ?? Colors.red : Colors.black26,
                    BlendMode.srcIn,
                  ),
                  height: _height * (6 / 14),
                  width: _height * (1 / 14),
                ),

                //e
                SvgPicture.asset(
                  'column_bar.svg',
                  colorFilter: ColorFilter.mode(
                    _segments[3] ? _color ?? Colors.red : Colors.black26,
                    BlendMode.srcIn,
                  ),
                  height: _height * (6 / 14),
                  width: _height * (1 / 14),
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //a
                SvgPicture.asset(
                  'row_bar.svg',
                  colorFilter: ColorFilter.mode(
                    _segments[7] ? _color ?? Colors.red : Colors.black26,
                    BlendMode.srcIn,
                  ),
                  height: _height * (1 / 14),
                  width: _height * (6 / 14),
                ),

                //g
                SvgPicture.asset(
                  'row_bar.svg',
                  colorFilter: ColorFilter.mode(
                    _segments[1] ? _color ?? Colors.red : Colors.black26,
                    BlendMode.srcIn,
                  ),
                  height: _height * (1 / 14),
                  width: _height * (6 / 14),
                ),

                //d
                SvgPicture.asset(
                  'row_bar.svg',
                  colorFilter: ColorFilter.mode(
                    _segments[4] ? _color ?? Colors.red : Colors.black26,
                    BlendMode.srcIn,
                  ),
                  height: _height * (1 / 14),
                  width: _height * (6 / 14),
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //b
                SvgPicture.asset(
                  'column_bar.svg',
                  colorFilter: ColorFilter.mode(
                    _segments[6] ? _color ?? Colors.red : Colors.black26,
                    BlendMode.srcIn,
                  ),
                  height: _height * (6 / 14),
                  width: _height * (1 / 14),
                ),

                //c
                SvgPicture.asset(
                  'column_bar.svg',
                  colorFilter: ColorFilter.mode(
                    _segments[5] ? _color ?? Colors.red : Colors.black26,
                    BlendMode.srcIn,
                  ),
                  height: _height * (6 / 14),
                  width: _height * (1 / 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
