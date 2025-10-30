import 'package:hive_flutter/hive_flutter.dart';
import 'package:week_6/features/home/data/models/all_movies_model.dart';

class HiveCacheAdapters {
  static void registerAdapters() {
    // Register all Hive type adapters
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(AllMoviesModelAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(MovieModelAdapter());
    }
  }

  /// Initialize Hive with Flutter
  static Future<void> init() async {
    await Hive.initFlutter();
    registerAdapters();
  }
}
