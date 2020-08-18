import 'package:flutter/material.dart';
import '../config/palette.dart';

class CustomNavBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomNavBar({
    Key key,
    this.icons,
    this.selectedIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: Border(top: BorderSide(
          color: Palette.facebookBlue,
          width: 3.0,
        ))
      ),
      onTap: onTap,
      tabs: icons
        .asMap()
        .map((i, e) => MapEntry(
          i,
          Tab(
            icon: Icon(
              e,
              color: i == selectedIndex ? Palette.facebookBlue : Colors.black45,
              size: 30.0,
            ),
          ),
        )).values.toList(),
    );
  }
}