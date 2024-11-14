import 'package:calendar_ver1/core/static/utils.dart';
import 'package:calendar_ver1/domain/entity/event/event.dart';
import 'package:calendar_ver1/domain/use_case/get_events_for_day_use_case.dart';
import 'package:calendar_ver1/presentations/cubit/event_cubit.dart';
import 'package:calendar_ver1/presentations/pages/detail_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({ Key? key }) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}


class _CalendarPageState extends State<CalendarPage> {

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {};

  TextEditingController _eventController = TextEditingController();
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar( 
              title: const Text('Календарь'), // Set the app's title. 
              // Add a hamburger menu icon to the leading position in the app bar. 
              leading: Builder( 
                builder: (context) => IconButton( 
                  icon: const Icon(Icons.menu), 
                  onPressed: () => Scaffold.of(context).openDrawer(), 
                ), 
              ), 
              // Add a notification icon with a red circle in the app bar's actions. 
              actions: [ 
                Stack( 
                  children: [ 
                    IconButton( 
                      onPressed: () {}, 
                      icon: const Icon(Icons.notifications), 
                    ), 
                    Positioned( 
                      right: 11, 
                      top: 11, 
                      child: Container( 
                        padding: const EdgeInsets.all(1), 
                        decoration: BoxDecoration( 
                          color: AppColors.ultraRed, // Red circle color. 
                          borderRadius: BorderRadius.circular(6), 
                        ), 
                        constraints: const BoxConstraints( 
                          minWidth: 14, 
                          minHeight: 14, 
                        ), 
                        child: const Text( 
                          '3', // Display the notification count. 
                          style: TextStyle( 
                            color: AppColors.babyPowder, // Text color. 
                            fontSize: 8, 
                          ), 
                          textAlign: TextAlign.center, 
                        ), 
                      ), 
                    ) 
                  ], 
                ), 
              ], 
            ), 
            // Drawer widget creates a side navigation menu. 
            drawer: Drawer( 
              child: ListView( 
                padding: EdgeInsets.zero, 
                children: [ 
                  const DrawerHeader( 
                    decoration: BoxDecoration( 
                      color: AppColors.eggPlant, // Header background color. 
                    ), 
                    child: Text( 
                      'Menu', 
                      style: TextStyle( 
                        color: AppColors.babyPowder, // Header text color. 
                        fontSize: 24, 
                      ), 
                    ), 
                  ), 
                  ListTile( 
                    leading: const Icon(Icons.home), 
                    title: const Text('Главная'), 
                    onTap: () { 
                      Navigator.pop(context); // Close the drawer when Home is tapped. 
                    }, 
                  ), 
                  ListTile( 
                    leading: const Icon(Icons.calendar_today), 
                    title: const Text('Календарь'), 
                    onTap: () { 
                      Navigator.pop(context); // Close the drawer when Calendar is tapped. 
                    }, 
                  ), 
                  ListTile( 
                    leading: const Icon(Icons.settings), 
                    title: const Text('Настройки'), 
                    onTap: () { 
                      Navigator.pop(context); // Close the drawer when Settings is tapped. 
                    }, 
                  ), 
                ], 
              ), 
            ), 
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context, 
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Создание события'),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _eventController,
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Event newEvent = Event(id: '0', title: _eventController.text, date: _selectedDay!);

                            if (events.containsKey(_selectedDay)) {
                              events[_selectedDay]!.add(newEvent);
                            } else {
                              events[_selectedDay!] = [newEvent];
                            }
                            _selectedEvents.value = _getEventsForDay(_selectedDay!);
                            //context.read<EventCubit>().addEvent(Event(id: '0', title: _eventController.text, date: _selectedDay!));
                          }, 
                          child: Text('Создать'))
                      ],
                    );
                });
              }),
            body: Column(
              children: [
                Center(
                  child: TableCalendar(
                    firstDay: DateTime(2020,10,10), 
                    focusedDay: _focusedDay, 
                    lastDay: DateTime(2030,12,31),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        // Call `setState()` when updating the selected day
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                          _selectedEvents.value = _getEventsForDay(_selectedDay!);
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      // No need to call `setState()` here
                      _focusedDay = focusedDay;
                    },
                    calendarFormat: CalendarFormat.month,
                    headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                    availableGestures: AvailableGestures.all,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    locale: 'ru_Ru',
                    
                    // eventLoader: (day) {///////////
                    //     context.read<EventCubit>().getEvents(day);
                    //     return state.events ?? List.empty();
                    //   },
                    eventLoader: _getEventsForDay,
                    ),
                    
                          
                ),
                Expanded(
                  child: ValueListenableBuilder<List<Event>>(
                        valueListenable: _selectedEvents, 
                        builder: (BuildContext context, value, _) { 
                          return ListView.builder(
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.babyPowder

                              ),
                              child: ListTile(
                                onTap: () {
                                  _showEditEventDialog(value[index]);
                                  _selectedEvents.value = _getEventsForDay(_selectedDay!);
                                },
                                title: Text('${value[index].title}'),
                                
                              ),
                            );
                  
                          });
                         },),
                )
              ],
            ),
          );
  }

