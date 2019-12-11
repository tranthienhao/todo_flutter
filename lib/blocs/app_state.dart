import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppLoading extends AppState {}

class AppLoadSuccess extends AppState {
  final bool darkMode;

  const AppLoadSuccess({this.darkMode = false});

  @override
  List<Object> get props => [darkMode];

  @override
  String toString() => 'AppLoadSuccess { darkMode: $darkMode }';
}

class AppLoadFail extends AppState {}
