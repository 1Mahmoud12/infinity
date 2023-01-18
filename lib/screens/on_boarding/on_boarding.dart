
import 'package:flutter/material.dart';

import '../../home_layout.dart';
import '../../shared/components/components.dart';
import 'on_boarding2.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Image.asset('assets/person.png'),
          const SizedBox(height: 20,),
          const Text('Ready',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          const SizedBox(height: 20,),
          const Text('Hey There! Yes, this is an habit tracker don\'t let the name fool you. It will help you manage your daily or weekly habits with ease.',
          style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
          const Spacer(),
          Row(children: [
            const SizedBox(width: 15,),
              OutlinedButton(
                style:OutlinedButton.styleFrom(
                backgroundColor: Colors.black,
                primary: Colors.blue
              ) ,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> HomeLayout()),(route) => false,);
                  //navigatorReuse(context,const HomeLayout());
                },
                child: const Text(
                  'Skip',textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25),
                ),
              ),
              const Spacer(),
            OutlinedButton(
              style:OutlinedButton.styleFrom(
                  backgroundColor: Colors.black,
                  primary: Colors.blue
              ) ,
              onPressed: () {
                navigatorReuse(context, const OnBoarding2());
              },
              child: const Text(
                'Next',textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25),
              ),
            ),
            const SizedBox(width: 15,)
          ],)
        ],
      ),
    );
  }
}
