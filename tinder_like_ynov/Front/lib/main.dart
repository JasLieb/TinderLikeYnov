import 'package:flutter/material.dart';
import 'Person.dart';
import 'SwiperTinder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List persons = await loadPersons();
  runApp(MyApp(persons));
}

class MyApp extends StatelessWidget {

  List _personList;

  MyApp(List personList) {
    _personList = personList;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Tinder Like Ynov Evaluation',
        personList: _personList
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.personList})  : super(key: key);

  String title;
  List personList;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: SwiperTinder(
        widget.personList
      ),
    );
  }

  _getAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
}
