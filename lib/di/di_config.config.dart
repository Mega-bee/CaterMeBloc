// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/auth_module.dart' as _i20;
import '../auth/repository/log_in_repository.dart' as _i10;
import '../auth/state_manager/log_in.dart' as _i16;
import '../auth/state_manager/otp_state.dart' as _i11;
import '../auth/state_manager/sign_up.dart' as _i13;
import '../auth/ui/screens/log_in_list.dart' as _i17;
import '../auth/ui/screens/otp_screen.dart' as _i12;
import '../auth/ui/screens/sign_up_list.dart' as _i14;
import '../hive/hive.dart' as _i3;
import '../home_page/homepage_module.dart' as _i19;
import '../home_page/repository/homepage_repository.dart' as _i9;
import '../home_page/state_manager/homepage.dart' as _i15;
import '../home_page/ui/screens/home_page_list.dart' as _i18;
import '../main.dart' as _i21;
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
  gh.factory<_i3.OrderHomePage>(() => _i3.OrderHomePage());
  gh.factory<_i7.ApiClient>(() => _i7.ApiClient(get<_i6.Logger>()));
  gh.factory<_i8.AuthRepository>(() => _i8.AuthRepository(
        get<_i7.ApiClient>(),
        get<_i4.AuthService>(),
      ));
  gh.factory<_i9.HomePageRepository>(() => _i9.HomePageRepository(
        get<_i7.ApiClient>(),
        get<_i4.AuthService>(),
      ));
  gh.factory<_i10.LogInRepository>(() => _i10.LogInRepository(
        get<_i7.ApiClient>(),
        get<_i4.AuthService>(),
      ));
  gh.factory<_i11.OtpCubit>(() => _i11.OtpCubit(
        get<_i10.LogInRepository>(),
        get<_i4.AuthService>(),
      ));
  gh.factory<_i12.PinCodeVerificationScreen>(
      () => _i12.PinCodeVerificationScreen(get<_i11.OtpCubit>()));
  gh.factory<_i13.SignUpCubit>(
      () => _i13.SignUpCubit(get<_i10.LogInRepository>()));
  gh.factory<_i14.SignupScreen>(
      () => _i14.SignupScreen(cubit: get<_i13.SignUpCubit>()));
  gh.factory<_i15.HomePageCubit>(
      () => _i15.HomePageCubit(get<_i9.HomePageRepository>()));
  gh.factory<_i16.LogInCubit>(() => _i16.LogInCubit(
        get<_i10.LogInRepository>(),
        get<_i4.AuthService>(),
      ));
  gh.factory<_i17.loginScreen>(
      () => _i17.loginScreen(cubit: get<_i16.LogInCubit>()));
  gh.factory<_i18.HomePage>(() => _i18.HomePage(get<_i15.HomePageCubit>()));
  gh.factory<_i19.HomePageModule>(
      () => _i19.HomePageModule(get<_i18.HomePage>()));
  gh.factory<_i20.LogInModule>(() => _i20.LogInModule(
        get<_i17.loginScreen>(),
        get<_i14.SignupScreen>(),
        get<_i12.PinCodeVerificationScreen>(),
      ));
  gh.factory<_i21.MyApp>(() => _i21.MyApp(
        get<_i19.HomePageModule>(),
        get<_i20.LogInModule>(),
      ));
  return get;
}
