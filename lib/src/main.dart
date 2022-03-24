import 'package:flutter/material.dart';

import '../platform_view_virtual.dart';
import 'platform_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 200,
              height: 100,
              child: PlatformWidget(),
            ),
            StreamBuilder<int>(
              stream: const PlatformService().eventChannel(),
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : 'no data');
              },
            ),
          ],
        ),
      ),
    );
  }
}