import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PinMapPage extends StatelessWidget {
  const PinMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choropleth Map'),
      ),
      body: Center(
        child: Text(
          'Choropleth Map Page',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
