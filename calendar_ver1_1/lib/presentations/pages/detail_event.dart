import 'package:calendar_ver1/domain/entity/event/event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailEvent {
  DetailEvent({required this.event});
  Event event;

  TextEditingController _eventController = TextEditingController();

  
  Event showDetail(BuildContext context) {
    DateTime date = event.date;
    Event newEvent = event;
    showDialog(context: context, builder: (context) {
        return AlertDialog(
            title: Text('Изменение события'),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _eventController,
                          
                        ),
                      ),
                      actions: [
                        ElevatedButton(onPressed: () {
                            showDatePicker(
                                context: context, 
                                firstDate: DateTime(2020,10,10), 
                                lastDate: DateTime(2030,12,31), 
                                initialDate: event.date).then((value) {
                                date = value ?? date;
                            });

                        }, 
                            child: Text('Изменить дату')),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            newEvent = Event(id: '0', title: _eventController.text, date: date);
                            
                            
                          }, 
                          child: Text('Сохранить'))
                      ],
        );
    });
    return newEvent;
  }
}