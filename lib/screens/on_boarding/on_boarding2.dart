
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import 'on_boarding.dart';
import 'on_boarding3.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          SizedBox(height: 20,),
          Image.asset('assets/gymTime.png'),
          SizedBox(height: 20,),
          Text('Ready',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          SizedBox(height: 20,),
          Text('It has a lot of them. You add a routine which can contain multiple tasks, Select a time and you are done. It will remind you at the specified time. Also there are statistics',
            style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
          Spacer(),
          Row(children: [
            SizedBox(width: 15,),
            OutlinedButton(
              style:OutlinedButton.styleFrom(
                  backgroundColor: Colors.black,
                  primary: Colors.blue
              ) ,
              onPressed: () {navigatorReuse(context, const OnBoarding());},
              child: Text(
                'Back',textAlign: TextAlign.center,
                style: TextStyle(

                    fontSize: 25),
              ),
            ),
            Spacer(),
            OutlinedButton(
              style:OutlinedButton.styleFrom(
                  backgroundColor: Colors.black,
                  primary: Colors.blue
              ) ,
              onPressed: () {navigatorReuse(context, const OnBoarding3());},
              child: Text(
                'Next',textAlign: TextAlign.center,
                style: TextStyle(

                    fontSize: 25),
              ),
            ),
            SizedBox(width: 15,)
          ],)
        ],
      ),
    );
  }
}
