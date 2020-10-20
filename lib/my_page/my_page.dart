import 'package:demo_provider_notifier_bodyprojects/widgets/wgight_card.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text('体重管理APP'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                child: Builder(
                  builder: (BuildContext context) {
                    final records =
                        context.select((MyPageState state) => state.record);

                    return ListView.builder(
                      itemCount: records.length,
                      itemBuilder: (BuildContext context, int index) {
                        return WeightCard(records, index);
                      },
                    );
                  },
                ),
              ),
              Text("今日の体重を追加しましょう!"),
              IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Colors.amberAccent,
                  ),
                  onPressed: () {
                    notifier.popUpForm();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
