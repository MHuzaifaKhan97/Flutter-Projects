import 'package:dynamic_theme_cubit/core/constants/app_constants.dart';
import 'package:dynamic_theme_cubit/core/router/app_router.dart';
import 'package:dynamic_theme_cubit/core/theme/dark_theme.dart';
import 'package:dynamic_theme_cubit/core/theme/light_theme.dart';
import 'package:dynamic_theme_cubit/data/logic/debug/app_bloc_observer.dart';
import 'package:dynamic_theme_cubit/data/logic/theme/theme_cubit.dart';
import 'package:dynamic_theme_cubit/data/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view/places_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  Bloc.observer = AppBlocObserver();

  runApp(MultiBlocProvider(
    providers: [BlocProvider(create: (context) => getIt<ThemeCubit>())],
    child: const RootApp(),
  ));
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      buildWhen: (previous, current) => previous != current,
      builder: (_, state) {
        return MaterialApp(
          title: AppConstants.appTitle,
          debugShowCheckedModeBanner: false,
          theme: lightAppTheme,
          darkTheme: darkAppTheme,
          themeMode: state,
          initialRoute: PlacesScreen.routeName,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
    );
  }
}
