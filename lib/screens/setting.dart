import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/states.dart';
import '../cubit/to_do.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';
import '../shared/notification/notification_routine.dart';
import '../shared/notification/notification_tasks.dart';
import 'my_tasks.dart';

class Setting extends StatefulWidget {
   const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
   bool checkNotification=true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TODoCubit,ToDoStates>(
      listener: (context,state){},
      builder: (context,state)=> Scaffold(
        //primary: false,
        appBar: AppBar(
          title: Text('Setting',style: Theme.of(context).textTheme.bodyText1,),
          elevation:3,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                            navigatorReuse(context, MyTasks());

                          },
                          child: Container(
                            //color: Colors.deepPurpleAccent,
                            padding: const EdgeInsets.all(25),
                            margin: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: defaultColor,
                            ),
                            child: Row(
                              children: const [
                                Text('My Tasks',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.start,),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios,color: Colors.white,)
                              ],
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                            TODoCubit.get(context).changeMode();
                            //print(checkDarkMode);
                          },
                          child: Container(
                            //color: Colors.deepPurpleAccent,
                            padding: const EdgeInsets.all(25),
                            margin: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: defaultColor,
                            ),
                            child: Row(
                              children: [
                                const Text('Dark Mode',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.start,),
                                const Spacer(),
                                Icon(TODoCubit.get(context).checkMode?Icons.dark_mode:Icons.light_mode,color: Colors.white,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              checkNotification = !checkNotification;

                            });
                          },
                          child: Container(
                            //color: Colors.deepPurpleAccent,
                            padding: const EdgeInsets.all(25),
                            margin: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: defaultColor,
                            ),
                            child: Row(
                              children: [
                                const Text('Notification',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.start,),
                                const Spacer(),
                                Switch(
                                  activeColor: Colors.white70,
                                    value: checkNotification,
                                    onChanged: (value) {
                                     setState(() {
                                       checkNotification = !checkNotification;
                                       if(checkNotification==false)
                                         {NotificationServiceRoutine().cancelAll();
                                         NotificationServiceTasks().cancelAll();
                                         print(checkNotification);
                                         }

                                     });
                                    })
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            margin: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: defaultColor,
                            ),
                            child:Row(
                              children: const [
                                Text('About',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.start,),
                                Spacer(),
                                Icon(Icons.person,color: Colors.white,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          // onTap: (){
                          //   TODoCubit().get(context).changeMode();
                          //   //print(checkDarkMode);
                          // },
                          child: Container(
                            //color: Colors.deepPurpleAccent,
                            padding: const EdgeInsets.all(25),
                            margin: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: defaultColor,
                            ),
                            child:const Text('Version 2.0',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.start,),

                          ),
                        ),
                      ),


                    ],
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),
                 Text('Made in Egypt',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 25),),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
