import 'package:bloc/bloc.dart';

class LanguageCubit  extends Cubit<String>{
  LanguageCubit():super("tr");

  void setLanguage(String langCode){
    emit(langCode);
  }

}