import 'package:flutter/material.dart';
import 'package:giftcards_app/model/transaction.dart';

class TransactionsList extends StatefulWidget {
  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {

  final List transactions = Transaction.getTransactions();

  @override
  Widget build(BuildContext context) {
    return  Flexible(
      child: ListView.separated(
          padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
          separatorBuilder: (context, index) => Divider(
            height: 20,
            endIndent: MediaQuery.of(context).size.width - 30,
            color: Colors.black,
          ),
          shrinkWrap: true,
          itemCount: transactions.length,
          itemBuilder: (BuildContext context, int index) =>
              Text(transactions[index],
                style: TextStyle(fontSize: 14),)
      ),
    );
  }
}
