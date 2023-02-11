import 'dart:convert';
import 'dart:io';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:wallet_ui/models/json_serialize/user_model.dart';
import 'package:wallet_ui/services/user_api.dart';

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

/// notification stream
Stream<int> getNotificationCount(BuildContext context) {
  return Stream.periodic(const Duration(seconds: 10), (count)
      // call the notificaitn api
      //     notificationAPI().then(
      //   (List<dynamic> value) {
      //     // get the last item
      //     String _lastItem =
      //         Provider.of<UserProvider>(context, listen: false).lastItem;
      //     // check where the last item is equal to the last item in the list
      //     int _notification = 0;
      //     for (var i = 0; i < value.length; i++) {
      //       if (value[i]['updated_at'] == _lastItem) {
      //         break;
      //       } else {
      //         _notification++;
      //       }
      //     }
      //     return _notification;
      //   },
      // ).onError((error, stackTrace) => 0),
      {
    // call the notificaitn api
    notificationAPI().then(
      (List<dynamic> value) {
        // get the last item
        String _lastItem =
            Provider.of<UserProvider>(context, listen: false).lastItem;
        // check where the last item is equal to the last item in the list
        int _notification = 0;
        for (var i = 0; i < value.length; i++) {
          if (value[i]['updated_at'] == _lastItem) {
            print('last item is equal to the last item in the list');
            break;
          } else {
            print(
                'this is item updated date -> ${value[i]['updated_at']} && $_lastItem');
            _notification++;
            print(
                'last item is not equal to the last item in the list -> $_notification');
          }
        }
        return _notification;
      },
    ).onError((error, stackTrace) => 0);

    return 0;
  });
}
