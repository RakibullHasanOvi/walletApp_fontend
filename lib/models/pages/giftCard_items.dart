import 'package:flutter/material.dart';
import 'package:wallet_ui/models/gift_card.dart';
import 'package:wallet_ui/models/pages/bank_details.dart';
import 'package:wallet_ui/models/pages/giftCard_detailes.dart';

class GiftCardItems extends StatelessWidget {
  // const MobileBankingItems({Key? key}) : super(key: key);
  final giftCard = GiftCard.items();
// MobileBankingItems(this.mbList);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: giftCard.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) =>
                      GiftCardFormPage(giftCard[index]),
                  transitionDuration: Duration(seconds: 0),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => BankFormPage(bankList[index]),
              // bankList[index]
              //   ),
              // );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(giftCard[index].imgUrl),
                ),
              ),
              // child: AssetImage(assetName),
            ),
          );
        });
  }
}
