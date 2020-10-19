import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'my_page_notifier.dart';

class MyPage extends StatelessWidget {
  const MyPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<MyPageNotifier, MyPageState>(
          create: (context) => MyPageNotifier(
            context: context,
          ),
        )
      ],
      child: const MyPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<MyPageNotifier>();
    print('RE-RENDER');

    void popUpForm() {
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: Text('今日の体重を入力しよう'),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 24
              ),
              children: [
                Row(
                  children: [
                    Container(
                      width: 200,
                      padding: EdgeInsets.only(left: 4),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '嘘つくなよ',
                            labelText: '今日の体重'
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('kg'),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 200,
                  padding: EdgeInsets.only(left: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '後悔先に立たず',
                        labelText: '懺悔の一言'
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '登録',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            );
          }
      );
    }


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
                  Builder(
                    builder: (BuildContext context) {
                      final count =
                          context.select((MyPageState state) => state.count);

                      return Container(
                        padding: const EdgeInsets.only(left: 12),
                        width: 100,
                        child: Text(
                          count.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      );
                    },
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
                  // notifier.pushButton();
                  popUpForm();
                })
          ],
        ),
      ),
    );
  }



}
