import 'package:flutter/material.dart';

import '../../cubit/to_do.dart';
import '../../screens/executing.dart';
import '../notification/notification_routine.dart';
import '../notification/notification_tasks.dart';
import 'constants.dart';


void navigatorReuse(context,widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}

Widget defaultTextFromField({
  required TextEditingController? controller,
  required TextInputType? inputKeyboardType,
  required String? text,
   String? hintText,
  Function? onSubmit,
  Function? onchange,
  Function? onTap,
  required Function?  validate,
  TextStyle? styleMe,
  TextStyle? styleController,
   Icon? prefix,
  IconButton? suffix,
  bool passwordEnable=false,
})=>
    TextFormField(
        controller: controller,
        keyboardType: inputKeyboardType,
        obscureText: passwordEnable,
        style:styleController,
        decoration: InputDecoration(

          labelStyle: styleMe,
            labelText: text,
            hintText: hintText,
            border: const OutlineInputBorder(), //لاحاطه النص
            prefixIcon: prefix,
            suffixIcon: suffix),
        //onFieldSubmitted: (s){onSubmit!(s);},
        onChanged: (s){onchange!(s);},
        //onTap: (){onTap!();},
        validator: (s) {
          validate!(s);
          return null;
        });



Widget clickItem(context, {required data,required index,required String nameOfTable}){
    Color that=Colors.cyanAccent;
  return InkWell(
    onTap: ()
    {
      showModalBottomSheet(context: context, builder: (context)=>Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [Text('Pick time',style: Theme.of(context).textTheme.bodyText1,)],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: ()
                      {
                        TODoCubit.get(context).num=10;
                        TODoCubit.get(context).myDuration1();
                        TODoCubit.get(context).changeToCompleted(complete: false);


                      },
                      child:  Text('10 min',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),),style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(defaultColor),
                    ),),
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: OutlinedButton(onPressed: (){
                      TODoCubit.get(context).num=20;
                      TODoCubit.get(context).myDuration1();
                      TODoCubit.get(context).changeToCompleted(complete: false);

                    }, child:  Text('20 min',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),),style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(defaultColor),
                    ),),
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: OutlinedButton(onPressed: (){
                      TODoCubit.get(context).num=30;
                      TODoCubit.get(context).myDuration1();
                      TODoCubit.get(context).changeToCompleted(complete: false);
                    }, child:  Text('30 min',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),),style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(defaultColor),
                    ),),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(onPressed: (){

                      TODoCubit.get(context).num=40;
                      TODoCubit.get(context).myDuration1();
                      TODoCubit.get(context).changeToCompleted(complete: false);
                    }, child:  Text('40 min',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),),style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(defaultColor),
                    ),),
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: OutlinedButton(onPressed: (){

                      TODoCubit.get(context).num=50;
                      TODoCubit.get(context).myDuration1();
                      TODoCubit.get(context).changeToCompleted(complete: false);
                    }, child:  Text('50 min',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),),style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(defaultColor),
                    ),),
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        TODoCubit.get(context).num=60;
                        TODoCubit.get(context).myDuration1();
                        TODoCubit.get(context).changeToCompleted(complete: false);

                      },
                      child: Text(
                        '60 min',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            defaultColor),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {

                        TODoCubit.get(context).num=70;
                        TODoCubit.get(context).myDuration1();
                        TODoCubit.get(context).changeToCompleted(complete: false);
                      }, child:  Text('70 min',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),),style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(defaultColor),
                    ),),
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: OutlinedButton(onPressed: (){
                    TODoCubit.get(context).num=80;
                    TODoCubit.get(context).myDuration1();
                    TODoCubit.get(context).changeToCompleted(complete: false);
                    }, child:  Text('80 min',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),),style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(defaultColor),
                    ),),
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: OutlinedButton(onPressed: (){
                    TODoCubit.get(context).num=90;
                    TODoCubit.get(context).myDuration1();
                    TODoCubit.get(context).changeToCompleted(complete: false);
                    }, child:  Text('90 min',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),),style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(defaultColor),
                    ),),
                  ),
                ],
              ),
              Row(
                children: [Text('Pick color',style: Theme.of(context).textTheme.bodyText1,)],
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          //TODoCubit().chooseColor(Colors.red);
                          that=Colors.red;

                        },
                        child: CircleAvatar(
                                  radius: 15,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                      borderRadius: BorderRadius.circular(30)
                                    ),

                                  ),
                                ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(

                      child: InkWell(
                        onTap: (){
                          that=Colors.yellow;
                        },
                        child: CircleAvatar(
                                  radius: 15,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(30)
                                    ),

                                  ),
                                ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          that=Colors.blue;
                        },
                        child: CircleAvatar(
                          radius: 15,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)
                            ),

                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          that=Colors.cyan;
                        },
                        child: CircleAvatar(
                          radius: 15,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(30)
                            ),

                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                         that=Colors.green;

                        },
                        child: CircleAvatar(
                          radius: 15,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(30)
                            ),

                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          that=Colors.orange;

                        },
                        child: CircleAvatar(
                          radius: 15,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(30)
                            ),

                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          that=Colors.purpleAccent;

                        },
                        child: CircleAvatar(
                          radius: 15,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.purpleAccent,
                                borderRadius: BorderRadius.circular(30)
                            ),

                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Row(children: [
                Expanded(
                  child: OutlinedButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel',style: Theme.of(context).textTheme.bodyText2,),style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(defaultColor),)),
                ),
                const SizedBox(width: 15,),
                Expanded(
                            child: OutlinedButton(
                                onPressed: () {
                                  navigatorReuse(context, Executing(nameOfTable: nameOfTable,data: data[index],chooseColor:that ,));
                                },
                                child: Text(
                                  'Ready',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          defaultColor),
                                )),
                          ),
                        ],)
            ],
          ),
        ),
      ));

    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          //Text((index+1).toString(),style: Theme.of(context).textTheme.bodyText1,),
          const SizedBox(height: 15,),
          Container(
            //elevation: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepPurple,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[index]['title'],style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.white,fontSize: 20
                      ),),
                      const SizedBox(height: 3,),
                      Row(
                        children: [
                          Text(data[index]['date'],style: TextStyle(fontSize: 15,color: Colors.grey[300]),),
                          const SizedBox(width: 4,),
                          Text(data[index]['time'].toString(),style: TextStyle(fontSize: 15,color: Colors.grey[300]),),

                        ],
                      ),
                      const SizedBox(height: 3,),
                      if(data[index]['status']=="new")
                        Text("$nameOfTable not complete",style: TextStyle(fontSize: 15,color: Colors.grey[300])),
                      if(data[index]['status']=="complete")
                        Text("$nameOfTable completed",style: TextStyle(fontSize: 15,color: Colors.grey[300])),
                    ],
                  ),
                  const Spacer(),
                  IconButton(onPressed: (){
                    showModalBottomSheet(context: context, builder: (context)=>Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        color:TODoCubit.get(context).checkMode
                            ? Colors.black
                            : Colors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultTextFromField(
                                controller: editController,
                                inputKeyboardType: TextInputType.text,
                                text: 'Routine',
                                hintText: 'ex: gym',
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
                                    color: TODoCubit.get(context).checkMode
                                        ? Colors.white
                                        : Colors.black),
                                onchange: (s) {},
                                onSubmit: (){
                                  //TODoCubit.get(context).updateDatabase(id: index,nameTable: 'routine',nameRow: 'title',result: editController.text);
                                }
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    )).then((value) {
                      if(value ==' '){}else {
                        TODoCubit.get(context).updateDatabase(id: index+1,nameTable: nameOfTable,nameRow: 'title',result: editController.text);
                      }

                    });
                  }, icon: const Icon(Icons.edit,color:  Colors.white,)),
                  IconButton(onPressed: (){
                    if(nameOfTable=='routine') {

                      NotificationServiceRoutine().cancel(index);
                    }else{
                      TODoCubit.get(context).checkTasks(true);
                      NotificationServiceTasks().cancel(index);
                    }
                    TODoCubit.get(context).deleteDatabase(id: data[index]['id'],nameTable: nameOfTable);


                  }, icon: const Icon(Icons.delete,color: Colors.white,)),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
