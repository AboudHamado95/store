
part of 'theme_cubit.dart';


abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeLoadedState extends ThemeState{
  final ThemeData theme;
  final AppTheme globalAppTheme;
  ThemeLoadedState({required this.theme,required this.globalAppTheme});
}