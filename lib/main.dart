import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_new/core/dio_client.dart';
import 'package:hive_new/data/local/hive_service.dart';
import 'package:hive_new/data/network/api_service.dart';
import 'package:hive_new/data/repository/home_repository.dart';
import 'package:hive_new/presentation/bloc/home_bloc.dart';
import 'package:hive_new/presentation/bloc/home_event.dart';
import 'package:hive_new/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  final homeBox = await Hive.openBox('home');

  final hiveService = HiveService(homeBox);

  final dio = DioClient.create();
  final apiService = ApiService(dio);

  final homeRepository = HomeRepository(
    apiService: apiService,
    hiveService: hiveService,
  );

  runApp(
    BlocProvider(
      create: (context) => HomeBloc(homeRepository)..add(FetchHomeEvent()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}
