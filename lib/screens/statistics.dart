import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../cubit/to_do.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: TODoCubit.get(context).checkMode?Colors.white:Colors.black,
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          title: Text(
            'Statistics',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 87,
                  decoration: BoxDecoration(
                    color:  HexColor('5D4D8FFF'),
                    borderRadius:BorderRadius.circular(10)
                    ,
                  ),
                  //margin: EdgeInsets.all(15),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('0/0',style: style,),
                          Text('Today\'s progress'),
                        ],
                      )
                    ],),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  color:  HexColor('5D4D8FFF'),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:const [
                        Text('Weekly Activity',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                        , Text('You have 0 task this week',style:  TextStyle(fontSize: 18)),



                      ],
                    ),
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text('History',style: Theme.of(context).textTheme.bodyText1,),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Expanded(child:ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context,index)=>clickItem(context,data: dataTasks,index: index,nameOfTable: 'tasks'),
                          separatorBuilder: (context,index)=>const SizedBox(width: 5,),
                          itemCount: dataTasks.length) )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
