class Priority {
  String id = "00000000-0000-0000-0000-000000000000";
  String appUserId = "00000000-0000-0000-0000-000000000000";
  String priorityName = "";
  int prioritySort = 0;
  String syncDt = "0001-01-01T00:00:00";

  Priority();

  fromJson(Map<String, dynamic> responseData) {
    id = responseData["id"];
    appUserId = responseData["appUserId"];
    priorityName = responseData["priorityName"];
    prioritySort = responseData["prioritySort"];
    syncDt = responseData["syncDt"];
  }

  Map toJson() => {
        'id': id,
        'appUserId': appUserId,
        'priorityName': priorityName,
        'prioritySort': prioritySort,
        'syncDt': syncDt,
      };
}
