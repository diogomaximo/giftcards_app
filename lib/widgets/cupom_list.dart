import 'package:flutter/material.dart';
import 'package:giftcards_app/model/gift_card.dart';
import 'package:giftcards_app/widgets/shape.dart';

enum Share { reload, share, transferTo, delete }

class CupomList extends StatefulWidget {
  @override
  _CupomListState createState() => _CupomListState();
}

class _CupomListState extends State<CupomList> {

  final List<GiftCard> giftCards = GiftCard.getGiftCards();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      height: 480,
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Container(width: 16,),
          scrollDirection: Axis.horizontal,
          itemCount: giftCards.length,
          itemBuilder: (context, index) {
            return _cupomCard(context, giftCards[index]);
          }),
    );
  }

  Widget _cupomCard(context, giftCard) {

    final cardWidth = MediaQuery.of(context).size.width * 0.78;

    return Container(

      width: cardWidth,
      child: InkWell(
        onTap: () => {},
        child: Card(
          color: giftCard.cardColor,
          child: Container(
            child: Column(
              children: <Widget>[
                _popUpButton(),
                _giftCardValues(giftCard),
                _separator(cardWidth),
                _qrCodeSection()
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _popUpButton(){
    return Align(
      alignment: Alignment.topRight,
      child: PopupMenuButton<Share>(
        color: Colors.black.withOpacity(0.6),
        icon: Icon(Icons.more_vert, color: Colors.white, size: 30,),
        onSelected: (Share result) { },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Share>>[
          _popMenuItem("Reload"),
          _popMenuItem("Share"),
          _popMenuItem("Transfer to"),
          _popMenuItem("Delete"),
        ],
      ),
    );
  }

  Widget _popMenuItem(text){
    return PopupMenuItem<Share>(
      child: Text(text, style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold
      ),),
    );
  }

  Widget _giftCardValues(giftCard){
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10),
        ),
        cardTextType(giftCard.name),
        Container(
            padding: EdgeInsets.only(left:10, top: 150),
            child: Text(
              giftCard.amount,
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.white.withOpacity(0.91), fontSize: 46.0),
            )
        )
      ],
    );
  }

  Widget _moreButtom(){
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: Icon(Icons.more_vert),
        alignment: Alignment.topRight,
        color: Colors.white,
        onPressed: () {},
      ),
    );
  }

  Widget _separator(width){
    return
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          children: <Widget>[
            CustomPaint(painter: CircleSeparatorPainter(true),),
            CustomPaint( painter: LineDashedPainter(width),),
            CustomPaint(painter: CircleSeparatorPainter(false),),
          ],
        ),
      )
    ;
  }

  Widget _qrCodeSection(){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 24),
      child: Row(children: <Widget>[
        qrCodeImage(),
        _qrCodeTextHowToUse(),
      ],),
    );
  }

//  Let your cashier know you’d like to use your gift card.
  Widget _qrCodeTextHowToUse(){
    return  Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Text("Scan QR code", style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold
            ) ,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text("Let your cashier \nknow you’d like to\nuse your gift card.",

                style: TextStyle(
                    color: Colors.white, fontSize: 12)),
          ),

        ],
      ),
    );
  }

  Widget qrCodeImage(){
    return Image.network('https://www.qrcode-monkey.com/img/blog/qrcode-classic-blue.png',
        width: 100, height: 100);
  }

  Widget cardTextType(name) {
    return RotatedBox(
      quarterTurns: -1,
      child: Text(
        name,
        style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 46.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }

}
