import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectedRegionProvider extends ChangeNotifier {
  String selectedRegion = 'Ashgabat';

  String get selected => selectedRegion;

  SelectedRegionProvider() {
    _loadRegion();
  }

  Future<void> _loadRegion() async {
    final prefs = await SharedPreferences.getInstance();
    selectedRegion = prefs.getString('selected') ?? 'Ashgabat';
    notifyListeners();
  }

  Future<void> setRegion(String region) async {
    selectedRegion = region;
    notifyListeners();

     final prefs=await SharedPreferences.getInstance();
     await prefs.setString('selected', region);
  }

 
}
