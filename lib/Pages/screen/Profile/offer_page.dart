import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OfferPageDetailes extends StatelessWidget {
  const OfferPageDetailes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return SafeArea(
      // top: false,
      child: Scaffold(
        backgroundColor: Color(0xFFF4F8FB),
//Start AppBar...
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 200,
          leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                print('logo');
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
                  'assets/notification_2.svg',
                  height: 22,
                ),
              ),
            ),
          ],
        ),
        //Close AppBar......
        body: Column(
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
                    blurRadius: 7,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button use...
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // alignment: Alignment.topCenter,
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
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: _height * 0.12,
                        ),
                        child: const Text(
                          'OFFER',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //end of back button....
                  Expanded(
                      child: ListView(
                    children: [
                      //! 1st Card Image work start..
                      OfferImage("assets/support_t.svg", _height),
//! 1st image work done...
//2nd image work start....
                      OfferImage("assets/support_t.svg", _height),
//2nd image work end..

//3nd image work start....
                      OfferImage("assets/support_t.svg", _height),
//3nd image work end..
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//! Here are building offer Image Widget....
class OfferImage extends StatelessWidget {
  OfferImage(
    this.image,
    this._height,
  );
  final _height;
  final image;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        color: Colors.white,
      ),
      // height: 100,
      // width: _widht,
      child: Container(
        height: _height * 0.18,
        child: Card(
          elevation: 0,
          // color: Colors.yellow,
          child: SvgPicture.asset(
            image,

            // height: _height * 0.2,
            // width: _width,
            // height: MediaQuery.of(),
          ),
        ),
      ),
    );
  }
}
