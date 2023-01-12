import 'dart:ffi';

import 'package:flutter/material.dart';

class IconRow extends StatefulWidget {
  final IconData iconz;
  final String textz;
  bool iwantswitch;

  IconRow(
      {Key? key,
      required this.iconz,
      required this.textz,
      required this.iwantswitch})
      : super(key: key);

  @override
  State<IconRow> createState() => _IconRowState();
}

int x = 1;
bool a = true;

class _IconRowState extends State<IconRow> {
  @override
  Widget build(BuildContext context) {
    x += 1;
    if (x.isEven) {
      a = true;
    } else {
      a = false;
    }
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h * 0.01, vertical: h * 0.03),
      child: Row(
        children: [
          Icon(widget.iconz),
          SizedBox(
            width: h * 0.01,
          ),
          Text(widget.textz),
          Spacer(),
          widget.iwantswitch
              ? Switch(
                  value: a,
                  onChanged: (value) {
                    setState(() {
                      print(a);
                      print(x);
                    });
                  })
              : SizedBox()
        ],
      ),
    );
  }
}
