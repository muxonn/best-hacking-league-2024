class CurrentUser {
  final String name;
  final int points;
  final String currentPosture;
  final double goodTime;
  final double badTime;
  final double breakTime;

  CurrentUser({
    this.name = "user",
    required this.points,
    required this.currentPosture,
    required this.goodTime,
    required this.badTime,
    required this.breakTime,
  });

  factory CurrentUser.fromJson(Map<String, dynamic> json) {
    return CurrentUser(
      name: json['name'] ?? "user",
      points: json['points'] ?? 60,
      currentPosture: json['measurements']?.first['posture'] ?? "",
      goodTime: json['goodTime'] ?? 40.0,
      badTime: json['badTime'] ?? 20.0,
      breakTime: json['breakTime'] ?? 10.0,
    );
  }
}
