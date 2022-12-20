class BarChartData {
  List<int> listNumberTrueResult;
  List<int> listNumberTotalResult;

  BarChartData(
      {this.listNumberTrueResult = const [],
      this.listNumberTotalResult = const []});

  factory BarChartData.fromMap(Map data) {
    return BarChartData(
      listNumberTrueResult: ((data['listNumberTrueResult'] ??[]) as List)
          .map((item) => item as int)
          .toList(),
      listNumberTotalResult: ((data['listNumberTotalResult'] ??[]) as List)
          .map((item) => item as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'listNumberTrueResult': listNumberTrueResult,
    'listNumberTotalResult': listNumberTotalResult,

  };


}