void _showEditEventDialog(Event event) {
    _eventController.text = event.title;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Редактирование события'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _eventController,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                event.title = _eventController.text;
                _selectedEvents.value = _getEventsForDay(_selectedDay!);
                _eventController.clear();
              },
              child: Text('Сохранить'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteEvent(event);
              },
              child: Text('Удалить'),
              style: ElevatedButton.styleFrom(foregroundColor:  Colors.red),
            ),
            
          ],
        );
      },
    );
  }
    void _deleteEvent(Event event) {
    setState(() {
      events[_selectedDay]!.remove(event);
      if (events[_selectedDay]!.isEmpty) {
        events.remove(_selectedDay);
      }
      _selectedEvents.value = _getEventsForDay(_selectedDay!);
    });
  }


  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider<EventCubit>.value(
  //     value: GetIt.I(),
  //     child: BlocBuilder<EventCubit, EventState>(
  //       builder: (context, state) {
  //         return Scaffold(
  //           floatingActionButton: FloatingActionButton(
  //             child: const Icon(Icons.add),
  //             onPressed: () {
  //               showDialog(
  //                 context: context, 
  //                 builder: (context) {
  //                   return AlertDialog(
  //                     title: Text('Создание события'),
  //                     content: Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: TextField(
  //                         controller: _eventController,
  //                       ),
  //                     ),
  //                     actions: [
  //                       ElevatedButton(
  //                         onPressed: () {
  //                           Navigator.of(context).pop();
  //                           Event newEvent = Event(id: '0', title: _eventController.text, date: _selectedDay!);

  //                           if (events.containsKey(_selectedDay)) {
  //                             events[_selectedDay]!.add(newEvent);
  //                           } else {
  //                             events[_selectedDay!] = [newEvent];
  //                           }
  //                           _selectedEvents.value = _getEventsForDay(_selectedDay!);
  //                           //context.read<EventCubit>().addEvent(Event(id: '0', title: _eventController.text, date: _selectedDay!));
  //                         }, 
  //                         child: Text('Создать'))
  //                     ],
  //                   );
  //               });
  //             }),
  //           body: SingleChildScrollView(
  //             child: Column(
  //               children: [
  //                 Center(
  //                   child: TableCalendar(
  //                     firstDay: DateTime(2020,10,10), 
  //                     focusedDay: _focusedDay, 
  //                     lastDay: DateTime(2030,12,31),
  //                     selectedDayPredicate: (day) {
  //                       return isSameDay(_selectedDay, day);
  //                     },
  //                     onDaySelected: (selectedDay, focusedDay) {
  //                       if (!isSameDay(_selectedDay, selectedDay)) {
  //                         // Call `setState()` when updating the selected day
  //                         setState(() {
  //                           _selectedDay = selectedDay;
  //                           _focusedDay = focusedDay;
  //                         });
  //                       }
  //                     },
  //                     onPageChanged: (focusedDay) {
  //                       // No need to call `setState()` here
  //                       _focusedDay = focusedDay;
  //                     },
  //                     calendarFormat: CalendarFormat.month,
  //                     headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
  //                     availableGestures: AvailableGestures.all,
  //                     startingDayOfWeek: StartingDayOfWeek.monday,
  //                     locale: 'ru_Ru',
                      
  //                     // eventLoader: (day) {///////////
  //                     //     context.read<EventCubit>().getEvents(day);
  //                     //     return state.events ?? List.empty();
  //                     //   },
  //                     eventLoader: _getEventsForDay,
  //                     ),
                      
                            
  //                 ),
  //                 ValueListenableBuilder<List<Event>>(
  //                       valueListenable: _selectedEvents, 
  //                       builder: (BuildContext context, value, _) { 
  //                         return ListView.builder(itemBuilder: (context, index) {
  //                           return Container(
  //                             margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
  //                             decoration: BoxDecoration(
  //                               border: Border.all(),
  //                               borderRadius: BorderRadius.circular(12),
  //                             ),
  //                             child: ListTile(
  //                               onTap: () => print(''),
  //                               title: Text('${value[index]}'),
  //                             ),
  //                           );
                  
  //                         });
  //                        },)
  //               ],
  //             ),
  //           ),
  //         );
  //       }
  //     ),);
  // }

  
}