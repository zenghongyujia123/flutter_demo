import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'text_box.dart';

class CustomerAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomerAppBarState createState() => _CustomerAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}

class _CustomerAppBarState extends State<CustomerAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFFC300),
      title: TextBox(),
      elevation:0,
      actions: <Widget>[
        new IconButton(
          icon: const Icon(
            Icons.keyboard_voice,
            color: Colors.black,
            size: 30.0,
          ),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              // return TestPage();
            }));
          },
        ),
        new IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.black,
            size: 30.0,
          ),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              // return CustomerStatefulPage();
            }));
          },
        ),
      ],
    );
  }
}
