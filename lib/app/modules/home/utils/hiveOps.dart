import 'package:hive/hive.dart';

class HiveOps {
  static dynamic openBox(String boxName) async {
    await Hive.openBox(boxName);
  }

  static dynamic getHiveBoxData(String boxName, String key) async {
    return await Hive.box(boxName).get(key);
  }

  static dynamic putHiveBoxData(
      String boxName, String key, dynamic value) async {
    await Hive.box(boxName).put(key, value);
  }
}
