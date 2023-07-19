import 'package:isar/isar.dart';

part 'list_collection.g.dart';

@collection
class ListCollection {
  Id id = Isar.autoIncrement;
  String name;
  List<String> tasks;
  List<bool> completeds;

  ListCollection({
    required this.name,
    required this.tasks,
    required this.completeds,
  });
}
