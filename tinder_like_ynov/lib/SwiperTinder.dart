import 'package:flutter/material.dart';
import 'dart:math';
import 'Person.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperTinder extends StatefulWidget {

  List personList;
  Person selectedPerson;

  SwiperTinder(List personList) {
    this.personList = personList;
    selectedPerson = personList[0];
  }

  @override
  _SwiperTinderState createState() => _SwiperTinderState ();
}

class _SwiperTinderState extends State<SwiperTinder> {
  @override
  Widget build(BuildContext context) {
    return new Swiper(
      itemBuilder: (BuildContext context, int index){
        return new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: new Image(image: AssetImage('assets/photos/' + widget.selectedPerson.personId.toString() + '.jpg')),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: _getUserInfos(),
            )
          ],
        );
      },
      itemCount: 1,
      pagination: new SwiperPagination(),
      control: new SwiperControl(
        iconNext: null,
        iconPrevious: null
      ),
      onIndexChanged: (index) => switchPerson(),
    );
  }

  _getUserInfos() {
    return Card(
      margin: EdgeInsets.only(left: 20, right: 20, top: 150),
      child: Wrap(
        spacing: 5,
        direction: Axis.vertical,
        children: [
          Text(widget.selectedPerson.toString(), textAlign: TextAlign.center,),
          Text(widget.selectedPerson.getEmail()),
        ],
      ),
    );
  }

  switchPerson() {
    int index = new Random().nextInt(widget.personList.length);
    widget.selectedPerson = widget.personList[index];
  }
}