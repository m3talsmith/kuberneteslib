/// Represents Linux capabilities that can be added to a container.
class Capabilities {
  List<String>? add;
  List<String>? drop;

  Capabilities.fromMap(Map<String, dynamic> data) {
    if (data['add'] != null) {
      add = [];
      for (var e in data['add']) {
        add!.add(e);
      }
    }
    if (data['drop'] != null) {
      drop = [];
      for (var e in data['drop']) {
        drop!.add(e);
      }
    }
  }

  Map<String, dynamic> toMap() => {
        'add': add,
        'drop': drop,
      }..removeWhere(
          (key, value) => value == null,
        );
}
