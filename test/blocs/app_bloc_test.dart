import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:todo_flutter/blocs/blocs.dart';
import 'package:todo_flutter/providers/providers.dart';

class MockAppProvider extends Mock implements AppProvider {}

void main() {
  group('AppBloc', () {
    AppBloc appBloc;
    MockAppProvider appProvider;

    setUp(() {
      appProvider = MockAppProvider();
      when(appProvider.loadAppState())
          .thenAnswer((_) => Future.value({'darkMode': false}));
      appBloc = AppBloc();
    });

    tearDown(() {
      appBloc?.close();
    });

    test('initial state is correct', () {
      expect(appBloc.initialState, AppLoading());
    });

    blocTest<AppBloc, AppEvent, AppState>(
      'should emit AppLoadFail if repository throws',
      build: () {
        when(appProvider.loadAppState()).thenThrow(Exception('Exception'));
        return appBloc;
      },
      act: (AppBloc bloc) async => bloc.add(LoadApp()),
      expect: <AppState>[
        AppLoading(),
        AppLoadFail(),
      ],
    );

    blocTest<AppBloc, AppEvent, AppState>(
      'should toggle darkMode when call ToggleDarkMode Event',
      build: () => appBloc,
      act: (AppBloc bloc) async => bloc..add(LoadApp())..add(ToggleDarkMode()),
      expect: <AppState>[
        AppLoading(),
        AppLoadSuccess(darkMode: false),
        AppLoadSuccess(darkMode: true),
      ],
    );
  });
}
