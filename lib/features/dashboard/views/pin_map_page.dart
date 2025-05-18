import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PinMapPage extends StatelessWidget {
  const PinMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Choropleth Pin Map',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
