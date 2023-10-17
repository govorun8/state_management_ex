part of 'home_page_bloc.dart';

final class HomePageState extends Equatable {
  const HomePageState({this.name = 'Имени нет'});

  final String name;

  HomePageState copyWith({
    String? name,
  }) {
    return HomePageState(
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [name];
}
