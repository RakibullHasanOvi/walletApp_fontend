import 'dart:convert';
import 'dart:io';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_ui/models/json_serialize/user_model.dart';

const storage = FlutterSecureStorage();

const String mobileBankingURL = 'http://zune360.com/request/mobilebanking/';
const String bankingURL = 'http://zune360.com/request/banking/';
const String mobileRechargeURL = 'http://zune360.com/request/mobilercharge/';
const String giftCardUrl = 'http://zune360.com/request/gift/';

// future: getmethod('http://zune360.com/request/mobilebanking/'),
Future<List<dynamic>> notificationAPI() async {
  List<dynamic> _margedList = <dynamic>[];

  ///* Global Variable
  var hometoken = await storage.read(key: 'token');

  ///* All request at once
  ///! mobile banking api
  final responseFromMobileBanking = await http.get(
    Uri.parse(mobileBankingURL),
    headers: {
      HttpHeaders.authorizationHeader: 'token $hometoken',
    },
  );

  ///! banking api
  final responseFromBank = await http.get(
    Uri.parse(bankingURL),
    headers: {
      HttpHeaders.authorizationHeader: 'token $hometoken',
    },
  );

  ///! recharge api
  final responseFromRecharge = await http.get(
    Uri.parse(mobileRechargeURL),
    headers: {
      HttpHeaders.authorizationHeader: 'token $hometoken',
    },
  );

  ///! giftCard api
  final responseFromGiftCard = await http.get(
    Uri.parse(giftCardUrl),
    headers: {
      HttpHeaders.authorizationHeader: 'token $hometoken',
    },
  );

  ///* decode all response

  ///! mobile banking decode to JSON
  dynamic mobileBankingJson =
      jsonDecode(responseFromMobileBanking.body.toString());

  ///! banking Json
  dynamic bankingJson = jsonDecode(responseFromBank.body.toString());

  ///! recharge json
  dynamic rechargeJson = jsonDecode(responseFromRecharge.body.toString());

  ///! giftCard json
  dynamic giftCardJson = jsonDecode(responseFromGiftCard.body.toString());

  ///? add the response

  _margedList.addAll(mobileBankingJson);
  _margedList.addAll(bankingJson);
  _margedList.addAll(rechargeJson);
  _margedList.addAll(giftCardJson);
  // api = jsonDecode(responce.body.toString());
  // if (mobileBankingJson != null && bankingJson!=null && rechargeJson!=null) {

  // }
  // return _margedList;
  _margedList.sort((a, b) {
    DateTime _aCreatedAt = DateTime.parse(a['created_at']);
    DateTime _bCreatedAt = DateTime.parse(b['created_at']);
    return _aCreatedAt.compareTo(_bCreatedAt);
  });
  return _margedList;
}

Future<UserModel?> profileApi(String token) async {
  const String _url = 'http://zune360.com/api/user/';
  final Uri url = Uri.parse(_url);
  // print(url);

  final http.Response response = await http.get(
    url,
    headers: <String, String>{
      'Authorization': 'Token $token', // token
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> _response = jsonDecode(response.body) as List<dynamic>;
    print('response 200 0-> $_response');
    final UserModel _profile = UserModel.fromJson(_response[0]);
    print('this is user model -> $_profile');
    return _profile;
  } else {
    print('anotehr response code');
    return null;
  }
}
