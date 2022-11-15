library grid_view_all;

import 'package:flutter/widgets.dart';

/// Defines a widget which is used to display a grid of items with a view all button
class GridViewAllWidget extends StatefulWidget {
  const GridViewAllWidget({
    Key? key,
    required this.items,
    required this.defaultItemsCount,
    this.animationDuration,
    this.topPad = 10,
    this.bottomPad = 10,
    this.leftPad = 0,
    this.rightPad = 0,
    this.itemsPerColumn = 3,
    this.shrinkWrap = false,
    this.makeScrollable = false,
  }) : super(key: key);

  /// Defines the number of items to show as default when the gridview is rendered.
  /// Default is [_defaultItemsCount]
  final int? defaultItemsCount;

  /// Defines List of items to be populated by the gridview
  final List<String>? items;

  /// Defines the animation duration value for scrolling up the list
  final int? animationDuration;

  /// Defines the top padding for grid items
  /// Default is 10
  final double topPad;

  /// Defines the right padding for grid items
  /// Default is 0
  final double rightPad;

  /// Defines the bottom padding for grid items
  /// Default is 10
  final double bottomPad;

  /// Defines the left padding for grid items
  /// Default is 0
  final double leftPad;

  /// Defines the number of item columns for the grid view
  /// Default is 3
  final int itemsPerColumn;

  final bool shrinkWrap;

  /// Defines if the grid view is scrollable within its parent
  /// Default is false
  final bool makeScrollable;

  @override
  State<StatefulWidget> createState() {
    return _GridViewAllWidgetState();
  }
}

class _GridViewAllWidgetState extends State<GridViewAllWidget> {
  late List<Color> colors;

  Color _generateColor() {
    int r = Random().nextInt(256);
    int g = Random().nextInt(256);
    int b = Random().nextInt(256);
    return Color.fromRGBO(r, g, b, 1);
  }

  @override
  void initState() {
    super.initState();
    colors = List.generate(widget.items.length, (index) => _generateColor());
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: widget.shrinkWrap,
      physics: widget.makeScrollable ? const ScrollPhysics() : const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.itemsPerColumn),
      itemBuilder: ((context, index) {
        return _buildGridItem(widget.items![index], index);
      }),
      itemCount: widget.items!.length,
    );
  }

  Widget _buildGridItem(String item, int index) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.topPad,
        bottom: widget.bottomPad,
        right: widget.rightPad,
        left: widget.leftPad,
      ),
      child: Container(
        child: Center(
          child: Text(item),
        ),
      ),
    );
  }
}
