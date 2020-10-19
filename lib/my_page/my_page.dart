import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('体重管理APP'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 26),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 8,
                    )
                  ],
                  borderRadius: BorderRadius.circular(8)),
            ),
            Text("今日の体重を追加しましょう"),
            IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.amberAccent,
                ),
                onPressed: () {
                  print('ON PUSHED');
                })
          ],
        ),
      ),
    );
  }
}
