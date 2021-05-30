

class GoalStat {
  GoalStat({
    this.idPlayer,
    this.playerName,
    this.totalGoals,
    this.penaltiesScored,
    this.penaltiesMissed,
    this.rank,
  });

  final int idPlayer;
  final String playerName;
  final int totalGoals;
  final int penaltiesScored;
  final int penaltiesMissed;
  final int rank;

  factory GoalStat.fromJson(Map<String, dynamic> json) => GoalStat(
    idPlayer: json["idPlayer"] == null ? null : json["idPlayer"],
    playerName: json["playerName"] == null ? null : json["playerName"],
    totalGoals: json["totalGoals"] == null ? null : json["totalGoals"],
    penaltiesScored: json["penaltiesScored"] == null ? null : json["penaltiesScored"],
    penaltiesMissed: json["penaltiesMissed"] == null ? null : json["penaltiesMissed"],
    rank: json["rank"] == null ? null : json["rank"],
  );

  Map<String, dynamic> toJson() => {
    "idPlayer": idPlayer == null ? null : idPlayer,
    "playerName": playerName == null ? null : playerName,
    "totalGoals": totalGoals == null ? null : totalGoals,
    "penaltiesScored": penaltiesScored == null ? null : penaltiesScored,
    "penaltiesMissed": penaltiesMissed == null ? null : penaltiesMissed,
    "rank": rank == null ? null : rank,
  };
}
