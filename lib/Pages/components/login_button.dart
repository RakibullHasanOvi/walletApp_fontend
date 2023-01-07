import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:wallet_ui/Pages/buttom_navigation.dart';
import 'package:wallet_ui/models/json_serialize/user_model.dart';
import 'package:wallet_ui/services/user_api.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    Key? key,
    required this.password,
    required this.phoneNumber,
  }) : super(key: key);

  final String phoneNumber;
  final String password;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  final storage = const FlutterSecureStorage();

  bool _isLoading = false;
  //! this is login func
  Future<void> login(
    String number,
    String password,
  ) async {
    Map<String, String> data = {
      "username": number,
      "password": password,
    };
    var jsonData;
    var response =
        await http.post(Uri.parse('http://zune360.com/api/user/login/'),
            headers: {
              // HttpHeaders.authorizationHeader: 'token',
            },
            body: data);

    // end of loding..

    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      var _token = jsonData["token"];
      Provider.of<UserProvider>(context, listen: false)
          .addUser(_token.toString());
      //local stroge save the token..
      await storage.write(
        key: 'token',
        value: jsonData['token'],
      );
      // getUserData().then((value) async {
      //   await storage.write(key: 'usermodel', value: value);
      // });

      setState(
        () {
          _isLoading = false;
          // print('Login Successfully $_token');
          Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const BottomNavigation(),
                transitionDuration: const Duration(seconds: 0),
                transitionsBuilder: (_, a, __, c) =>
                    FadeTransition(opacity: a, child: c),
              ),
              (route) => false);
        },
      );
      // return 1;
    } else {
      setState(() {
        _isLoading = false;
      });
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            backgroundColor: Colors.red[100],
            content: Row(
              children: [
                const Icon(
                  Icons.warning_rounded,
                  color: Colors.red,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 200,
                  child: const Text(
                    'Something went worng,Please check your number or password.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      );

      print('Feild, try again');
      print(" ${response.body}");
      // return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width / 1, 50),
        backgroundColor: const Color(0xFFD6001B),
      ),
      //
      //
      //

      onPressed: () async {
        setState(() {
          _isLoading = true;
        });
        login(
          widget.phoneNumber,
          widget.password,
        );
      },
      //
      //
      //
      child: _isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  'Please Wait..',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          : const Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
    );
  }
}


         


// Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => BottomNavigation(),
//                                 ),
//                               );
//                               Navigator.pushAndRemoveUntil(
//                                   context,
//                                   PageRouteBuilder(
//                                     pageBuilder: (_, __, ___) =>
//                                         const BottomNavigation(),
//                               transitionDuration:
//                                   const Duration(seconds: 0),
//                               transitionsBuilder: (_, a, __, c) =>
//                                   FadeTransition(
//                                       opacity: a, child: c),
//                                   ),
//                                   (route) => false);
