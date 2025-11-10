import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/bloc/saved_jobs_bloc/saved_jobs_bloc.dart';
import 'package:job_finder/bloc/saved_jobs_bloc/saved_jobs_event.dart';
import 'package:job_finder/database/database_helper.dart';
import 'package:job_finder/log_in_page.dart';
import 'package:job_finder/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
         
        ),
        BlocProvider(create: (context)=>SavedJobsBloc(DatabaseHelper.instance)..add(LoadSavedJobs()))
      ],
       child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: LogInPage(),
    );
  }
}
