
class Category  {
  String id = "00000000-0000-0000-0000-000000000000";
  String categoryName = "";
  int taskSort = 0;
  String syncDt = "0001-01-01T00:00:00";

  Category();

fromJson(Map<String, dynamic> responseData) {
    id = responseData["id"];
    categoryName = responseData["categoryName"];
    //taskSort = responseData["taskSort"];
    syncDt = responseData["syncDt"];
  }

  Map toJson() => {
        'id': id,
        'categoryName': categoryName,
        'taskSort': taskSort,
        'syncDt': syncDt,
      };
}
