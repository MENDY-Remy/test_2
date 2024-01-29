import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              //--Ici--
              startDegreeOffset: -90,
              sectionsSpace: 0.0,
              centerSpaceRadius: 70,
              sections: paiChartSelectionsDatas,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: defaultPadding),
                Text(
                  "29.1",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
                const Text("of 128GB"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
List<PieChartSectionData> paiChartSelectionsDatas = [
  //--
  PieChartSectionData(
    value: 25,
    color: primaryColor,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    value: 20,
    color: const Color(0xFF26e5ff),
    showTitle: false,
    radius: 22,
  ),
  PieChartSectionData(
    value: 10,
    color: const Color(0xFFfffc26),
    showTitle: false,
    radius: 19,
  ),
  PieChartSectionData(
    value: 15,
    color: const Color(0xFFee2727),
    showTitle: false,
    radius: 16,
  ),
  PieChartSectionData(
    value: 25,
    color: primaryColor.withOpacity(0.1),
    showTitle: false,
    radius: 13,
  ),
  //--
];
//