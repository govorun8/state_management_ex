import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    // on((event, emit) async {
    //   if (event is HomePageOpened) {
    //     homePageOpened(event, emit);
    //   } else if (event is ChangeName) {
    //     changeName(event, emit);
    //   } else if (event is SetMyName) {
    //     setMyName(event, emit);
    //   }
    // });

    on<HomePageOpened>(homePageOpened);
    on<ChangeName>(changeName);
    on<SetMyName>(setMyName);
  }

  late final List<String> studentsNames;

  void homePageOpened(HomePageOpened event, Emitter<HomePageState> emit) {
    studentsNames = event.studentNames;
  }

  void changeName(ChangeName event, Emitter<HomePageState> emit) {
    int indexOfCurrentStudent = studentsNames.indexOf(state.name);
    if (indexOfCurrentStudent < (studentsNames.length - 1)) {
      emit(state.copyWith(
        name: studentsNames[indexOfCurrentStudent + 1],
      ));
    } else {
      emit(state.copyWith(name: studentsNames[0]));
    }
  }

  void setMyName(SetMyName event, Emitter<HomePageState> emit) {
    emit(state.copyWith(name: event.name));
  }
}
