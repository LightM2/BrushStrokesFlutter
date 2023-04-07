import 'package:brush_strokes/features/cart/bloc/cart_bloc.dart';
import 'package:brush_strokes/features/root/bloc/navigation_cubit.dart';
import 'package:brush_strokes/features/root/ui/root_screen.dart';
import 'package:brush_strokes/repositories/cart_repository.dart';
import 'package:brush_strokes/theme/colors.dart';
import 'package:brush_strokes/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(RepositoryProvider(
    create: (context) => CartRepository(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(
          create: (context) => CartBloc(
            RepositoryProvider.of<CartRepository>(context),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Brush strokes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: textTheme,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          textTheme: textTheme,
        ),
        home: const RootScreen(),
      ),
    );
  }
}
