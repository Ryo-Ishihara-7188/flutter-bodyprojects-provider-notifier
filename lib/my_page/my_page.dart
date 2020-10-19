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
              margin: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 26,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 8,
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      '75kg',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24,
                                child: Icon(Icons.calendar_today),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '2020/10/19',
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              child: Icon(Icons.comment),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '現状維持',
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
