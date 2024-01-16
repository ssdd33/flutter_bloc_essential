import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> with HydratedMixin {
  ThemeBloc() : super(ThemeState.initial()) {
    hydrate();
    on<ChangeThemeEvent>((event, emit) {
      AppTheme theme;
      if (state.appTheme == AppTheme.light) {
        theme = AppTheme.dark;
      } else {
        theme = AppTheme.light;
      }
      emit(state.copyWith(appTheme: theme));
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    print('theme from storage: $json');
    final themeState = ThemeState.fromJson(json);
    print('themeState : $themeState');
    return themeState;
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    print('themeState to storage: $state');
    final themeJson = state.toJson();
    print('themeJson: $themeJson');
    return themeJson;
  }
}
