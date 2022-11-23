import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../utils/helper.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    Size size = Helper(context).getSize();
    return ListView.builder(
      itemBuilder: (BuildContext ctx, int index) {
        return TransactionListWidget(
          transactions: transactions,
          size: size,
          deleteTx: deleteTx,
          index: index,
        );
      },
      itemCount: transactions.length,
    );
  }
}

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({
    Key? key,
    required this.transactions,
    required this.size,
    required this.deleteTx,
    required this.index,
  }) : super(key: key);

  final List<Transaction> transactions;
  final Size size;
  final Function deleteTx;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
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
        trailing: size.width > 400
            ? ElevatedButton.icon(
                onPressed: () => deleteTx(transactions[index].id),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                label: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(250, 250, 250, 1),
                  ),
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transactions[index].id),
              ),
      ),
    );
  }
}
