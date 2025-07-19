part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ApiFetchStatus? isUser;
  final List<Customer>? userList;
  final List<Customer>? filteredUserList;
  final String searchQuery;
  final bool isSearching;
  const HomeState({
    this.isUser,
    this.userList,
    this.filteredUserList,
    this.searchQuery = '',
    this.isSearching = false,
  });

  List<Customer>? get displayUserList {
    return isSearching && filteredUserList != null
        ? filteredUserList
        : userList;
  }

  HomeState copyWith({
    ApiFetchStatus? isUser,
    List<Customer>? userList,
    List<Customer>? filteredUserList,
    String? searchQuery,
    bool? isSearching,
  }) => HomeState(
    isUser: isUser ?? this.isUser,
    userList: userList ?? this.userList,
    filteredUserList: filteredUserList ?? this.filteredUserList,
    searchQuery: searchQuery ?? this.searchQuery,
    isSearching: isSearching ?? this.isSearching,
  );
  @override
  List<Object?> get props => [
    isUser,
    userList,
    searchQuery,
    isSearching,
    filteredUserList,
  ];
}

class InitialHomeState extends HomeState {}
