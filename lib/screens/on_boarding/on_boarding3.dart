import 'package:flutter/material.dart';

import '../../home_layout.dart';
import '../../shared/components/components.dart';
import 'on_boarding2.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/watch.png'),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Ready',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'We hope you are! \n Have fun.',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black, primary: Colors.blue),
                onPressed: () {
                  navigatorReuse(context, const OnBoarding2());
                },
                child: const Text(
                  'Back',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const Spacer(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black, primary: Colors.blue),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>const HomeLayout()),(route) => false,);
                },
                child: const Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          )
        ],
      ),
    );
  }
}
