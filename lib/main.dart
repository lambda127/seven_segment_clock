import 'package:flutter/material.dart';
import 'package:seven_segment_clock/seven_segment.dart';
import 'package:seven_segment_clock/seven_segment_clock.dart';
import 'package:timer_builder/timer_builder.dart';

void main() {
  runApp(const SevenSegmentTest());
}

class SevenSegmentTest extends StatefulWidget {
  const SevenSegmentTest({super.key});

  @override
  State<SevenSegmentTest> createState() => _SevenSegmentTestState();
}

class _SevenSegmentTestState extends State<SevenSegmentTest> {
  @override
  void initState() {
    super.initState();
  }

  List<MaterialColor> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.lime,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width / 5;
    return MaterialApp(
      home: Scaffold(
        body: TimerBuilder.periodic(
          Duration(seconds: 1),
          builder: (context) {
            return GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) {
                return FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Column(
                    children: List.generate(
                      10,
                      (i) => Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: SevenSegmentClock(
                            height,
                            color:
                                colors[index][i == 0
                                    ? 50
                                    : 100 *
                                        i], //Colors.blue[i == 0 ? 50 : 100 * i],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        /*
        SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemBuilder: (_, int index) {
                  return Center(child: SevenSegment(index, 140));
                },
              ), //Center(child: SevenSegment().segmentView(0, 140))

              
            ],
          ),
        ),*/
      ),
    );
  }
}
