import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperTinder extends StatefulWidget {

  @override
  _SwiperTinderState createState() => _SwiperTinderState ();
}

class _SwiperTinderState extends State<SwiperTinder> {
  @override
  Widget build(BuildContext context) {
    return new Swiper(

      itemBuilder: (BuildContext context,int index){
        return new Image(image: AssetImage('public/photos/1.jpg'));
      },
      itemCount: 3,
      pagination: new SwiperPagination(),
      control: new SwiperControl(),

    );
  }

}