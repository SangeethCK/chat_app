import 'package:bloc/bloc.dart';
import 'package:chat_app/features/home/domain/models/customer/customer.dart';
import 'package:chat_app/features/home/domain/repositories/home_repositories.dart';
import 'package:chat_app/shared/app/enums/api_fetch_status.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepositories _homeRepositories;
  HomeBloc(this._homeRepositories) : super(InitialHomeState()) {
    on<UserEvent>(_user);
    on<SearchUsersEvent>(_searchUsers);
  }
  //=-=-=-=-=-= USERS =-=-=-=-=
  Future<void> _user(UserEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isUser: ApiFetchStatus.loading));
    final res = await _homeRepositories.getUser();
    if (res.data != null) {
      emit(state.copyWith(isUser: ApiFetchStatus.success, userList: res.data));
    }
    emit(state.copyWith(isUser: ApiFetchStatus.failed));
  }
  //=-=-=-=-=-= SEARCH =-=-=-=-=

  Future<void> _searchUsers(
    SearchUsersEvent event,
    Emitter<HomeState> emit,
  ) async {
    final query = event.query?.toLowerCase().trim();

    if (query?.isEmpty ?? true) {
      emit(
        state.copyWith(
          filteredUserList: null,
          searchQuery: '',
          isSearching: false,
        ),
      );
      return;
    }

    if (state.userList == null || state.userList!.isEmpty) {
      return;
    }
    final filteredUsers = state.userList!.where((user) {
      final userName = user.name?.toLowerCase() ?? '';
      final userEmail = user.email?.toLowerCase() ?? '';
      final userPhone = user.phone?.toLowerCase() ?? '';

      return userName.contains(query ?? '') ||
          userEmail.contains(query ?? '') ||
          userPhone.contains(query ?? '');
    }).toList();

    emit(
      state.copyWith(
        filteredUserList: filteredUsers,
        searchQuery: query,
        isSearching: true,
      ),
    );
  }
}
