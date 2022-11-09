import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    final amount = double.tryParse(amountController.text);

    if (title.isEmpty || amount! <= 0) {
      return;
    }

    addNewTransaction(title, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(backgroundColor: Colors.grey.shade50),
              onPressed: () => submitData(),
              child: const Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
