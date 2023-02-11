import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/services/notification_api_marged.dart';

import '../models/json_serialize/user_model.dart';

const storage = FlutterSecureStorage();

///! doing user model provider within this file
class UserProvider extends ChangeNotifier {
  /// user ammount
  int _userAmmount = 0;
  int get userAmmount => _userAmmount;
  set userAmmount(int value) {
    _userAmmount = value;
    notifyListeners();
  }

  /// last item
  String _lastItem = '';
  String get lastItem => _lastItem;

  /// get the last item from shared preference
  Future<String> getLastItem() async {
    print('get last item called ');
    final prefs = await SharedPreferences.getInstance();
    final lastItem = prefs.getString('lastItem') ?? '';
    print(
        'checking last item $lastItem ${lastItem.isEmpty ? "FUCK Nothing Here" : ""}');
    _lastItem = lastItem;
    print('this is last item -> $_lastItem');

    return lastItem;
  }

  /// set the last item to shared preference
  Future<void> setLastItem(String value) async {
    final prefs = await SharedPreferences.getInstance();
    _lastItem = value;
    print('setting the lat item $value');
    print('this is last item -> $_lastItem');
    prefs.setString('lastItem', value);
  }

  /// set the last item from user
  set lastItem(String value) {
    _lastItem = value;
    setLastItem(value);
    notifyListeners();
  }

  /// Internal, private state of the cart.
  UserModel useR = UserModel(
      id: 0,
      password: "",
      last_login: '',
      isSuperuser: false,
      username: "",
      first_name: "",
      last_name: "",
      email: "",
      is_staff: false,
      is_active: true,
      date_joined: '',
      phone_number: "",
      current_balance: 0,
      user_pin: 0,
      mobile_banking: [""],
      mobile_recharge: [""],
      gift_card: "",
      bank: [""],
      isReseller: false,
      groups: [],
      user_permissions: []);

  //! add user change notify provider
  void addUser(dynamic token) async {
    UserModel? _useR = await profileApi(token);
    useR = _useR ?? useR;
    notifyListeners();
  }
}
