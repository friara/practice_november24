import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:demo_clean_architecture/core/failure/failure.dart';
import 'package:demo_clean_architecture/feature/color/data/data_source/local_color_data_source.dart';
import 'package:demo_clean_architecture/feature/color/domain/entity/color_falure.dart';
import 'package:path_provider/path_provider.dart';

class FileLocalColorDataSource implements LocalColorDataSource{
  @override
  Future<Either<ColorFailure, String>> read() async {
    try {
      final color = await readData();
      return Right(color);
    } catch (e) {
      return Left(ColorFailure(code: 1, message: e.toString()));
    }
  }

  @override
  Future<Either<ColorFailure, String>> write(String color) async {
    try {
      await writeData(color);
      return Right(color);
    } catch (e) {
      return Left(ColorFailure(code: 1, message: e.toString()));
    }
  }
  
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get localFile async {
    final path = await localPath;

    return File('$path/color.txt');
  }

  Future<void> writeData(String data) async {
    final file = await localFile;

    await file.writeAsString(data);
  }

  Future<String> readData() async {
    final file = await localFile;

    if(!file.existsSync()) {
      file.writeAsStringSync('0xFFFFFFF');
    }
    
    return file.readAsString();
  }
}