import 'package:get/get.dart';
import 'package:simple_todo_app/presentation/bindings/todo_bindings.dart';

import '../../presentation/pages/pages.dart';
import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const TodoPage(),
      binding: TodoBindings(),
    ),
  ];
}
