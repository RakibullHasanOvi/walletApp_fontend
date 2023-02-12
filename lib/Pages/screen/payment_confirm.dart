// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:wallet_ui/Pages/home_page.dart';
// import 'package:wallet_ui/Pages/screen/notificatio_page.dart';
// import 'package:wallet_ui/Pages/welcome_page.dart';
// import 'package:wallet_ui/models/pages/mbdatailes.dart';

// class PaymentConfirm extends StatefulWidget {
//   const PaymentConfirm({Key? key}) : super(key: key);
//   // final MobileBanking _itemsList;
//   // PaymentConfirm(this._itemsList);

//   @override
//   State<PaymentConfirm> createState() => _PaymentConfirmState();
// }

// class _PaymentConfirmState extends State<PaymentConfirm> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xFFF4F8FB).withOpacity(1),
//         // backgroundColor: Color(0xFF).withOpacity(),
//         // backgroundColor: Colors.blue[50].withOpacity(col),
//         appBar: AppBar(
//           elevation: 2,
//           backgroundColor: Colors.white,
//           leadingWidth: 200,
//           leading: Container(
//             margin: EdgeInsets.only(left: 10),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => WelcomePage(),
//                   ),
//                 );
//               },
//               child: Image.asset('assets/Group 255.png'),
//             ),
//           ),
//           // title: Container(
//           //   alignment: Alignment.centerLeft,
//           //   child: GestureDetector(
//           //     onTap: () {
//           //       Navigator.push(
//           //         context,
//           //         MaterialPageRoute(builder: (context) => WelcomePage()),
//           //       );
//           //     },
//           //     child: Image.asset('assets/Group 255.png'),
//           //   ),
//           // ),
//           actions: [
//             Container(
//               padding: EdgeInsets.only(
//                 right: 18,
//               ),
//               child: IconButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return NotificationPage();
//                       },
//                     ),
//                   );
//                 },
//                 icon: Image.asset(
//                   'assets/Group 38.png',
//                   height: 22,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         body: Container(
//           margin: EdgeInsets.only(top: 50),
//           child: Center(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SvgPicture.asset('assets/tk.svg'),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           '10,00,000 BDT',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           'Current balance',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.only(
//                       top: 50,
//                     ),
//                     height: MediaQuery.of(context).size.width,
//                     width: MediaQuery.of(context).size.width,
//                     // color: Colors.red[700],
//                     decoration: BoxDecoration(
//                       color: Color(0xFFD6001B),
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(50),
//                         topRight: Radius.circular(50),
//                       ),
//                     ),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(
//                             top: 100,
//                           ),
//                           child: Image.asset(
//                             'assets/Right_logo.png',
//                             height: 80,
//                             width: 80,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           child: Text(
//                             'Payment',
//                             style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         SizedBox(),
//                         Container(
//                           child: Text(
//                             "Successful!",
//                             style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           child: Text(
//                             'Click the button bellow to continue',
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.normal,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 140,
//                         ),
//                         Container(
//                           // margin: EdgeInsets.only(
//                           //   top: 0,
//                           // ),
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 PageRouteBuilder(
//                                   pageBuilder: (_, __, ___) => HomePage(),
//                                   transitionDuration: Duration(seconds: 0),
//                                   transitionsBuilder: (_, a, __, g) =>
//                                       FadeTransition(opacity: a, child: g),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               'Continue',
//                               style: TextStyle(
//                                 fontSize: 19,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               minimumSize: Size(300, 50),
//                               primary: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:wallet_ui/services/user_api.dart';
// import 'package:wallets_app/Pages/HomePage.dart';
// import 'package:wallets_app/Pages/Screen/buttom_navigation.dart';
// import 'package:wallets_app/Pages/Screen/notification.dart';
// import 'package:wallets_app/Pages/WelcomePage.dart';

import '../../models/services/mobile_banking_service.dart';
import '../buttom_navigation.dart';
import '../welcome_page.dart';
import 'Notification/notificatio_page.dart';

class PaymentConfirm extends StatefulWidget {
  const PaymentConfirm({Key? key}) : super(key: key);

  @override
  State<PaymentConfirm> createState() => _PaymentConfirmState();
}

class _PaymentConfirmState extends State<PaymentConfirm> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F8FB),
        // backgroundColor: Colors.blue[50],
        // backgroundColor: Colors.blue[50].withOpacity(col),
        appBar: AppBar(
          elevation: 0.3,
          backgroundColor: Colors.white,
          leadingWidth: 200,
          leading: Container(
            margin: EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePage(),
                  ),
                );
              },
              child: SvgPicture.asset(
                "assets/wallet_logo.svg",
                // color: Colors.red,
              ),
              // child: Image.asset('assets/Group 255.png'),
            ),
          ),
          // title: Container(
          //   alignment: Alignment.centerLeft,
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => WelcomePage()),
          //       );
          //     },
          //     child: Image.asset('assets/Group 255.png'),
          //   ),
          // ),
          actions: [
            Container(
              padding: const EdgeInsets.only(
                right: 4,
              ),
              child: IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return NotificationPage();
                  //     },
                  //   ),
                  // );
                },
                icon: SvgPicture.asset(
                  'assets/notifications.svg',
                  height: 22,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/tk.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            FutureBuilder(
                              future: getBalance(
                                  "http://zune360.com/api/user/current_balance/"),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .userAmmount = snapshot.data.toString();
                                  
                                  return Text(
                                    '৳ ' + snapshot.data.toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                                return const Text('');
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Current balance',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //
            //
            //1st container use white color and also using opacity....
            Container(
              height: height,
              width: width,
              color: Colors.white.withOpacity(0.8),
            ),
            //
            //
            //2nd container use Red color and text , icon , button etc..
            Container(
              height: height,
              width: width,
              // color: Color(0xFFD6001B),
              transform: Matrix4.translationValues(0, 150, 0),
              decoration: BoxDecoration(
                color: Color(0xFFD6001B),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 100,
                    ),
                    child: Image.asset(
                      'assets/Right_logo.png',
                      height: 80,
                      width: 80,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Text(
                      'Payment',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(),
                  Container(
                    child: Text(
                      "Successful!",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      'Click the button bellow to continue',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: height / 6),
                  Container(
                    // margin: EdgeInsets.only(
                    //   top: 0,
                    // ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => BottomNavigation(),
                            transitionDuration: Duration(seconds: 0),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(width / 1.3, 50),
                        primary: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
