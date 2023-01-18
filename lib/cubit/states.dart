abstract class ToDoStates{}
class ToDoInitialState extends ToDoStates{}
class ToDoChangeBottomNavigationBarState extends ToDoStates{}
class ToDoChangeModeState extends ToDoStates{}
class ToDoChooseModeState extends ToDoStates{}
class ToDoChooseColorSuccessState extends ToDoStates{}
class ToDoChangeAddButtonState extends ToDoStates{}
class ToDoChangeNextButtonState extends ToDoStates{}
class ToDoChangeBoolState extends ToDoStates{}
// Database
class ToDoCreateDatabaseSuccessState extends ToDoStates{}
class ToDoCreateDatabaseErrorState extends ToDoStates{}
class ToDoInsertDatabaseSuccessState extends ToDoStates{}
class ToDoInsertDatabaseErrorState extends ToDoStates{}
class ToDoCheckNotificationSuccessState extends ToDoStates{}
class ToDoGetDatabaseSuccessState extends ToDoStates{}
class ToDoGetDatabaseTasksSuccessState extends ToDoStates{}
class ToDoGetDeleteDatabaseSuccessState extends ToDoStates{}
class ToDoGetDeleteDatabaseErrorState extends ToDoStates{
  final error;

  ToDoGetDeleteDatabaseErrorState(this.error);
}
class ToDoUpdateDatabaseSuccessState extends ToDoStates{}
class ToDoChangeTasksSuccessState extends ToDoStates{}
// Timer
class ToDoSelectDurationSuccessState extends ToDoStates{}
class ToDoCountDownTimerSuccessState extends ToDoStates{}
class ToDoCountDownTimerStartSuccessState extends ToDoStates{}
class ToDoCountDownTimerStopSuccessState extends ToDoStates{}
class ToDoChangeCompletedSuccessState extends ToDoStates{}

//Animation
class ToDoAnimatedIconSuccessState extends ToDoStates{}


