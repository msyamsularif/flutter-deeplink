import 'package:flutter/material.dart';
import 'package:flutter_deeplink_example/error_page.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(
      MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );

/// This handles '/' and '/details'.
///
/// When the path is not found it will redirect to the ErrorPage
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: [
        GoRoute(
          path: 'details',
          builder: (_, __) => Scaffold(
            appBar: AppBar(title: const Text('Details Screen')),
          ),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const ErrorPage(),
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
