
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


import '../cubit/states.dart';
import '../cubit/to_do.dart';
import '../shared/charts/bar_chart.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';
import 'package:timezone/data/latest.dart' as tz;

import '../shared/notification/notification_routine.dart';
import 'my_tasks.dart';

class HomePage extends StatefulWidget {
  final String? payload;
  const HomePage({Key? key,this.payload}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tz.initializeTimeZones();


  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TODoCubit,ToDoStates>(
      listener: (context,state){

      },
      builder: (context,state) {

        return Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${Day.selectMorningOrNight()}  😌',style:   Theme.of(context).textTheme.bodyText1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [

                  Text('  $nameDayNow  ,${DateFormat.MMMMd().format(DateTime.now())}  ',style: TextStyle(
                      color: Colors.grey[600],fontSize: 20
                  ),),
                ],
              ),
            ),
            const SizedBox(height: 7,),
            const BarChartSample1(),

            SizedBox(
              width: double.infinity,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  if(dataTasks.isEmpty)
                  Text(
                    'You Seem Free Today!',
                    style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center,
                  ),
                    if(dataTasks.isEmpty)
                  TextButton(
                      onPressed: () {
                        navigatorReuse(context, MyTasks());
                      },
                      child: Text('change that?',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.blue),)),
                  const SizedBox(height: 15,),
                  if(dataTasks.isNotEmpty)
                   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: ListView.separated(

                         physics: const BouncingScrollPhysics(),
                           itemBuilder: (context,index)=>clickItem(context,data: dataTasks,index: index,nameOfTable: 'tasks'),
                           separatorBuilder: (context,index)=>const SizedBox(width: 15,),
                           itemCount: dataTasks.length),
                     ),
                   ),

                ],
              ),
            )
          ],
        ),


      );
      },
    );
  }
}
