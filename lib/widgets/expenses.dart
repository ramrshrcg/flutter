import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:expense_tracker_app/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    //there is a expenses that to
    //be displayed in the app in front page
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpenses),
    );
  }

  void _addExpenses(Expense expense) {
    setState(() {});
    _registeredExpenses.add(expense);
  }

  void _removeexpense(Expense expense) {
    final expenseIndex= _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('expense deleted'),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () {setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        'No expenses found. Start adding some ',
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeexpense);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker '),
        backgroundColor: const Color.fromARGB(255, 190, 98, 206),
        actions: [
          IconButton(
            onPressed: () {
              _openAddExpenseOverlay();
            }, //_openAddExpenseOverlay(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('THE EXPENSES'),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
