import 'package:equatable/equatable.dart';

class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class LoadApp extends AppEvent {}

class ToggleDarkMode extends AppEvent {}
