import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChoroplethMapPage extends StatelessWidget {
  const ChoroplethMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Choropleth Map Page',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
