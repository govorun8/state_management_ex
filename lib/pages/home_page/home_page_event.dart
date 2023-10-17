part of 'home_page_bloc.dart';

sealed class HomePageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomePageOpened extends HomePageEvent {
  final List<String> studentNames;
  HomePageOpened({
    required this.studentNames,
  });
}

class ChangeName extends HomePageEvent {
  ChangeName();
}

class SetMyName extends HomePageEvent {
  final String name;
  SetMyName({
    required this.name,
  });
}
