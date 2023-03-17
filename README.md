Simple Todo App
===============

A simple Todo app built with Flutter and GetX, demonstrating clean architecture and best practices.

Overview
--------

This project is a basic Todo app that allows users to create and manage their tasks. It follows clean architecture principles and uses GetX for state management and dependency injection.

Features
--------

*   Create new tasks
*   Mark tasks as complete/incomplete
*   Delete tasks
*   Persistent storage
*   Clean architecture
*   Unit tests

Packages Used
-------------

*   [GetX](https://pub.dev/packages/get): State management, dependency injection, and navigation
*   [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage): Secure storage for todos
*   [Mocktail](https://pub.dev/packages/mocktail): Mocking library for testing

Architecture Structure
----------------------

The project follows a clean architecture structure and is organized into the following main directories:
```simple_todo_app/
├───lib/
│   ├───core/
│   │   ├───constants/
│   │   ├───utils/
│   │   └───extensions/
│   │───infrastructure/
│   │   ├───data/
│   │   │   │   └───local_todo_data_source.dart
│   │   │   └───repositories/
│   │   │       ├───todo_repository_impl.dart
│   │   │       └───todo_repository.dart
│   │   └───navigation/
│   │        └───routes.dart
│   ├───domain/
│   │   ├───entities/
│   │   │   └───todo_model.dart
│   │   └───uses_cases/
│   │       ├───add_todo_use_case.dart
│   │       ├───get_todo_use_case.dart
│   │       ├───save_todos_use_case.dart
│   │       └───toggle_complete_todo_use_case.dart
│   └───presentation/
│       ├───bindings/
│       │   └───todo_bindings.dart
│       ├───controllers/
│       │   ├───loading.controller.dart
│       │   └───todo.controller.dart
│       ├───pages/
│       │   ├───home_page.dart
│       │   └───main.dart
│       └───widgets/
│           └───todo_list_item_widget.dart
├───test/
│   └───todo_controller_test.dart
├───pubspec.yaml
└───README.md 
```


*   `domain`: Contains entities, use cases, and repository interfaces
*   `data`: Contains repository implementations and data sources
*   `presentation`: Contains UI-related code, including widgets, controllers, and views
*   `core`: Contains utility classes, constants, and other shared code
*   `infrastructure`: Contains data, and navigation code



The app uses the following use cases:

*   `AddTodoUseCase`: Add a new task to the list
*   `GetTodosUseCase`: Retrieve all tasks from storage
*   `SaveTodosUseCase`: Save all tasks to storage
*   `ToggleCompleteTodoUseCase`: Mark a task as complete/incomplete

How to Run the App
------------------

1.  Clone the repository:

bashCopy code

`git clone https://github.com/yourusername/simple_todo_app.git`

2.  Change directory to the project root:

bashCopy code

`cd simple_todo_app`

3.  Install dependencies:

csharpCopy code

`flutter pub get`

4.  Run the app on an emulator or a physical device:

Copy code

`flutter run`

Contributing
------------

Feel free to contribute to this project by opening issues, submitting pull requests, or providing feedback. Your contributions are always welcome!