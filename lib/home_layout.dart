

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/screens/home_page.dart';
import 'package:to_do_app/shared/notification/notification_routine.dart';

import 'cubit/states.dart';
import 'cubit/to_do.dart';



class HomeLayout extends StatefulWidget
 {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late final NotificationServiceRoutine notificationService;
  @override
  void initState() {
    notificationService = NotificationServiceRoutine();
    listenToNotificationStream();
    notificationService.initializePlatformNotifications();
    super.initState();
  }

  void listenToNotificationStream() =>
      notificationService.behaviorSubject.stream.listen((payload) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(payload: payload)));
      });

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<TODoCubit,ToDoStates>(
        listener: (context,state){},
        builder:(context,state) {
          var cubit=TODoCubit.get(context);
          return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 17,

            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
              items: cubit.iconsBottom,
              currentIndex: cubit.currentIndex,
            onTap: (index){
                  cubit.change(index);
            },
          ),
            body: cubit.screens[cubit.currentIndex],
        );
        }
    );

  }
}
