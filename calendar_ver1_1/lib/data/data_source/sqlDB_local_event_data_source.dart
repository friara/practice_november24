import 'package:calendar_ver1/core/failure/failure.dart';
import 'package:calendar_ver1/data/data_source/local_event_data_source.dart';
import 'package:calendar_ver1/domain/entity/event/event.dart';
import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqldbLocalEventDataSource implements LocalEventDataSource{
  late Database _database;

  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'events.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE events (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            date INTEGER
          )
        ''');
      },
    );
  }
  
  @override
  Future<Either<Failure, void>> add(Event event) async {
     try {
       await _database.insert(
          'events',
          event.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        return Right(null);
     } catch (e) {
       return Left(Failure(code: 400, message: 'Не удалось записать событие'));
     }
     
  }

  @override
  Future<Either<Failure, void>> delete(Event color) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Event>>> getEventsForDay(DateTime day) async {
    try {
      final start = DateTime(day.year, day.month, day.day);
    final end = start.add(Duration(days: 1));
    final maps = await _database.query(
      'events',
      where: 'date >= ? AND date < ?',
      whereArgs: [start.millisecondsSinceEpoch, end.millisecondsSinceEpoch],
    );
      return Right(List.generate(maps.length, (i) {
      return Event.fromMap(maps[i]);
    }));
    } catch (e) {
      return Left(Failure(code: 400, message: 'Не удалось получить события'));
    }
  }

  @override
  Future<Either<Failure, void>> update(Event color) {
    // TODO: implement update
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<Event>>> getEvents() async {
    try {
      final maps = await _database.query('events');
      return Right(List.generate(maps.length, (i) {
        return Event.fromMap(maps[i]);
      }));
    } catch (e) {
      return Left(Failure(code: 400, message: 'Не удалось получить события'));
    }
  }

}