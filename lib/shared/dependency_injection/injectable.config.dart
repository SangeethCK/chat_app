// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/bloc/auth_bloc.dart' as _i55;
import '../../features/auth/domain/repositores/auth_repositories.dart' as _i28;
import '../../features/auth/domain/service/auth_service.dart' as _i641;
import '../../features/chat/bloc/chat_bloc.dart' as _i605;
import '../../features/chat/domain/repositories/chat_repositories.dart'
    as _i569;
import '../../features/chat/domain/service/chat_service.dart' as _i445;
import '../../features/home/bloc/home_bloc.dart' as _i854;
import '../../features/home/domain/repositories/home_repositories.dart'
    as _i688;
import '../../features/home/domain/service/home_service.dart' as _i755;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i688.HomeRepositories>(() => _i755.HomeService());
    gh.lazySingleton<_i569.ChatRepositories>(() => _i445.ChatService());
    gh.lazySingleton<_i28.AuthRepositories>(() => _i641.AuthService());
    gh.factory<_i605.ChatBloc>(
      () => _i605.ChatBloc(gh<_i569.ChatRepositories>()),
    );
    gh.factory<_i854.HomeBloc>(
      () => _i854.HomeBloc(gh<_i688.HomeRepositories>()),
    );
    gh.factory<_i55.AuthBloc>(() => _i55.AuthBloc(gh<_i28.AuthRepositories>()));
    return this;
  }
}
