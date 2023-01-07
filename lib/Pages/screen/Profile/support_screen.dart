import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallet_ui/main.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Using MedeaQurey height/weight

    final _height = MediaQuery.of(context).size.height;

    final _widht = MediaQuery.of(context).size.width;

    //
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F8FB),

        //Start AppBar..

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 200,
          leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const WelcomePage(),
                //   ),
                // );
              },
              child: SvgPicture.asset('assets/wallet_logo.svg'),
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(
                right: 4,
              ),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/notifications.svg',
                  height: 22,
                ),
              ),
            ),
          ],
        ),
        //Close AppBar.....
        body: Column(
          children: [
            Container(
              // alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(
                  left: 18, right: 18, top: 18, bottom: 18),
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
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
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          child: Container(
                            // alignment: Alignment.topLeft,
                            height: 38,
                            width: 38,
                            margin: const EdgeInsets.only(
                              left: 12,
                              top: 12,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: Color(0xFFF4F8FB),
                              color: const Color(0xFFF4F8FB),
                            ),
                            // margin: EdgeInsets.only(
                            //   top: 7,
                            //   left: 7,
                            // ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.arrow_back_ios,
                                // color: Color(0xFFF4F8FB),
                                // size: 35,
                              ),
                            ),
                          ),

                          //Call back for buttomNavigation Page...
                          onTap: () {
                            Navigator.pop(context);
                            // Navigator.pushReplacement(
                            //   context,
                            //   PageRouteBuilder(
                            //     pageBuilder: (_, __, ___) => const BottomNavigation(),
                            //   ),
                            // );
                          },
                        ),
                      ),
                      //
                      //
                      //
                      //
                      // SizedBox(
                      //   width: ,
                      // ),
                      Container(
                        // alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(
                          left: _height * 0.09,
                        ),
                        // alignment: Alignment.topCenter,
                        child: Text(
                          'SUPPORT',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                  //Using Phone number, E-mail address & Contact us WhattsApp..
                  //
                  Container(
                    // alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 5),
                    margin: const EdgeInsets.only(
                      top: 20,
                      left: 18,
                      right: 18,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          // spreadRadius: 5,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    // height: 100,
                    // width: _widht,
                    child: Card(
                      elevation: 0,
                      // color: Colors.yellow,
                      child: Column(
                        children: [
//Adding Phone Number...
                          GestureDetector(
                            onTap: (() {
                              var _uri = Uri.parse('tel:+16468209892');
                              launchUrl(
                                _uri,
                                mode: LaunchMode.externalApplication,
                              );

                              print("Phone");
                            }),
                            // onTap: (() {
                            //   var _uri = Uri.parse('https://wa.me/16468209892');
                            //   launchUrl(
                            //     _uri,
                            //     mode: LaunchMode.externalApplication,
                            //   );
                            //   print('Ok');
                            // }),
                            child: Row(
                              children: [
                                //Using Phone icon..
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 15,
                                    top: 10,
                                    bottom: 20,
                                  ),
                                  child: Icon(
                                    Icons.phone,
                                    color: Color(0xFFD6001B),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 15,
                                    top: 10,
                                    bottom: 20,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    '+16468209892',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //
//End of Phone Number..

//Adding Email Address....
                          Row(
                            children: [
//Using Email Icon....
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 15,
                                  top: 10,
                                  bottom: 20,
                                ),
                                child: Icon(
                                  Icons.email,
                                  color: Color(0xFFD6001B),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 15,
                                  top: 10,
                                  bottom: 20,
                                ),
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  'my@tekapakhi.com',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
//Ending of Email address..

//Adding Contact us ..
                          Row(
                            children: [
//Using WhatsApp Icon..
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 15,
                                  top: 10,
                                  bottom: 20,
                                ),
                                child: Icon(
                                  Icons.whatsapp,
                                  color: Colors.green,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 15,
                                  top: 10,
                                  bottom: 20,
                                  // bottom: 15,
                                ),
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  '+16468209892',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
//Ending Contact us....
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //
                  //Adding Support Image..
                  //

                  Container(
                    // height: 150,
                    // color: Color(0xFFF4F8FB),
                    // color: Colors.black,
                    margin: EdgeInsets.only(
                      top: _height * 0.1,
                      // left: _widht * 0.1,
                      // right: _widht * 0.1,
                    ),
                    decoration: BoxDecoration(
                        // color: Color(0xFFF4F8FB).withOpacity(0.5),
                        ),
                    child: Column(
                      children: [
                        Opacity(
                          opacity: 0.5,
                          child: SvgPicture.asset(
                            'assets/support_t.svg',
                            height: 150,
                          ),
                          // child: SvgPicture.asset(
                          //   'assets/support_t.svg',
                          //   // color: Colors.white.withOpacity(0.7),
                          //   height: 160,
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ],
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
