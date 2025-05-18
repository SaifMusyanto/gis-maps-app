import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/core/styles.dart';
import 'package:gis_maps_app/features/dashboard/views/choropleth_map_page.dart';
import 'package:gis_maps_app/features/dashboard/views/pin_map_page.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:gis_maps_app/routes/router.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _onToggleChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    ChoroplethMapPage(),
    PinMapPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        color: Colors.white,
        child: ToggleButtons(
          isSelected: [_selectedIndex == 0, _selectedIndex == 1],
          onPressed: (index) {
            _onToggleChanged(index);
          },
          borderRadius: BorderRadius.circular(20),
          selectedColor: Colors.white,
          fillColor: Colors.blue,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.map, size: 24), // Choropleth
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.place, size: 24), // Pin map
            ),
          ],
        ),
      ),
    );
  }
}
