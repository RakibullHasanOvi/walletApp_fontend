import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

// import '../buttom_navigation.dart';

class AddFund extends StatelessWidget {
  const AddFund({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Using MedeaQurey height/weight

    final _height = MediaQuery.of(context).size.height;

    final _widht = MediaQuery.of(context).size.width;

    //
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F8FB),
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
        //Close AppBar......
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button use...
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
                          'ADD FUND',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //end of back button....

                  //Profile Card..

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
                          Container(
                            margin: const EdgeInsets.only(
                              left: 15,
                              top: 10,
                            ),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Zulfiker Ali Sumon',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 15,
                              top: 8,
                            ),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Coustomer ID',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 15,
                              top: 8,
                              bottom: 15,
                            ),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              '15994512',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //End of Profile Card..

                  //Add for fund ...
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

                    child: Card(
                      elevation: 0,
                      // color: Colors.yellow,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 15,
                              top: 10,
                            ),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'ADD FOR FUND',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          //
                          //
                          Container(
                            margin: const EdgeInsets.only(
                              left: 15,
                              top: 10,
                            ),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Contact With Our Agent',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          //
                          //
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),

                            //Link this button....
                            child: GestureDetector(
                              onTap: () {
                                var _uri =
                                    Uri.parse('https://wa.me/16468209892');
                                launchUrl(
                                  _uri,
                                  mode: LaunchMode.externalApplication,
                                );
                                print('Ok');
                              },
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: const EdgeInsets.only(
                                      left: 15,
                                      top: 8,
                                    ),
                                    child: Image.asset(
                                      'assets/whatsapp.png',
                                      color: Colors.green,
                                      height: 25,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 15,
                                      top: 8,
                                    ),
                                    alignment: Alignment.topLeft,
                                    child: const Text(
                                      '+16468209892',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //End of Add for fund...

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

                    child: Card(
                      elevation: 0,
                      // color: Colors.yellow,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 15,
                              top: 10,
                            ),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'WE ACCEPT',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          //
                          //
                          Container(
                            margin: const EdgeInsets.only(
                              left: 15,
                              top: 10,
                            ),
                            alignment: Alignment.topLeft,

                            child: GestureDetector(
                              onTap: () {
                                var _uri =
                                    Uri.parse('https://www.paypal.com/bd/home');
                                launchUrl(
                                  _uri,
                                  mode: LaunchMode.externalApplication,
                                );
                                print('Ok');
                              },
                              child: SvgPicture.asset('assets/PayPal.svg'),
                            ),
                            // child: Text(
                            //   'CONTACT US OUR AGENT',
                            //   style: TextStyle(
                            //     fontSize: 15,
                            //     color: Colors.black,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                          ),
                          //
                          //
                          const SizedBox(
                            height: 8,
                          ),
                        ],
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


/*

Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    left: 30,
                  ),
                  child: Text(
                    'RohimulKarimKhondokarForhad',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    left: 30,
                  ),
                  child: Text(
                    'Customer ID',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    '15994512',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),

*/

/*
crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                //
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'For Add Fund',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                GestureDetector(
                  onTap: () {
                    var _uri = Uri.parse('https://wa.me/16468209892');
                    launchUrl(
                      _uri,
                      mode: LaunchMode.externalApplication,
                    );
                    print('Ok');
                  },
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // padding: EdgeInsets.only(
                        //   left: 30,
                        // ),
                        child: Image.asset(
                          'assets/whatsapp.png',
                          color: Colors.green,
                          height: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Text('01717256199'),
                      ),
                    ],
                  ),
                ),
              ],
            ),

*/