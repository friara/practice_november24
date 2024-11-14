part of 'color_cubit.dart';

sealed class ColorState extends Equatable{
  final Color color;
  final bool isLoading;
  final String error;

  ColorState({required this.color, this.isLoading = false, this.error = ''});

  @override
  // TODO: implement props
  List<Object?> get props => [color, isLoading, error];
}

class ColorCurrentState extends ColorState {
  ColorCurrentState({required super.color, super.isLoading, super.error});

}