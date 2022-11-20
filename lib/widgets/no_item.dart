import 'package:flutter/material.dart';

Widget noItemToShow(context) {
  return Container(
    height: 300,
    alignment: Alignment.center,
    child: Column(
      children: [
        Text(
          'No transaction to show!',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 10),
        Image.asset('assets/images/no-tx.jfif'),
      ],
    ),
  );
}
