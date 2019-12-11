import 'package:bloc/bloc.dart';
import 'package:todo_flutter/blocs/blocs.dart';
import 'package:todo_flutter/providers/app_provider.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppProvider appProvider = new AppProvider();
  @override
  AppState get initialState => AppLoading();

  @override
  void onTransition(Transition<AppEvent, AppState> transition) {
    super.onTransition(transition);
    print('ℹ️ === transition: $transition');
  }

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is LoadApp) {
      yield* _mapLoadAppToState();
    } else if (event is ToggleDarkMode) {
      yield* _mapToggleDarkModeToState(event);
    }
  }

  Stream<AppState> _mapLoadAppToState() async* {
    try {
      final appState = await appProvider.loadAppState();
      yield AppLoadSuccess(darkMode: appState['darkMode']);
    } catch (_) {
      print('ℹ️ === _: $_');
      yield AppLoadFail();
    }
  }

  Stream<AppState> _mapToggleDarkModeToState(AppEvent event) async* {
    if (state is AppLoadSuccess) {
      bool currentDarkModeState = (state as AppLoadSuccess).darkMode ?? false;
      yield AppLoadSuccess(
        darkMode: !currentDarkModeState,
      );
      appProvider.saveAppState(darkMode: !currentDarkModeState);
    }
  }
}
