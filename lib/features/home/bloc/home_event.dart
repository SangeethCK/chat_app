part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UserEvent extends HomeEvent {}

class SearchUsersEvent extends HomeEvent {
  final String? query;
  SearchUsersEvent({this.query});
  @override
  List<Object> get props => [query ?? ''];
}
