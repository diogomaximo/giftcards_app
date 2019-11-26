import 'package:flutter/material.dart';

class GiftCard{
    String name;
    String amount;
    Color cardColor;

    GiftCard(this.name, this.amount, this.cardColor);

    static getGiftCards(){
      return [
        GiftCard("FRIENDS", "\$80.25", Color.fromRGBO(61, 85, 81, 0.8)),
        GiftCard("FAMILY", "\$99.29", Color.fromRGBO(87, 87, 246,1)),
        GiftCard("AMUSE", "\$39.44", Color.fromRGBO(81, 164, 116,1)),
      ];
    }


}