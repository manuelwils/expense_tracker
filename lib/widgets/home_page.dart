import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

import '../utils/helper.dart';
import 'chart.dart';
import 'no_item.dart';
import 'transaction_list.dart';

class HomePage extends StatefulWidget {
  final AppBar _appBar;
  final List<Transaction> _recentTransactions;
  final List<Transaction> _userTransactions;
  final Function _deleteTx;

  const HomePage(
    this._appBar,
    this._recentTransactions,
    this._userTransactions,
    this._deleteTx,
  );

  @override
  State<HomePage> createState() => _HomePageState();
}

bool _isSwitched = true;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bool isLandscape = Helper(context).isLandscape();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (isLandscape)
          Container(
            height: (MediaQuery.of(context).size.height -
                    widget._appBar.preferredSize.height -
                    MediaQuery.of(context).viewPadding.top) *
                (MediaQuery.of(context).orientation == Orientation.portrait
                    ? 0.05
                    : 0.10),
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            child: Row(
              children: <Widget>[
                const Text('Show chart'),
                Switch(
                  value: _isSwitched,
                  onChanged: (status) {
                    setState(() {
                      _isSwitched = status;
                    });
                  },
                )
              ],
            ),
          ),
        if (_isSwitched)
          SizedBox(
            height: (MediaQuery.of(context).size.height -
                    widget._appBar.preferredSize.height -
                    MediaQuery.of(context).viewPadding.top) *
                (MediaQuery.of(context).orientation == Orientation.portrait
                    ? 0.25
                    : 0.40),
            child: Chart(widget._recentTransactions),
          ),
        widget._userTransactions.isEmpty
            ? SizedBox(
                height: (MediaQuery.of(context).size.height -
                        widget._appBar.preferredSize.height -
                        MediaQuery.of(context).viewPadding.top) *
                    (MediaQuery.of(context).orientation == Orientation.portrait
                        ? 0.7
                        : 0.5),
                child: noItemToShow(context),
              )
            : SizedBox(
                height: (MediaQuery.of(context).size.height -
                        widget._appBar.preferredSize.height -
                        MediaQuery.of(context).viewPadding.top) *
                    (MediaQuery.of(context).orientation == Orientation.portrait
                        ? 0.7
                        : 0.5),
                child:
                    TransactionList(widget._userTransactions, widget._deleteTx),
              ),
      ],
    );
  }
}
