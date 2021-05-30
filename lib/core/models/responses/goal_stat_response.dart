

import 'package:bots_assessment/core/models/goal_stat.dart';
import 'package:bots_assessment/core/models/pagination.dart';

class GoalStatResponse {
  GoalStatResponse({
    this.data,
    this.pagination,
  });

  final List<GoalStat> data;
  final Pagination pagination;

  factory GoalStatResponse.fromJson(Map<String, dynamic> json) => GoalStatResponse(
    data: json["data"] == null ? null : List<GoalStat>.from(json["data"].map((x) => GoalStat.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "pagination": pagination == null ? null : pagination.toJson(),
  };
}