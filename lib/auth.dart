import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences ? prefs;

Future<SharedPreferences> initilize() async{
  return SharedPreferences.getInstance();
}

// final myBool = prefs!.getBool('login') ?? false;





// bool authentication=false;