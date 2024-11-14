// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'event.freezed.dart';
// part 'event.g.dart';

// @freezed
// class Event with _$Event{
//   const factory Event({required int id, required String title, required DateTime dateTime}) = _Event;

//   factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
// }

class Event {
  final String id;
  String title;
  DateTime date;

  Event({required this.id, required this.title, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      title: map['title'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }
}
