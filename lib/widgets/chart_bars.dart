import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String weekDay;
  final String amountSpent;
  final double amountPctSpent;

  ChartBar(this.weekDay, this.amountSpent, this.amountPctSpent);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: constraints.maxHeight * 0.10,
            child: FittedBox(
              fit: BoxFit.contain,
              child:
                  Text('\$${double.tryParse(amountSpent)!.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.70,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 3,
                    ),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: amountPctSpent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.10,
            child: FittedBox(
              child: Text(
                weekDay.substring(0, 1),
              ),
            ),
          ),
        ],
      );
    });
  }
}
