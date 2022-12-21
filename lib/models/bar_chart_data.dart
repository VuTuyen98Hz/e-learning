class BarChartData {
  List<double> listValueBarChart;
  List<String> listTopTitleBarChart;

  BarChartData(
      {this.listValueBarChart = const [],
      this.listTopTitleBarChart = const []});

  factory BarChartData.fromMap(Map data) {
    return BarChartData(
      listValueBarChart: ((data['listValueBarChart'] ??[]) as List)
          .map((item) => item as double)
          .toList(),
      listTopTitleBarChart: ((data['listTopTitleBarChart'] ??[]) as List)
          .map((item) => item as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'listValueBarChart': listValueBarChart,
    'listTopTitleBarChart': listTopTitleBarChart,

  };


}

