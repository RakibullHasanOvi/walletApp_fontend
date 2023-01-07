import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangePinPage extends StatelessWidget {
  const ChangePinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    final _widht = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F8FB),
        //Start the AppBar..
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
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Container(
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
                    Form(
                      child: Column(
                        children: [
                          //
                          //
                          //
                          Row(
                            children: [
                              Container(
                                // alignment: Alignment.topLeft,
                                child: GestureDetector(
                                  child: Container(
                                    // alignment: Alignment.topLeft,
                                    height: 38,
                                    width: 38,
                                    margin: const EdgeInsets.only(
                                      left: 18,
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
                                margin: EdgeInsets.only(
                                  left: _height * 0.09,
                                ),
                                // alignment: Alignment.topCenter,
                                child: const Text(
                                  'CHNAGE PIN',
                                  style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //
                          //Current Pin
                          //
                          Container(
                            margin: const EdgeInsets.only(
                              top: 25,
                              left: 25,
                              right: 25,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(12),
                                border: OutlineInputBorder(
                                    // borderSide: BorderSide.none,
                                    ),
                                filled: true,
                                fillColor: Color.fromARGB(238, 230, 241, 244),
                                label: Text('Current Pin'),
                                // hintText: 'Mobile number',
                              ),
                            ),
                          ),
                          //
                          //New Pin..
                          //
                          Container(
                            margin: const EdgeInsets.only(
                              top: 25,
                              left: 25,
                              right: 25,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(12),
                                border: OutlineInputBorder(
                                    // borderSide: BorderSide.none,
                                    ),
                                filled: true,
                                fillColor: Color.fromARGB(238, 230, 241, 244),
                                label: Text('New Pin'),
                              ),
                            ),
                          ),
                          //
                          //Confirm Pin..
                          //
                          Container(
                            margin: const EdgeInsets.only(
                              top: 25,
                              left: 25,
                              right: 25,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(12),
                                border: OutlineInputBorder(
                                    // borderSide: BorderSide.none,
                                    ),
                                filled: true,
                                fillColor: Color.fromARGB(238, 230, 241, 244),
                                label: Text('Confirm Pin'),
                              ),
                            ),
                          ),
                          //
                          //ElevatedButton...
                          //
                          Container(
                            margin: const EdgeInsets.only(
                              top: 35,
                              left: 25,
                              right: 25,
                            ),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(_widht / 1, 50),
                                  backgroundColor: const Color(0xFFD6001B),
                                ),
                                onPressed: (() {}),
                                child: const Text(
                                  'Send',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
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
      ),
    );
  }
}
