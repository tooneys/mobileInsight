class AnalysisView {
  final String dailyDate;
  final double orderAmt;
  final double paidAmt;
  final double discountAmt;

  const AnalysisView({
    required this.dailyDate,
    required this.orderAmt,
    required this.paidAmt,
    required this.discountAmt,
  });

  factory AnalysisView.fromJson(Map<String, dynamic> json) {
    return AnalysisView(
      dailyDate: json["DT_COMP"],
      orderAmt: json["AM_ORDER"],
      paidAmt: json["AM_AMT"],
      discountAmt: json["AM_DISCOUNT"],
    );
  }

  Map<String, dynamic> toJson() => {
    'dailyDate': dailyDate,
    'orderAmt': orderAmt,
    'paidAmt': paidAmt,
    'discountAmt': discountAmt,
  };

}
