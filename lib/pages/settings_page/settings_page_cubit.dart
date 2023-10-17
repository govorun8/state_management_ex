import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_page_state.dart';

class SettingsPageCubit extends Cubit<SettingsPageState> {
  SettingsPageCubit() : super(SettingsPageInitial());
}
