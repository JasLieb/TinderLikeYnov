import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tinder Like Ynov Evaluation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: new Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                // Swipe image here
                Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height - 512,
                ),
              ],
            ),
            _getUserInfos(),
          ],
        )
      ),
    );
  }

  _getAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
            height: 32,
          ),
          Container(
            padding: const EdgeInsets.all(8.0), child: Text(widget.title)
          )
        ],
      ),
    );
  }

  _getUserInfos() {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.only(left: 20, right: 20, top: 150),
          child: Wrap(
            children: [
              Text('Mon prenom + Mon nom'),
              Text('Mon email'),
            ],
          ),
        )
      ],
    );
  }
}
