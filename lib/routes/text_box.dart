import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 30,maxWidth: 500),
      child: new Row(children: <Widget>[
        Text('成都',style: TextStyle(color: Colors.black,),),
        Icon(Icons.arrow_drop_down,color: Colors.black),
        Flexible(
          child: new Container(
            alignment: Alignment.centerLeft,
            decoration: new BoxDecoration(
              color: Colors.white,
              //设置四周圆角 角度
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              //设置四周边框
              border: new Border.all(width: 1, color: Color(0xFFFFC300)),
            ),
            child: new FlatButton.icon(
              onPressed: () {},
              icon: new Icon(
                Icons.search,
                size: 20.0,
                color: Colors.grey,
              ),
              label: new Text(
                '美团优选',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        )
      ]),
    );
  }
}