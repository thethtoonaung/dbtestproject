part of 'app_bloc.dart';

@immutable
class AppState {
  final int index;
  const AppState({this.index = 0});
}

class AppInitial extends AppState {}
