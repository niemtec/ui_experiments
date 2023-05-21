import 'package:flutter/material.dart';

class RoundedTileGrid extends StatelessWidget {
  final int crossAxisCount;
  final double tileOuterRadius;
  final double tileInnerRadius;
  final Color tileColor;
  final double tileElevation;
  final EdgeInsets tilePadding;
  final Color tileSurfaceTintColor;
  final List<Widget> widgets;

  RoundedTileGrid({
    super.key,
    required this.crossAxisCount,
    required this.tileOuterRadius,
    this.tileInnerRadius = 6.0,
    this.tileColor = Colors.white,
    this.tileElevation = 0,
    this.tilePadding = const EdgeInsets.all(2.0),
    this.tileSurfaceTintColor = Colors.purple,
    required this.widgets,
  });

  final List<Widget> shapedList = [];
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.cyan,
    Colors.lime
  ];

  @override
  Widget build(BuildContext context) {
    for (var widget in widgets) {
      shapedList.add(
        Padding(
          padding: tilePadding,
          child: Material(
            elevation: tileElevation,
            color: colors[widgets.indexOf(widget)],
            surfaceTintColor: tileSurfaceTintColor,
            shape: _determineBorderRoundingDirection(widgets.indexOf(widget)),
            child: Center(child: widget),
          ),
        ),
      );
    }

    return GridView.count(crossAxisCount: crossAxisCount, children: shapedList);
  }

  RoundedRectangleBorder _determineBorderRoundingDirection(int index) {
    final oddNumberModulo = widgets.length % crossAxisCount;
    final isTopLeft = index == widgets.indexOf(widgets.first);
    final isTopRight = index == crossAxisCount - 1;
    final isBottomLeft = index ==
        (oddNumberModulo != 0 ? widgets.length - oddNumberModulo : widgets.length - crossAxisCount);
    final isBottomRight = index == widgets.indexOf(widgets.last);

    return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: isTopLeft ? Radius.circular(tileOuterRadius) : Radius.circular(tileInnerRadius),
        topRight: isTopRight ? Radius.circular(tileOuterRadius) : Radius.circular(tileInnerRadius),
        bottomLeft:
            isBottomLeft ? Radius.circular(tileOuterRadius) : Radius.circular(tileInnerRadius),
        bottomRight:
            isBottomRight ? Radius.circular(tileOuterRadius) : Radius.circular(tileInnerRadius),
      ),
    );
  }
}
