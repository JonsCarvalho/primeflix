import 'package:flutter/material.dart';

class MenuListItemWidget extends StatelessWidget {
  final Function function;
  final IconData icon;
  final Color color;
  final String text;
  final Widget widget;

  const MenuListItemWidget(
      {Key key,
      @required this.function,
      @required this.icon,
      @required this.color,
      @required this.text,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: InkWell(
        onTap: function,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: color,
                  ),
                  SizedBox(width: 5),
                  Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              if (widget != null) widget,
            ],
          ),
        ),
      ),
    );
  }
}
