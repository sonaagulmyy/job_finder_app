import 'package:bloc/bloc.dart';

class LanguageCubit  extends Cubit<String>{
  LanguageCubit():super("en");

  void setLanguage(String langCode){
    emit(langCode);
  }

}