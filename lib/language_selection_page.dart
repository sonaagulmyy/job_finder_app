// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/app_fonts.dart';
import 'package:job_finder/cubit/language_cubit.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change language",
          style: TextStyle(
            fontFamily: AppFonts.primaryFont,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<LanguageCubit, String>(
        builder: (context, selectedLang) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 40,
                      width: 40,
                      child: Image.asset("lib/assets/images/tkm_flag.png"),
                    ),
                    title: Text('TKM'),
                    trailing: Checkbox(
                      value: selectedLang == 'tr',
                      onChanged: (_) {
                        setState(() {
                          context.read<LanguageCubit>().setLanguage('tr');
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 40,
                      width: 40,
                      child: Image.asset("lib/assets/images/usa_flag.png"),
                    ),
                    title: Text('EN'),
                    trailing: Checkbox(
                      value: selectedLang == 'en',
                      onChanged: (_) {
                        setState(() {
                          context.read<LanguageCubit>().setLanguage('en');
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 40,
                      width: 40,
                      child: Image.asset("lib/assets/images/rus_flag.png"),
                    ),
                    title: Text('RU'),
                    trailing: Checkbox(
                      value: selectedLang == 'ru',
                      onChanged: (_) {
                        setState(() {
                          context.read<LanguageCubit>().setLanguage('ru');
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
