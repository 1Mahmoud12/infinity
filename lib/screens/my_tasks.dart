// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubit/states.dart';
import '../cubit/to_do.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';
import '../shared/notification/notification_tasks.dart';

class MyTasks extends StatelessWidget {
  MyTasks({Key? key}) : super(key: key);
  var routineController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController timeController= TextEditingController();
  TextEditingController notificationController= TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController editController=TextEditingController();
  int days=0;
  int hour=0;
  int minutes=0;
  int month=0;
  int year=0;
  bool isOpen = false;
  bool playNotification = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TODoCubit, ToDoStates>(
      listener: (context, state) {
      },
      builder: (context, state)  {
        var cubit=TODoCubit.get(context);
        return Scaffold(

            appBar: AppBar(
              leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,
                color: TODoCubit.get(context).checkMode ? Colors.white : Colors.black,)),
              title: Text('Tasks',
                style: Theme.of(context).textTheme.bodyText1,),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [

                  if(dataTasks.isEmpty)
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text(
                              'Looks Like You Haven\'t created any Tasks',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  if(dataTasks.isNotEmpty)
                    Expanded(
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder:(context,index)=> ConditionalBuilder(
                            condition: dataTasks.isNotEmpty,
                            builder: (context)=> clickItem(context,data: dataTasks,index: index,nameOfTable: 'tasks'),
                            fallback:(context)=> const Center(child:  CircularProgressIndicator()),
                          ),
                          separatorBuilder: (context,index)=>const SizedBox(width: 15,),
                          itemCount: dataTasks.length),
                    )



                ],
              ),
            ),
            floatingActionButton: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: defaultColor,
                ),
                child: IconButton(
                    icon: const Icon(Icons.add),
                    color: Colors.white,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: Container(
                            color: TODoCubit.get(context).checkMode
                                ? Colors.black
                                : Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Create Tasks',
                                        style:
                                        Theme.of(context).textTheme.bodyText1,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  defaultTextFromField(
                                      controller: routineController,
                                      inputKeyboardType: TextInputType.text,
                                      text: 'Tasks',
                                      hintText: 'ex: Book Ticket',
                                      styleController: TextStyle(
                                          color:
                                          TODoCubit.get(context).checkMode
                                              ? Colors.white
                                              : Colors.black),
                                      validate: (String s) {
                                        if (s.isEmpty && s.length < 3) {
                                          return 'please input Your Routine';
                                        } else {
                                          return null;
                                        }
                                      },
                                      prefix: Icon(
                                        Icons.content_paste_sharp,
                                        color: TODoCubit.get(context).checkMode
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      styleMe: TextStyle(
                                          color:
                                          TODoCubit.get(context).checkMode
                                              ? Colors.white
                                              : Colors.black),
                                      onchange: (s) {
                                        if (routineController.text.length > 2) {
                                          TODoCubit.get(context).showButtonAdd(true);
                                        } else{
                                          TODoCubit.get(context).showButtonAdd(false);
                                        }
                                      }),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: OutlinedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(defaultColor)),
                                              child: const Text(
                                                'cancel',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      if (TODoCubit.get(context).addButton)
                                        Expanded(
                                            child: TextButton(
                                                onPressed: () {
                                                  notificationController.text='on';
                                                  dateController.text=DateFormat.yMd().format(DateTime.now()) ;
                                                  timeController.text=DateFormat.Hm().format(DateTime.now().add(const Duration(minutes: 1)));

                                                  showModalBottomSheet(
                                                      backgroundColor: TODoCubit.get(context).checkMode
                                                          ? Colors.black
                                                          : Colors.white,
                                                      context: context,
                                                      isScrollControlled: true,
                                                      builder:
                                                          (context) => Padding(
                                                        padding: const EdgeInsets.all(13.0),
                                                          child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            const SizedBox(height: 15,),
                                                            Row(

                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children:  [
                                                                Text('Create Tasks',style: Theme.of(context).textTheme.bodyText1,)
                                                              ],
                                                            ),
                                                            const SizedBox(height: 15,),
                                                            Text('Repeat',style: Theme.of(context).textTheme.bodyText1),
                                                            const SizedBox(height: 15,),
                                                            Row(
                                                              children: [
                                                                const Text(
                                                                    'Select Date'),
                                                                const Spacer(),
                                                                MaterialButton(
                                                                    onPressed:
                                                                        () {},
                                                                    child: OutlinedButton(
                                                                      onPressed: () {
                                                                        showDatePicker(context: context, initialDate: DateTime.now(),
                                                                            firstDate: DateTime.now(), lastDate: DateTime.parse('2029-12-31'))
                                                                            .then((value) {
                                                                          dateController.text=DateFormat.yMd().format(value!) ;

                                                                          days=value.day;
                                                                          year=value.year;
                                                                          month=value.month;
                                                                          //print(dateController.text);
                                                                        });},
                                                                      child:
                                                                      Text(DateFormat.yMd().format(DateTime.now())),
                                                                    )
                                                                )],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    'Notification',style: Theme.of(context).textTheme.bodyText2),
                                                                const Spacer(),
                                                                OutlinedButton(
                                                                  onPressed: () {
                                                                    cubit.checkNotification();
                                                                    cubit.notification? notificationController.text='on':notificationController.text='off';
                                                                    cubit.notification? playNotification=true:playNotification=false;

                                                                  },
                                                                  style: ButtonStyle(
                                                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent)
                                                                  ),
                                                                  child:
                                                                  Row(
                                                                    children:  [
                                                                      Icon(cubit.notification?Icons.notifications:Icons.notifications_off,color:  Colors.white),
                                                                      const SizedBox(width: 3,),
                                                                      Text(cubit.notification?'On':'off',style:Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white) ,)

                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                const Text(
                                                                    'Select Time'),
                                                                const Spacer(),
                                                                MaterialButton(
                                                                  onPressed:
                                                                      () {},
                                                                  child: OutlinedButton(
                                                                      onPressed:
                                                                          () {
                                                                            timeController.text=DateTime.now().add(const Duration(minutes: 1)).toString();
                                                                        showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now().add(const Duration(minutes: 1)))).then((value){
                                                                          timeController.text=value!.format(context).toString();
                                                                          hour=value.hour;
                                                                          minutes=value.minute;
                                                                          // print(hour);
                                                                          // print(minutes);
                                                                          // month=DateTime.now().month;
                                                                          // year=DateTime.now().year;


                                                                        });},
                                                                      child:
                                                                      Text(DateFormat.Hm().format(DateTime.now().add(const Duration(minutes: 1))).toString())),
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child: OutlinedButton(
                                                                    onPressed: () {Navigator.pop(context);},
                                                                    style: ButtonStyle(
                                                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent)
                                                                    ),
                                                                    child:  Text('cancel',style: Theme.of(context).textTheme.bodyText2),),
                                                                ),
                                                                const SizedBox(width: 5,),
                                                                Expanded(
                                                                  child: OutlinedButton(
                                                                    onPressed: () {
                                                                      if(timeController.text!=DateTime.now()) {
                                                                        TODoCubit().insertDatabase(
                                                                          table: 'tasks',title:routineController.text,
                                                                          notification: notificationController.text,time: timeController.text,
                                                                          date: dateController.text).then((value) async{

                                                                        year==0?year=DateTime.now().year:year;
                                                                        month==0?month=DateTime.now().month:month;
                                                                        days==0?days=DateTime.now().day:days;
                                                                        hour==0?DateTime.now().hour:hour;
                                                                        minutes==0?DateTime.now().minute:minutes;

                                                                        print('year : $year month : $month');

                                                                        if(playNotification==true) {
                                                                          await NotificationServiceTasks().showScheduledLocalNotification(
                                                                            id: dataTasks.length,
                                                                            title: routineController.text,
                                                                            body: "you should do your task Now Bro",
                                                                            payload: "You just took water! Huurray!",
                                                                          year: year,month: month,day: days,hour: hour,minute:minutes,
                                                                                );
                                                                        }

                                                                        TODoCubit.get(context).getDatabase(TODoCubit.db).then((value){
                                                                          Navigator.pop(context);
                                                                          Navigator.pop(context);
                                                                        });


                                                                      });
                                                                      }
                                                                    },
                                                                    style: ButtonStyle(
                                                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent)
                                                                    ),
                                                                    child:  Text('add',style: Theme.of(context).textTheme.bodyText2),),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ));

                                                },
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(defaultColor)),
                                                child: const Text(
                                                  'next',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })));
      },
    );
  }

}

