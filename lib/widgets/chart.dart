import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bars.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date!.day == weekDay.day &&
            recentTransactions[i].date!.month == weekDay.month &&
            recentTransactions[i].date!.year == weekDay.year) {
          totalSum += recentTransactions[i].amount!;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpent {
    return groupedTransactionValues.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element['amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: groupedTransactionValues.map((tx) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ChartBar(
                  tx['day'].toString(),
                  tx['amount'].toString(),
                  totalSpent == 0.0
                      ? 0.0
                      : ((tx['amount'] as double) / totalSpent)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
