
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/states.dart';
import '../cubit/to_do.dart';






class Executing extends StatefulWidget    {
 final Map data;
 final String nameOfTable;
 final Color chooseColor;
  const Executing({Key? key,required  this.data,required this.nameOfTable,required this.chooseColor}) : super(key: key);

  @override
  State<Executing> createState() => _ExecutingState();
}

class _ExecutingState extends State<Executing> with SingleTickerProviderStateMixin {
  bool swap=true;
  late AnimationController controller;
  //late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(vsync: this,duration: const Duration(milliseconds:  500));
   // animation!.value(.5);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TODoCubit,ToDoStates>(
      listener: (context,state){},
      builder: (context,state) {


        var cubit=TODoCubit.get(context);

        String strDigits(int n) => n.toString().padLeft(2, '0');


        final hours = strDigits(cubit.myDuration!.inHours.remainder(24));
        final minutes = strDigits(cubit.myDuration!.inMinutes.remainder(60));
        final seconds = strDigits(cubit.myDuration!.inSeconds.remainder(60));
        return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            if(TODoCubit.get(context).countDownTimer!=null) {
              TODoCubit.get(context).stopTimer();
            }
            Navigator.pop(context);
          },icon: const Icon(Icons.arrow_back_ios)),
          title: Text(widget.data['title'].toString(),style: Theme.of(context).textTheme.bodyText1,),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(!cubit.completed)
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      elevation: 15,
                      child:Container(

                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: widget.chooseColor
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.data['title'].toString(),textAlign: TextAlign.center,style: const TextStyle(color: Colors.black,fontSize: 50,fontWeight: FontWeight.bold),),
                                Text(
                                  '$hours :$minutes :$seconds',textAlign: TextAlign.center,style: const TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),



                              ],
                            ),
                          ),

                    ),
                  ),
                  if(cubit.completed)
                  Text('Good Work',style: Theme.of(context).textTheme.bodyText1,)
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(children: [
                Expanded(
                  child: TextButton(onPressed: (){Navigator.pop(context);}, child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.swipe_left),SizedBox(height: 3,),Text('Skip')
                    ],
                  )),
                ),
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:  swap?Colors.red:Colors.blue,

                    ),

                    child: IconButton(
                        onPressed: () {
                          if(swap) {
                            cubit.startTimer();
                            controller.forward();
                          }else{
                            cubit.stopTimer();
                            controller.reverse();
                          }
                          swap=!swap;
                        },
                          icon: AnimatedIcon(
                            icon: AnimatedIcons.pause_play,
                            progress: controller,
                            color: Colors.white,
                          ) //Icon(swap! ?Icons.play_arrow:Icons.pause,
                          ),
                  ),
                ),

                Expanded(
                  child: TextButton(onPressed: (){
                    cubit.changeToCompleted();
                    cubit.updateDatabase(id: widget.data['id'], nameTable: widget.nameOfTable, nameRow: 'status', result: 'complete');

                  }, child:Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                  Icon(Icons.swipe_right),SizedBox(height: 3,),Text('Completed')
                    ],
                  ) ),
                ),
              ],),
            ),


          ],
        ),

      );
      },
    );
  }

}
