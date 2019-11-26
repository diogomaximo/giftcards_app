import 'package:flutter/material.dart';
import 'package:giftcards_app/model/gift_card.dart';
import 'package:giftcards_app/model/transaction.dart';
import 'package:giftcards_app/widgets/title_section.dart';
import 'package:giftcards_app/widgets/cupom_list.dart';
import 'package:giftcards_app/widgets/shape.dart';
import 'package:giftcards_app/widgets/transactions_list.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _opacityTransactions = 0.0;
  final List<GiftCard> giftCards = GiftCard.getGiftCards();

  @override
  void initState() {
    new Future.delayed(const Duration(milliseconds: 300), () {
     setState(() {
      _opacityTransactions = 1;
     });

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _lefShape(),
          _secondShape(),
          _rightShape(),
          _layoutArea()
        ],
      ),
    );
  }

  Widget _layoutArea(){
    return AnimatedOpacity(
      curve: Curves.decelerate,
      duration: Duration(seconds: 1),
      opacity: _opacityTransactions,
      child: SafeArea(
        child: Column(
          children: <Widget>[
          TitleSection("Gift Cards"),
            CupomList(),
            TitleSection("Transactions", topSpace: 1.0, fontSize: 22.0, leftSpace: 20.0),
            TransactionsList(),
          ],
        ),
      ),
    );
  }

  Widget _lefShape() {
    return CustomPaint(
      painter: ShapesPainter(),
      child: Container(
        height: 5,
      ),
    );
  }

  Widget _secondShape() {
    return Container(
      margin: EdgeInsets.only(left: 144, top: 30),
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
        color: shapeColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _separatorCircle() {
    return Container(
      margin: EdgeInsets.only(left: 0,),
      width: 7.0,
      height:10.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _rightShape() {
    return CustomPaint(
      painter: RightShapePainter(),
      child: Container(
        height: 5,
      ),
    );
  }

}

