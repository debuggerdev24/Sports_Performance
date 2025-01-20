
class MetricsModel {
  List<Datum> data;

  MetricsModel({
    required this.data,
  });

  factory MetricsModel.fromJson(Map json) => MetricsModel(
        data: (json["data"] as List).map((e) => Datum.fromJson(e)).toList(),
      );
}

class Datum {
  String id;
  String metricName;
  String unitType;
  String latestResult;
  String targetResult;

  Datum({
    required this.id,
    required this.metricName,
    required this.unitType,
    required this.latestResult,
    required this.targetResult,
  });

  factory Datum.fromJson(Map json) => Datum(
        id: json["id"],
        metricName: json["metric_name"],
        unitType: json["unit_type"],
        latestResult: json["latest_result"] ?? "latest_result",
        targetResult: json["target_result"] ?? "target_result",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "metric_name": metricName,
        "unit_type": unitType,
        "latest_result": latestResult,
        "target_result": targetResult,
      };
}
