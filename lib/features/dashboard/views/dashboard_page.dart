import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/core/styles.dart';
import 'package:gis_maps_app/features/dashboard/views/choropleth_map_page.dart';
import 'package:gis_maps_app/l10n/l10n.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:gis_maps_app/routes/router.dart';

import '../../pinpoint_map/views/pinpoint_map_page.dart';

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
    PinpointMapPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(2, (index) {
                    final isSelected = _selectedIndex == index;
                    return GestureDetector(
                      onTap: () => _onToggleChanged(index),
                      child: AnimatedContainer(
                        height: 52,
                        width: MediaQuery.of(context).size.width / 4,
                        duration: Duration(milliseconds: 250),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          index == 0 ? Icons.map : Icons.place,
                          color: isSelected ? Colors.white : Colors.blue,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
