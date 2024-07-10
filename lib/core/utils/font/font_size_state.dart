part of 'font_size_cubit.dart';

@immutable
abstract class FontSizeState {}

class FontSizeInitial extends FontSizeState {}
class FontSizeLoadedState extends FontSizeState{
  final double fontSize;
  FontSizeLoadedState({required this.fontSize});
}
class FontSizeChooseDoneFromDialog extends FontSizeState{
  final FontSize fontSize;
  FontSizeChooseDoneFromDialog({required this.fontSize});
}
