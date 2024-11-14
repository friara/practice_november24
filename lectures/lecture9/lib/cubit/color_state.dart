part of 'color_cubit.dart';

sealed class ColorState extends Equatable {
  final Color color;

  const ColorState(this.color);

  @override
  // TODO: implement props
  List<Object?> get props => [color]; //сравниваем объекты по цвету чтобы не перерисовывать лишний раз

}

final class ColorInitialState extends ColorState {
  const ColorInitialState() :super(Colors.red);

}

final class ColorCurrentState extends ColorState {
  const ColorCurrentState(super.color);

}