class Todo {
  String id = "00000000-0000-0000-0000-000000000000";
  String taskName = "";
  int taskSort = 0;
  String createdDt = "0001-01-01T00:00:00";
  String dueDt = "0001-01-01T00:00:00";
  bool isCompleted = false;
  bool isArchived = false;
  String? todoCategoryId;
  String? todoPriorityId;
  String syncDt = "0001-01-01T00:00:00";

  Todo();

  fromJson(Map<String, dynamic> responseData) {
    id = responseData["id"];
    taskName = responseData["taskName"];
    taskSort = responseData["taskSort"];
    createdDt = responseData["createdDt"];
    dueDt = responseData["dueDt"];
    isCompleted = responseData["isCompleted"];
    isArchived = responseData["isArchived"];
    todoCategoryId = responseData["todoCategoryId"];
    todoPriorityId = responseData["todoPriorityId"];
    syncDt = responseData["syncDt"];
  }

  Map toJson() => {
        'id': id,
        'taskName': taskName,
        'taskSort': taskSort,
        'createdDt': createdDt,
        'dueDt': dueDt,
        'isCompleted': isCompleted,
        'isArchived': isArchived,
        'todoCategoryId': todoCategoryId,
        'todoPriorityId': todoPriorityId,
        'syncDt': syncDt,
      };

  bool haveId() {
    return id != "00000000-0000-0000-0000-000000000000";
  }
}
