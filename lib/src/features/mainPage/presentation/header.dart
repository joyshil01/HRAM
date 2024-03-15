// ignore_for_file: must_be_immutable, sort_child_properties_last, unnecessary_null_comparison

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../domain/indicator.dart';

// import '../domain/indicator.dart';

class HeaderMainScreen extends StatefulWidget {
  const HeaderMainScreen({super.key});

  @override
  State<HeaderMainScreen> createState() => _HeaderMainScreenState();
}

class _HeaderMainScreenState extends State<HeaderMainScreen> {
  bool _isBalanceVisible = true;
  String dropdownvalue = 'This Month';
  int touchedIndex = -1;
  String selectedValue = 'This Month';
  String value = 'This Month';
  String selectedPie = 'This Month';

  var items = [
    'Today',
    'This Week',
    'This Month',
    'Quarter Present',
    'This Year',
  ];

  String _incomeText = '12,000';
  String _expenseText = '10,000';
  String _balanceText = '2,000';

  String _bankPercentage = 'Bank (70.78 %)';
  String _personalPercentage = 'Personal (15.09 %)';
  String _homePercentage = 'Home (7.64 %)';
  String _entertainmentPercentage = 'Entertainment (2.31 %)';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: appBarBg,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Card(
              elevation: 1.25,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Total balance',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 13,
                            )
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              _isBalanceVisible ? '2,000' : '***000',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              ' RS',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isBalanceVisible = !_isBalanceVisible;
                        });
                      },
                      icon: Icon(
                        _isBalanceVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 1.25,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Expense vs Income',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  DropdownButton(
                    value: dropdownvalue,
                    underline: const SizedBox(),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                    ),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 13),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                        print('Selected value: $newValue');
                        _updateTextValues(newValue);
                        _updatedTextPie(newValue);
                      });
                    },
                  ),
                  Visibility(
                    visible: _incomeText != null && _incomeText.isNotEmpty,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 140,
                                  width: 120,
                                  child: _buildChart(dropdownvalue),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _incomeText != '0'
                                        ? const Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 3.5,
                                                backgroundColor: Colors.green,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                'Income',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              )
                                            ],
                                          )
                                        : const SizedBox(),
                                    const SizedBox(height: 16),
                                    _expenseText != '0'
                                        ? const Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 3.5,
                                                backgroundColor: Colors.red,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                'Expense',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: _isBalanceVisible
                                        ? _incomeText
                                        : '***000',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 16,
                                    ),
                                    children: const [
                                      TextSpan(text: ' RS'),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text.rich(
                                  TextSpan(
                                    text: _isBalanceVisible
                                        ? _expenseText
                                        : '***000',
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                    ),
                                    children: const [
                                      TextSpan(text: ' RS'),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text.rich(
                                  TextSpan(
                                    text: _isBalanceVisible
                                        ? _balanceText
                                        : '***000',
                                    style: const TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                    ),
                                    children: const [
                                      TextSpan(text: ' RS'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            SizedBox(
                              height: 90,
                              width: 70,
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback:
                                        (FlTouchEvent event, pieTouchResponse) {
                                      setState(() {
                                        if (!event
                                                .isInterestedForInteractions ||
                                            pieTouchResponse == null ||
                                            pieTouchResponse.touchedSection ==
                                                null) {
                                          touchedIndex = -1;
                                          return;
                                        }
                                        touchedIndex = pieTouchResponse
                                            .touchedSection!
                                            .touchedSectionIndex;
                                      });
                                    },
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 28,
                                  sections: showingSections(dropdownvalue),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                _bankPercentage.isNotEmpty
                                    ? Indicator(
                                        color: Colors.amber,
                                        text: _bankPercentage,
                                        isSquare: true,
                                      )
                                    : const SizedBox(),
                                const SizedBox(height: 4),
                                _personalPercentage.isNotEmpty
                                    ? Indicator(
                                        color: Colors.red,
                                        text: _personalPercentage,
                                        isSquare: true,
                                      )
                                    : const SizedBox(),
                                const SizedBox(height: 4),
                                _homePercentage.isNotEmpty
                                    ? Indicator(
                                        color: Colors.greenAccent,
                                        text: _homePercentage,
                                        isSquare: true,
                                      )
                                    : const SizedBox(),
                                const SizedBox(height: 4),
                                _entertainmentPercentage.isNotEmpty
                                    ? Indicator(
                                        color: Colors.blueGrey,
                                        text: _entertainmentPercentage,
                                        isSquare: true,
                                      )
                                    : const SizedBox(),
                                const SizedBox(height: 18),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    replacement: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Today you not have any record.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Record history',
                          style: TextStyle(color: Colors.blue),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _updatedTextPie(String value) {
    switch (value) {
      case 'Today':
        _bankPercentage = '';
        _personalPercentage = '';
        _homePercentage = '';
        _entertainmentPercentage = '';
        break;

      case 'This Week':
        _bankPercentage = 'Bank (10.25 %)';
        _personalPercentage = '';
        _homePercentage = '';
        _entertainmentPercentage = '';
        break;
      case 'This Month':
        _bankPercentage = 'Bank (70.78 %)';
        _personalPercentage = 'Personal (15.09 %)';
        _homePercentage = 'Home (7.64 %)';
        _entertainmentPercentage = 'Entertainment (2.31 %)';
      case 'Quarter Present':
        _bankPercentage = 'Bank (70.78 %)';
        _personalPercentage = 'Personal (15.09 %)';
        _homePercentage = 'Home (7.64 %)';
        _entertainmentPercentage = 'Entertainment (2.31 %)';
      case 'This Year':
        _bankPercentage = 'Bank (70.78 %)';
        _personalPercentage = 'Personal (15.09 %)';
        _homePercentage = 'Home (7.64 %)';
        _entertainmentPercentage = 'Entertainment (2.31 %)';
        break;
    }
  }

  void _updateTextValues(String selectedValue) {
    switch (selectedValue) {
      case 'Today':
        _incomeText = '';
        _expenseText = '';
        _balanceText = '';
        break;
      case 'This Week':
        _incomeText = '0';
        _expenseText = '600';
        _balanceText = '-600';
        break;
      case 'This Month':
        _incomeText = '12,000';
        _expenseText = '10,000';
        _balanceText = '2,000';
      case 'Quarter Present':
        _incomeText = '12,000';
        _expenseText = '10,000';
        _balanceText = '2,000';
      case 'This Year':
        _incomeText = '12,000';
        _expenseText = '10,000';
        _balanceText = '2,000';
        break;
    }
  }

  List<PieChartSectionData> showingSections(String selectedValue) {
    switch (selectedValue) {
      case 'Today':
        return [
          PieChartSectionData(
            color: Colors.red,
            value: 60,
            title: '',
            radius: 15.0,
            titleStyle: const TextStyle(
              fontSize: 4.0,
              fontWeight: FontWeight.bold,
              color: textColor,
              shadows: [Shadow(color: Colors.black, blurRadius: 2)],
            ),
          ),
        ];
      case 'This Week':
        return [
          PieChartSectionData(
            color: Colors.amber,
            value: 30,
            title: '',
            radius: 15.0,
          ),
        ];
      case 'This Month':
        return [
          PieChartSectionData(
            color: Colors.amber,
            value: 70,
            title: '',
            radius: 15.0,
          ),
          PieChartSectionData(
            color: Colors.red,
            value: 15,
            title: '',
            radius: 15.0,
          ),
          PieChartSectionData(
            color: Colors.greenAccent,
            value: 8,
            title: '',
            radius: 15.0,
          ),
          PieChartSectionData(
            color: Colors.blueGrey,
            value: 3,
            title: '',
            radius: 15.0,
          ),
          PieChartSectionData(
            color: Colors.purpleAccent,
            value: 10,
            title: '',
            radius: 15.0,
          ),
          PieChartSectionData(
            color: Colors.pink,
            value: 5,
            title: '',
            radius: 15.0,
          ),
        ];
      case 'Quarter Present':
        return [
          PieChartSectionData(
            color: Colors.amber,
            value: 70,
            title: '',
            radius: 15.0,
          ),
          PieChartSectionData(
            color: Colors.red,
            value: 15,
            title: '',
            radius: 15.0,
          ),
          PieChartSectionData(
            color: Colors.greenAccent,
            value: 8,
            title: '',
            radius: 15.0,
          ),
          PieChartSectionData(
            color: Colors.blueGrey,
            value: 3,
            title: '',
            radius: 15.0,
          ),
          PieChartSectionData(
            color: Colors.purpleAccent,
            value: 10,
            title: '',
            radius: 15.0,
          ),
          PieChartSectionData(
            color: Colors.pink,
            value: 5,
            title: '',
            radius: 15.0,
          ),
        ];
      case 'This Year':
        return [
          PieChartSectionData(
            color: Colors.amber,
            value: 70,
            title: '',
            radius: 15.0,
          ),
          PieChartSectionData(
            color: Colors.red,
            value: 15,
            title: '',
            radius: 15.0,
          ),
          PieChartSectionData(
            color: Colors.greenAccent,
            value: 8,
            title: '',
            radius: 15.0,
          ),
          PieChartSectionData(
            color: Colors.blueGrey,
            value: 3,
            title: '',
            radius: 15.0,
          ),
          PieChartSectionData(
            color: Colors.purpleAccent,
            value: 10,
            title: '',
            radius: 15.0,
          ),
          PieChartSectionData(
            color: Colors.pink,
            value: 5,
            title: '',
            radius: 15.0,
          ),
        ];

      default:
        return [];
    }
  }
}

Widget _buildChart(String selectedValue) {
  List<LinearSales> data = [];
  if (selectedValue == 'Today') {
    data = [
      LinearSales("Income", 0),
      LinearSales("expense", 0),
    ];
  } else if (selectedValue == 'This Week') {
    data = [
      LinearSales("income", 0),
      LinearSales("expense", 30),
    ];
  } else if (selectedValue == 'This Month') {
    data = [
      LinearSales("income", 100),
      LinearSales("expense", 75),
    ];
  } else if (selectedValue == 'Quarter Present') {
    data = [
      LinearSales("income", 100),
      LinearSales("expense", 75),
    ];
  } else if (selectedValue == 'This Year') {
    data = [
      LinearSales("income", 100),
      LinearSales("expense", 75),
    ];
  }

  final chart = charts.BarChart(
    [
      charts.Series<LinearSales, String>(
        id: 'Sales',
        colorFn: (_, index) {
          return index! % 2 == 0
              ? charts.MaterialPalette.green.shadeDefault
              : charts.MaterialPalette.red.shadeDefault;
        },
        domainFn: (LinearSales sales, _) => sales.month,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      ),
    ],
    animate: true,
    domainAxis: const charts.OrdinalAxisSpec(
      renderSpec: charts.NoneRenderSpec(),
    ),
    primaryMeasureAxis: const charts.NumericAxisSpec(
      renderSpec: charts.NoneRenderSpec(),
    ),
  );
  return chart;
}

class LinearSales {
  final String month;
  final int sales;
  LinearSales(this.month, this.sales);
}
