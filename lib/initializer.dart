// import '/config.example.dart';
// import '/domain/core/utils/snackbar.util.dart';
// import '/infrastructure/navigation/bindings/domains/auth.repository.binding.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simple_todo_app/config.dart';
import 'package:logger/logger.dart';

import 'domain/core/constants/storage.constants.dart';
import 'domain/core/utils/snackbar.util.dart';
// import 'infrastructure/navigation/routes.dart';

import 'presentation/controllers/loading.controller.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await _initStorage();
      _initGlobalLoading();
      _initScreenPreference();
    } catch (err) {
      rethrow;
    }
  }

  static void _initGlobalLoading() {
    final loading = LoadingController();
    Get.put(loading);
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
    Get.put(GetStorage());
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
