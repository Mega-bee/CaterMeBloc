// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../hive/hive.dart' as _i3;
import '../home_page/homepage_module.dart' as _i12;
import '../home_page/repository/homepage_repository.dart' as _i9;
import '../home_page/state_manager/homepage.dart' as _i10;
import '../home_page/ui/screens/home_page_list.dart' as _i11;
import '../main.dart' as _i13;
import '../module_auth/repository/auth_repository.dart' as _i8;
import '../module_auth/service/auth_service.dart' as _i4;
import '../module_network/http_client/http_client.dart' as _i7;
import '../utils/global/global_state_manager.dart' as _i5;
import '../utils/logger/logger.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.factory<_i4.AuthService>(
      () => _i4.AuthService(get<_i3.AuthPrefsHelper>()));
  gh.singleton<_i5.GlobalStateManager>(_i5.GlobalStateManager());
  gh.factory<_i4.ImeiService>(() => _i4.ImeiService());
  gh.factory<_i6.Logger>(() => _i6.Logger());
  gh.factory<_i7.ApiClient>(() => _i7.ApiClient(get<_i6.Logger>()));
  gh.factory<_i8.AuthRepository>(() => _i8.AuthRepository(
        get<_i7.ApiClient>(),
        get<_i4.AuthService>(),
      ));
  gh.factory<_i9.HomePageRepository>(() => _i9.HomePageRepository(
        get<_i7.ApiClient>(),
        get<_i4.AuthService>(),
      ));
  gh.factory<_i10.HomePageCubit>(
      () => _i10.HomePageCubit(get<_i9.HomePageRepository>()));
  gh.factory<_i11.HomePage>(() => _i11.HomePage(
        get<_i10.HomePageCubit>(),
        get<_i3.AuthPrefsHelper>(),
      ));
  gh.factory<_i12.HomePageModule>(
      () => _i12.HomePageModule(get<_i11.HomePage>()));
  gh.factory<_i13.MyApp>(() => _i13.MyApp(get<_i12.HomePageModule>()));
  return get;
}
