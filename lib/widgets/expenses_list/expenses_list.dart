import 'package:expense_tracker_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(.75),
          margin: EdgeInsets.symmetric( 
            horizontal: Theme.of(context).cardTheme.margin?.horizontal??0.0,
          ),
        ),
        onDismissed: (direction) {   
          onRemoveExpense(
            expenses[index],
          );
        },
        child: Expense_item(expenses[index]),
      ),
    );
  }
}
