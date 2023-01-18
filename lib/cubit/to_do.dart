

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:to_do_app/cubit/states.dart';

import '../screens/Routines.dart';
import '../screens/home_page.dart';
import '../screens/setting.dart';
import '../shared/components/constants.dart';
import '../shared/network/local.dart';

class TODoCubit extends Cubit<ToDoStates>{

  TODoCubit() : super(ToDoInitialState());

  static TODoCubit get(context) =>BlocProvider.of(context);
  var displayTime=StopWatchTimer.getDisplayTime(5);
  List<Widget> screens=[ const HomePage(), Routines(), const Setting()];
  List<BottomNavigationBarItem>iconsBottom=[
    const BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
    const BottomNavigationBarItem(icon:  Icon(Icons.check ),label: 'routines'),
    const BottomNavigationBarItem(icon: Icon(Icons.settings ),label: 'setting'),
  ];
  int currentIndex=0;
void change(int index){

  currentIndex=index;
  emit(ToDoChangeBottomNavigationBarState());
  }

  bool checkMode=false;
  changeMode({bool? mode}) {
  //emit(ToDoChangeModeState());
    if(mode!=null) {
      checkMode=mode;
    }
    else
    {
      checkMode=!checkMode;
      CashHelper.putDataBool('mode',value: checkMode).then((value) {emit(ToDoChangeModeState());});
    }


  }

  bool addButton=false;
  void showButtonAdd(bool add){
     emit(ToDoChangeAddButtonState());
     addButton=add;
  }
  bool nextButton=false;
  void showButtonNext(bool add){
    emit(ToDoChangeNextButtonState());
    nextButton=add;
  }

  bool notification=true;
void checkNotification()
{
  notification=!notification;
  emit(ToDoCheckNotificationSuccessState());
}

  bool completed=false;
void changeToCompleted({bool? complete}){
    if (complete != null) {
      emit(ToDoChangeBoolState());
      completed = complete;
    }else{ emit(ToDoChangeCompletedSuccessState());
    completed=!completed;}


}


      static Database? db;

   createDatabase()async{

    db=await openDatabase(
    'todoFinal.db',
    version: 1,
    onCreate: (database,version)async
    {
    //print('data base created');

     await database.execute
    ('CREATE TABLE routine (id INTEGER PRIMARY KEY, title TEXT, date TEXT,notification TEXT, time TEXT,status TEXT)')
        .then((value) {
          db=database;
          //print('routine tables created');
          emit(ToDoCreateDatabaseSuccessState());
    }).catchError((error){
      emit(ToDoCreateDatabaseErrorState());
      //print('error in created table${error.toString()}');
    });
    await database.execute
      ('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT,notification TEXT, time TEXT,status TEXT)')
        .then((value) {

      //print('tasks tables created');
      emit(ToDoCreateDatabaseSuccessState());
    }).catchError((error){
      emit(ToDoCreateDatabaseErrorState());
      //print('error in created table${error.toString()}');
    });

    },
    onOpen: (database){
      db=database;
      getDatabase(database);
      getDatabaseTasks(database);
    //print('data base opened');
    }
    );
  }

   Future insertDatabase(
      {required String table,
      required String title,
      required String time,
      required String date,
      required String notification,String? status})async {
    await db?.transaction((txn) {
       if(table=='routine') {
      return   txn.rawInsert('INSERT INTO routine(title,date,notification, time ,status) VALUES("$title","$date","$notification","$time","${status ?? 'new'}")')
           .then((value) {
        getDatabase(db);
        //print('$value insert routine success');
        emit(ToDoInsertDatabaseSuccessState());
       }).catchError((error){
        emit(ToDoInsertDatabaseErrorState());
        //print("${error.toString()} please check your insert");
       });

       }
       else
       {
         return  txn.rawInsert('INSERT INTO tasks(title, date, notification, time, status) VALUES("$title","$date","$notification", "$time","${status ?? 'new'}")')
             .then((value) {
           emit(ToDoInsertDatabaseSuccessState());
           getDatabaseTasks(db);
           //print('insert task success');
         }).catchError((error){
           emit(ToDoInsertDatabaseErrorState());
           //print("${error.toString()} please check your insert");
         });
       }

     });
  }

 Future getDatabase(database)async {
    emit(ToDoGetDatabaseSuccessState());
     data=await database.rawQuery('SELECT * FROM routine');

  }

 Future getDatabaseTasks(database)async {
    emit(ToDoGetDatabaseTasksSuccessState());
    dataTasks=await database.rawQuery('SELECT * FROM tasks');

  }


 deleteDatabase({required int id,required String nameTable})async {
    await db!.rawDelete('DELETE FROM $nameTable WHERE id = ?', [id]).then((value) {
      emit(ToDoGetDeleteDatabaseSuccessState());
      if(nameTable == 'tasks') {
        getDatabaseTasks(db);
      }
      else {
        getDatabase(db);
      }

    }).catchError((error){
      print(error.toString());
      emit(ToDoGetDeleteDatabaseErrorState(error.toString()));
    });
  }

  updateDatabase({required int id,required String nameTable,required String nameRow,required String result})async {

    await db!.rawUpdate('UPDATE "$nameTable" SET "$nameRow" = "$result" WHERE id = "$id"').then((value) {
      emit(ToDoUpdateDatabaseSuccessState());
      if(nameTable == 'tasks') {
        getDatabaseTasks(db);
      }
      else {
        getDatabase(db);
      }

    });
  }
  Timer? countDownTimer;
   int? num;

   late Duration? myDuration;
   void myDuration1(){
     myDuration=divideTime(num!);
     emit(ToDoSelectDurationSuccessState());
   }


   void startTimer() {
     emit(ToDoCountDownTimerSuccessState());
     countDownTimer=Timer.periodic(const Duration(seconds: 1), (timer) { setCountDown();});
   }

   void stopTimer( ) {
     emit(ToDoCountDownTimerStopSuccessState());
     countDownTimer!.cancel();
   }

   void setCountDown(){

     const reduceSecondsBy =1;
     emit(ToDoCountDownTimerStartSuccessState());
     final seconds=myDuration!.inSeconds-reduceSecondsBy;
     if(seconds<0) {
       countDownTimer!.cancel();
     }else
     {
       myDuration=Duration(seconds: seconds);
     }
   }

  checkTasks(bool check){
     print(check);
     if(check){
       emit(ToDoChangeTasksSuccessState());
     }
  }



}