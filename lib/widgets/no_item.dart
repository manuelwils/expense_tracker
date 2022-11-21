import 'package:flutter/material.dart';

Widget noItemToShow(context) {
  return LayoutBuilder(builder: (context, constraints) {
    return Container(
      height: constraints.maxHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/no-tx.jfif'),
          fit: BoxFit.none,
        ),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'No transaction to show!',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  });
}
