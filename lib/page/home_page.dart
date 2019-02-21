import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/application.dart';
import 'package:efox_flutter/lang/app_translations.dart';
//
import 'package:efox_flutter/store/STORE.dart';

//
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 实例化语言包
    AppTranslations lang = AppTranslations.of(context);
    // 实例化model
    // int age = STORE.get(context).userInfo.age;
    return STORE.connect(builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(
          title: Text(lang.t('title')),
          actions: <Widget>[
            PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Color(0xffffffff),
                ),
                onSelected: (local) {
                  Application().onLocaleChanged(Locale(local));
                  print('local=$local');
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Row(
                          children: <Widget>[Text('中文')],
                        ),
                        value: 'zh',
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: <Widget>[Text('english')],
                        ),
                        value: 'en',
                      )
                    ])
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                model.userInfo.age.toString(),
                style: Theme.of(context).textTheme.display1,
              ),
              RaisedButton(
                child: Text('go test 1'),
                onPressed: () =>
                    Navigator.pushNamed(context, '/test/test_page_one'),
              ),
              RaisedButton(
                child: Text('go test 2'),
                onPressed: () =>
                    Navigator.pushNamed(context, '/test/test_page_two'),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: model.setAge,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
    });
  }
}