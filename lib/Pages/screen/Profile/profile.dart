// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallet_ui/Pages/login_page.dart';
import 'package:wallet_ui/Pages/screen/Profile/add_fund.dart';
import 'package:wallet_ui/Pages/screen/Profile/change_pin.dart';
import 'package:wallet_ui/Pages/screen/Notification/notificatio_page.dart';
import 'package:wallet_ui/Pages/screen/Profile/offer_page.dart';
import 'package:wallet_ui/Pages/screen/Profile/support_screen.dart';
import 'package:wallet_ui/Pages/welcome_page.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_ui/models/json_serialize/user_model.dart';
import 'package:wallet_ui/services/user_api.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Locale Stroge..

    const storage = FlutterSecureStorage();

    //

    final _height = MediaQuery.of(context).size.height;

    final _widht = MediaQuery.of(context).size.width;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F8FB),
// This is AppBar
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 150,
          leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => WelcomePage()),
                // );
              },
              child: SvgPicture.asset('assets/wallet_logo.svg'),
            ),
          ),

          //This is Notification Icon

          actions: [
            Container(
              padding: const EdgeInsets.only(
                right: 4,
              ),
              child: IconButton(
                iconSize: 10,
                icon: SvgPicture.asset(
                  'assets/notifications.svg',
                  height: 22,
                ),
                onPressed: () {
                  // sending to notification page using (PageRouteBuilder)

                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const NotificationPage(),
                      transitionDuration: const Duration(seconds: 0),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 90,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    // spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                    ),
                    child: Text(
                      '${Provider.of<UserProvider>(context, listen: false).useR.first_name ?? " "} ${Provider.of<UserProvider>(context, listen: false).useR.last_name}',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                    ),
                    child: const Text(
                      'Customer ID',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      context
                          .read<UserProvider>()
                          .useR
                          .client_identity_id
                          .toString(),
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 18.r, right: 18.r, top: 20.r),
              height: MediaQuery.of(context).size.height * 0.54.h,
              width: MediaQuery.of(context).size.width.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F8FB),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    // spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
                // border: Border(
                //   bottom: BorderSide(
                //     width: 1.0,
                //     color: Colors.grey,
                //   ),
                // ),
              ),
              child: Column(
                children: [
                  //Offer..

                  GestureDetector(
                    onTap: () {
                      print('Clicked offer');
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) =>
                              const OfferPageDetailes(),
                          transitionDuration: const Duration(
                            milliseconds: 300,
                          ),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20.sm,
                        left: 20.sm,
                        right: 20.sm,
                      ),
                      height: 60.h,
                      width: 350.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            // spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 20.r,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                // Image.asset("assets/singout_logo.png"),
                                Icon(
                                  Icons.local_offer,
                                  color: Color(0xFFD6001B),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Offer',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Add found.............
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('okay');
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const AddFund(),
                          transitionDuration: const Duration(
                            milliseconds: 300,
                          ),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            // spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(
                                  Icons.addchart_outlined,
                                  color: Color(0xFFD6001B),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Add Fund',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Change pin..........

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const ChangePinPage(),
                          transitionDuration: const Duration(milliseconds: 300),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            // spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.change_circle_rounded,
                                  color: Color(0xFFD6001B),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Chnage Pin',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //Terms ans Conditions..........

                  GestureDetector(
                    onTap: () {
                      var _uri = Uri.parse("https://www.takapakhi.com/toc");
                      launchUrl(
                        _uri,
                        mode: LaunchMode.externalNonBrowserApplication,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            // spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.contact_support_rounded,
                                  color: Color(0xFFD6001B),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Terms and Conditions',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //Support...............

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const SupportScreen(),
                          transitionDuration: const Duration(milliseconds: 300),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            // spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/support_logo.png"),
                                // const Icon(
                                //   Icons.support_agent_outlined,
                                //   color: Color(0xFFD6001B),
                                // ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Support',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Sing Out.........

                  GestureDetector(
                    onTap: () async {
                      var _token = await storage.read(key: "token");
                      print(_token);
                      var response = await http.post(
                          Uri.parse('http://zune360.com/api/user/logout/'),
                          headers: {
                            HttpHeaders.authorizationHeader: 'token ${_token}',
                          });
                      print(response.statusCode);

                      if (response.statusCode == 200) {
                        print('Logout done.');
                        await storage.delete(key: "token");
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const LoginPage(),
                            ),
                            (route) => false);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            // spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/singout_logo.png"),
                                // const Icon(
                                //   Icons.contact_support_rounded,
                                //   color: Color(0xFFD6001B),
                                // ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Signout',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //
                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Offer..

                  // Container(
                  //   height: 60,
                  //   width: 350,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.grey.withOpacity(0.3),
                  //         // spreadRadius: 5,
                  //         blurRadius: 5,
                  //         offset: const Offset(0, 2), // changes position of shadow
                  //       ),
                  //     ],
                  //     color: Colors.white,
                  //   ),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Container(
                  //         margin: const EdgeInsets.only(
                  //           left: 20,
                  //         ),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           children: [
                  //             // Image.asset("assets/singout_logo.png"),
                  //             Icon(
                  //               Icons.local_offer,
                  //               color: Color(0xFFD6001B),
                  //             ),
                  //             const SizedBox(
                  //               width: 10,
                  //             ),
                  //             InkWell(
                  //               onTap: () {},
                  //               child: const Text(
                  //                 'Offer',
                  //                 style: TextStyle(
                  //                   fontSize: 16,
                  //                   color: Colors.grey,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // // Add found.............
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     print('okay');
                  //     Navigator.push(
                  //       context,
                  //       PageRouteBuilder(
                  //         pageBuilder: (_, __, ___) => AddFund(),
                  //         transitionDuration: const Duration(
                  //           milliseconds: 300,
                  //         ),
                  //         transitionsBuilder: (_, a, __, c) =>
                  //             FadeTransition(opacity: a, child: c),
                  //       ),
                  //     );
                  //   },
                  //   child: Container(
                  //     height: 60,
                  //     width: 350,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.3),
                  //           // spreadRadius: 5,
                  //           blurRadius: 5,
                  //           offset:
                  //               const Offset(0, 2), // changes position of shadow
                  //         ),
                  //       ],
                  //       color: Colors.white,
                  //     ),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           margin: EdgeInsets.only(
                  //             left: 20,
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: const [
                  //               Icon(
                  //                 Icons.addchart_outlined,
                  //                 color: Color(0xFFD6001B),
                  //               ),
                  //               SizedBox(
                  //                 width: 10,
                  //               ),
                  //               Text(
                  //                 'Add Fund',
                  //                 style: TextStyle(
                  //                   fontSize: 16,
                  //                   color: Colors.grey,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),

                  // // Change pin..........

                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       PageRouteBuilder(
                  //         pageBuilder: (_, __, ___) => const ChangePinPage(),
                  //         transitionDuration: const Duration(milliseconds: 300),
                  //         transitionsBuilder: (_, a, __, c) =>
                  //             FadeTransition(opacity: a, child: c),
                  //       ),
                  //     );
                  //   },
                  //   child: Container(
                  //     height: 60,
                  //     width: 350,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.3),
                  //           // spreadRadius: 5,
                  //           blurRadius: 5,
                  //           offset:
                  //               const Offset(0, 2), // changes position of shadow
                  //         ),
                  //       ],
                  //       color: Colors.white,
                  //     ),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           margin: const EdgeInsets.only(
                  //             left: 20,
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //               const Icon(
                  //                 Icons.change_circle_rounded,
                  //                 color: Color(0xFFD6001B),
                  //               ),
                  //               const SizedBox(
                  //                 width: 10,
                  //               ),
                  //               const Text(
                  //                 'Chnage Pin',
                  //                 style: TextStyle(
                  //                   fontSize: 16,
                  //                   color: Colors.grey,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),

                  // //Terms ans Conditions..........

                  // Container(
                  //   height: 60,
                  //   width: 350,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.grey.withOpacity(0.3),
                  //         // spreadRadius: 5,
                  //         blurRadius: 5,
                  //         offset: const Offset(0, 2), // changes position of shadow
                  //       ),
                  //     ],
                  //     color: Colors.white,
                  //   ),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Container(
                  //         margin: const EdgeInsets.only(
                  //           left: 20,
                  //         ),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           children: [
                  //             const Icon(
                  //               Icons.contact_support_rounded,
                  //               color: Color(0xFFD6001B),
                  //             ),
                  //             const SizedBox(
                  //               width: 10,
                  //             ),
                  //             InkWell(
                  //               onTap: () {},
                  //               child: const Text(
                  //                 'Terms and Conditions',
                  //                 style: TextStyle(
                  //                   fontSize: 16,
                  //                   color: Colors.grey,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),

                  // //Support...............

                  // Container(
                  //   height: 60,
                  //   width: 350,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.grey.withOpacity(0.3),
                  //         // spreadRadius: 5,
                  //         blurRadius: 5,
                  //         offset: const Offset(0, 2), // changes position of shadow
                  //       ),
                  //     ],
                  //     color: Colors.white,
                  //   ),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Container(
                  //         margin: const EdgeInsets.only(
                  //           left: 20,
                  //         ),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           children: [
                  //             Image.asset("assets/support_logo.png"),
                  //             // const Icon(
                  //             //   Icons.support_agent_outlined,
                  //             //   color: Color(0xFFD6001B),
                  //             // ),
                  //             const SizedBox(
                  //               width: 10,
                  //             ),
                  //             InkWell(
                  //               onTap: () {},
                  //               child: const Text(
                  //                 'Support',
                  //                 style: TextStyle(
                  //                   fontSize: 16,
                  //                   color: Colors.grey,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // const SizedBox(
                  //   height: 20,
                  // ),

                  // // Sing Out.........

                  // Container(
                  //   height: 60,
                  //   width: 350,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.grey.withOpacity(0.3),
                  //         // spreadRadius: 5,
                  //         blurRadius: 5,
                  //         offset: const Offset(0, 2), // changes position of shadow
                  //       ),
                  //     ],
                  //     color: Colors.white,
                  //   ),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Container(
                  //         margin: const EdgeInsets.only(
                  //           left: 20,
                  //         ),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           children: [
                  //             Image.asset("assets/singout_logo.png"),
                  //             // const Icon(
                  //             //   Icons.contact_support_rounded,
                  //             //   color: Color(0xFFD6001B),
                  //             // ),
                  //             const SizedBox(
                  //               width: 10,
                  //             ),
                  //             InkWell(
                  //               onTap: () {},
                  //               child: const Text(
                  //                 'Signout',
                  //                 style: TextStyle(
                  //                   fontSize: 16,
                  //                   color: Colors.grey,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),