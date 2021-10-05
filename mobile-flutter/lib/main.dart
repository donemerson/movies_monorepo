import 'package:movies_flix/app/data/data.dart';
import 'package:movies_flix/app/domain/entities/entities.dart';
import 'package:movies_flix/app/factories/network_cache/network_cache.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../app/ui/ui.dart';
import '../app/factories/factories.dart';
import 'app/infra/navigator/my_navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await R.load();
  mainContext.spy((event) {
    print(event);
  });
  // inicializando banco de dados offline-first
  final db = makeDBAdapter();
  await db.initDB();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeData>(create: (_) => makeAppTheme()),
        Provider<NetworkCacheClient>(create: (_) => makeNetworkCacheClient()),
      ],
      builder: (context, _) => MaterialApp(
        title: 'Movies',
        theme: Provider.of<ThemeData>(context),
        navigatorKey: MyNavigator.navigatorKey,
        routes: {
          '/': (_) => makeAuthPage(),
          '/movies': (_) =>
              makeMoviesPage(Provider.of<NetworkCacheClient>(context)),
          '/movieDetails': (_) => makeMovieDetailsPage(
                Provider.of<NetworkCacheClient>(context),
                ModalRoute.of(_)!.settings.arguments as MovieEntity,
              ),
          '/add_movie': (_) => makeAddMoviePage(
                Provider.of<NetworkCacheClient>(context),
              ),
        },
        initialRoute: '/',
      ),
    );
  }
}
