import 'package:flutter/material.dart';
import 'package:ui_experiments/layered_card_with_cta.dart';
import 'package:ui_experiments/rounded_tile_grid.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Container> widgetList = List.generate(9, (index) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text(
            '$index',
          ),
        ),
      );
    });

    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: Center(
          child: SizedBox(
            height: 300,
            width: 300,
            child: LayeredCardWithCta(),
          ),
        ),
      ),
    );
  }
}
