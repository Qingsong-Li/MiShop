import 'package:flutter/material.dart';
import 'package:mishop/app/services/screenAdaptor.dart';

//自定义滚动条
// ignore: must_be_immutable
class CustomScrollerBar extends StatefulWidget {
  ScrollView child;
  double length;
  double activeLength;
  double width;
  Color activeColor;
  Color backgroundColor;
  CustomScrollerBar(
      {super.key,
      required this.child,
      required this.length,
      required this.activeLength,
      required this.width,
      required this.activeColor,
      required this.backgroundColor});

  @override
  State<CustomScrollerBar> createState() => _CustomScrollerBarState();
}

class _CustomScrollerBarState extends State<CustomScrollerBar> {
  late double alignment = -1 *
      (widget.child.scrollDirection == Axis.horizontal
          ? widget.length / ScreenAdaptor.getScreenWidth()
          : widget.length / ScreenAdaptor.getScreenHeight());

  bool _handleScrollNotification(ScrollNotification notification) {
    final ScrollMetrics metrics = notification.metrics;

    setState(() {
      alignment = (-1 + (metrics.pixels / metrics.maxScrollExtent) * 2) *
          (widget.child.scrollDirection == Axis.horizontal
              ? widget.length / ScreenAdaptor.getScreenWidth()
              : widget.length / ScreenAdaptor.getScreenHeight());
    });

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Stack(
        children: <Widget>[
          widget.child,
          Align(
              alignment: widget.child.scrollDirection == Axis.horizontal
                  ? Alignment.bottomCenter
                  : Alignment.centerRight,
              child: widget.child.scrollDirection == Axis.horizontal
                  ? Container(
                      height: widget.width,
                      width: widget.length,
                      decoration: BoxDecoration(
                          color: widget.backgroundColor,
                          borderRadius:
                              BorderRadius.circular(widget.width / 2)))
                  : Container(
                      height: widget.length,
                      width: widget.width,
                      decoration: BoxDecoration(
                          color: widget.backgroundColor,
                          borderRadius:
                              BorderRadius.circular(widget.width / 2)))),
          Align(
            alignment: widget.child.scrollDirection == Axis.horizontal
                ? Alignment(alignment, 1)
                : Alignment(1, alignment),
            child: Container(
              height: widget.width,
              width: widget.activeLength,
              decoration: BoxDecoration(
                  color: widget.activeColor,
                  borderRadius: BorderRadius.circular(widget.width / 2)),
            ),
          ),
        ],
      ),
    );
  }
}
