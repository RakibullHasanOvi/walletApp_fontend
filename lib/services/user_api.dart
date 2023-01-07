import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wallet_ui/services/notification_api_marged.dart';

import '../models/json_serialize/user_model.dart';

const storage = FlutterSecureStorage();

///! doing user model provider within this file
class UserProvider extends ChangeNotifier {
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
    print(_useR != null ? 'user gotted' : 'no user found');
    useR = _useR ?? useR;
    notifyListeners();
  }
}
