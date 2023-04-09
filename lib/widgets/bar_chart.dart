// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double>? expenses;

  BarChart({Key? key, this.expenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    // ignore: avoid_function_literals_in_foreach_calls
    expenses!.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });

    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Column(
        children: [
          Text(
            "Weekly Spending",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios),
              ),
              Text(
                "Nov 10,2022 -Nov16,2022",
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                label: "Fri",
                amountSpent: expenses![0],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Sat",
                amountSpent: expenses![1],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Su",
                amountSpent: expenses![2],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Mo",
                amountSpent: expenses![3],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Tu",
                amountSpent: expenses![4],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "We",
                amountSpent: expenses![5],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Th",
                amountSpent: expenses![6],
                mostExpensive: mostExpensive,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String? label;
  final double? amountSpent;
  final double? mostExpensive;
  final double _maxBarHeight = 100.0;

  const Bar({Key? key, this.label, this.amountSpent, this.mostExpensive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent! / mostExpensive!.toInt() * _maxBarHeight;
    return Column(
      children: [
        Text(
          "\$${amountSpent!.toStringAsFixed(2)}",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 6.0,
        ),
        Container(
          height: barHeight,
          width: 18.0,
          decoration: BoxDecoration(
            color: Color(0XFFAB47BCC),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          label!,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
        )
      ],
    );
  }
}
