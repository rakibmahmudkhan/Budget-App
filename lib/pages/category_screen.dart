// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../helpers/color_helpers.dart';
import '../models/category_model.dart';
import '../models/expense_model.dart';
import '../widgets/radial_painter.dart';

class CategoryScreen extends StatefulWidget {
  final Category? category;
  const CategoryScreen({this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  _buildExpenses() {
    List<Widget> expenseList = [];
    widget.category!.expenses!.forEach((Expense expense) {
      expenseList.add(Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        height: 100.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                expense.name.toString(),
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '-\$${expense.cost?.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ));
    });
    return Column(
      children: expenseList,
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    widget.category!.expenses!.forEach((Expense expense) {
      totalAmountSpent += expense.cost!;
    });
    final double amountLeft = widget.category!.maxAmount! - totalAmountSpent;
    final double percent = amountLeft / widget.category!.maxAmount!.toDouble();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category!.name.toString()),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            iconSize: 30.0,
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(20.0),
              height: 250.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: CustomPaint(

                foregroundPainter: RadialPainter(
                  bgColor: Colors.grey,
                  lineColor: getColor(context, percent),
                  percent: percent,
                  width: 21.0,
                ),
                child: Center(
                  child: Text(
                    '\$${amountLeft.toStringAsFixed(2)} / \$${widget.category!.maxAmount}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            _buildExpenses(),
          ],
        ),
      ),
    );
  }
}


 

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../helpers/color_helpers.dart';
// import '../models/category_model.dart';
// import '../models/expense_model.dart';
// import '../widgets/radial_painter.dart';

// class CategoryScreen extends StatefulWidget {
//   final Category? category;

//   CategoryScreen({this.category});

//   @override
//   _CategoryScreenState createState() => _CategoryScreenState();
// }

// class _CategoryScreenState extends State<CategoryScreen> {
//   _buildExpenses() {
//     List<Widget> expenseList = [];
//     widget.category.expenses.forEach((Expense expense) {
//       expenseList.add(Container(
//         alignment: Alignment.center,
//         margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//         height: 80.0,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               offset: Offset(0, 2),
//               blurRadius: 6.0,
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(30.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 expense.name,
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 '-\$${expense.cost.toStringAsFixed(2)}',
//                 style: TextStyle(
//                   color: Colors.red,
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ));
//     });
//     return Column(
//       children: expenseList,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     double totalAmountSpent = 0;
//     widget.category!.expenses!.forEach((Expense expense) {
//       totalAmountSpent += expense.cost!;
//     });
//     final double amountLeft = widget.category!.maxAmount! - totalAmountSpent;
//     final double percent = amountLeft / widget.category!.maxAmount;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.category!.name),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.add),
//             iconSize: 30.0,
//             onPressed: () {},
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.all(20.0),
//               padding: EdgeInsets.all(20.0),
//               height: 250.0,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10.0),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     offset: Offset(0, 2),
//                     blurRadius: 6.0,
//                   ),
//                 ],
//               ),
//               child: CustomPaint(
//                 foregroundPainter: RadialPainter(
//                   bgColor: Colors.grey[200],
//                   lineColor: getColor(context, percent),
//                   percent: percent,
//                   width: 15.0,
//                 ),
//                 child: Center(
//                   child: Text(
//                     '\$${amountLeft.toStringAsFixed(2)} / \$${widget.category!.maxAmount}',
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             _buildExpenses(),
//           ],
//         ),
//       ),
//     );
//   }
// }

 