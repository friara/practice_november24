import 'package:demo_clean_architecture/core/failure/failure.dart';

class ColorFailure extends Failure {
  ColorFailure({required super.code, super.message});

  @override
  String getLocalizedString() {
    return 'Ошибка';
  }
}