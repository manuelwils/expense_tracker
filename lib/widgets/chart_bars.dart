import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String weekDay;
  final String amountSpent;
  final double amountPctSpent;

  ChartBar(this.weekDay, this.amountSpent, this.amountPctSpent);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('\$${double.tryParse(amountSpent)!.toStringAsFixed(0)}'),
        const SizedBox(height: 5),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 6,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
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
        const SizedBox(height: 5),
        Text(weekDay.substring(0, 1)),
      ],
    );
  }
}
