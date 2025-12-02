import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_finder/bloc/saved_jobs_bloc/saved_jobs_bloc.dart';
import 'package:job_finder/bloc/saved_jobs_bloc/saved_jobs_event.dart';
import 'package:job_finder/cubit/language_cubit.dart';
import 'package:job_finder/database/database_helper.dart';
import 'package:job_finder/l10n/app_localizations.dart';
import 'package:job_finder/log_in_page.dart';
import 'package:job_finder/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        BlocProvider(
          create: (context) =>
              SavedJobsBloc(DatabaseHelper.instance)..add(LoadSavedJobs()),
        ),
        BlocProvider(create: (context) => LanguageCubit()),
       ],
      // child: DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => MyApp(),
      // ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return BlocBuilder<LanguageCubit, String>(
      builder: (context, selectedLang) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeProvider.isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            locale: Locale(selectedLang),
            supportedLocales: [Locale("tr"), Locale("en"), Locale("ru")],
            home: LogInPage(),
          ),
        );
      },
    );
  }
}
