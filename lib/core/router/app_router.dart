import 'package:flutter/material.dart';
import 'package:nour_elbachir_hackathon/core/router/routes.dart';
import 'package:nour_elbachir_hackathon/core/widget/circle_progress_indicator.dart';
import 'package:nour_elbachir_hackathon/core/widget/error_message.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      default:
        return null;
    }
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>
                    ErrorMessage.show(context, 'Something went wrong!'),

                child: const Text('Tap me'),
              ),
            ),
          ),
          CircleProgressIndicator(color: Colors.blue, size: 60, strokeWidth: 6),
        ],
      ),
    );
  }
}
