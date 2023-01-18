

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/screens/Routines.dart';
import 'package:to_do_app/screens/on_boarding/on_boarding.dart';
import 'package:to_do_app/shared/MyBlocObserver.dart';
import 'package:to_do_app/shared/network/local.dart';
import 'package:to_do_app/shared/themes.dart';


import 'cubit/states.dart';
import 'cubit/to_do.dart';
import 'home_layout.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
//first project
  await CashHelper.init();
  Widget? startWidget;

  bool? firstTime=await CashHelper.getData('firstTime');
  if(firstTime != null){
    startWidget =  const HomeLayout();}
  else {
    startWidget = const OnBoarding();
    CashHelper.putDataBool('firstTime',value: true);
  }
  bool? receiveMode=await CashHelper.getData('mode');


  Bloc.observer = MyBlocObserver();
  runApp(
    //   DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(start: startWidget!,mode: receiveMode??false), // Wrap your app
    // ),
      MyApp(start: startWidget,mode: receiveMode??false)
  );

}


class MyApp extends StatelessWidget {
  Widget start;
  bool mode;
  MyApp({Key? key,required this.start,required this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>TODoCubit()..createDatabase()..changeMode(mode: mode)
        )
      ],child:  BlocConsumer<TODoCubit,ToDoStates>(
      listener: (context,state){},
      builder:(context,state)=> MaterialApp(

        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode:TODoCubit.get(context).checkMode?ThemeMode.dark:ThemeMode.light,
        home:  start,
        routes: {'Routines':(context)=>Routines(),
          'HomeLayout':(context)=> const HomeLayout(),
        },
      ),
    ),
    );
  }
}

