import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return Card(
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      '\$${transactions[index].amount!.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                radius: 30,
              ),
              title: Text(
                transactions[index].title!,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transactions[index].date!),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transactions[index].id),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
