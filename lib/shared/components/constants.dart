

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


var nameDayNow=DateFormat('EEEE').format(DateTime.now());
String firstDayOfWeek=DateFormat.yMd().format(DateTime.now().subtract(Duration(days: DateTime.now().weekday-1)));
class Day{
  static int dayNow=DateTime.now().hour;

  static String selectMorningOrNight() {
    if(dayNow<12){
      return 'Good Morning';
    }else{
      return 'Good Night';
    }
  }

}


Color defaultColor=Colors.deepPurple;
TextStyle style=const TextStyle(fontSize: 30,fontWeight: FontWeight.bold);

List<Map> data=[];
List<Map> dataTasks=[];
var editController=TextEditingController();

Duration divideTime(int num) {
  if(num>60) {
    return Duration(hours: 1,minutes: num-60);
  }else
  {
    return Duration(minutes: num);
  }
}
List<String> days=['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];


String? tasksOfWeek({data}) {
//${nameDayNow } ,${DateFormat.MMMMd().format(DateTime.now())}
int numTasks=0;
int length=data.length;

for(int k=0;k<7;k++)
{if(nameDayNow==days[k]){
  for(int i=0;i<7;i++)
  {
    for(int j=0;j<dataTasks.length;j++){
      if(data[j]['date']==DateFormat.yMd().format(DateTime.now().subtract(Duration(days: DateTime.now().weekday-1)).add(Duration(days: i))).toString()){
        numTasks++;
      }
    }

  }
  return(numTasks.toString());
}}




}
double tasksOfDay({required String day}) {
//${nameDayNow } ,${DateFormat.MMMMd().format(DateTime.now())}
  double numTasks=0;
  int length=dataTasks.length;
  for(int i=0;i<length;i++)
  {
    for(int j=0;j<days.length;j++)
    {
      if(day==days[j]) {
        if(dataTasks[i]['date']==DateFormat.yMd().format(DateTime.now().subtract(Duration(days: DateTime.now().weekday-1)).add(Duration(days: j))).toString()){
          numTasks++;
        }
      }
    }
    


  }
    return numTasks;
}



