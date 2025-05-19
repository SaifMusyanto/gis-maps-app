import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:gis_maps_app/widgets/custom_dropdown_field.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../core/app_colors.dart';
import '../models/faskes_model.dart';

@RoutePage()
class MapFilterPage extends StatefulWidget {
  final List<FaskesModel> locations;

  const MapFilterPage({super.key, required this.locations});

  @override
  State<MapFilterPage> createState() => _MapFilterPageState();
}

class _MapFilterPageState extends State<MapFilterPage> {
  List<String> _districts = [];
  List<String> _facilityTypes = [];
  String? _selectedDistrict;
  String? _selectedType;

  @override
  void initState() {
    super.initState();
    _extractFilters();
  }

  void _extractFilters() {
    _districts = widget.locations
        .map((loc) => loc.district)
        .toSet()
        .toList()
      ..sort();

    _facilityTypes = widget.locations
        .map((loc) => loc.type)
        .toSet()
        .toList()
      ..sort();
  }

  List<FaskesModel> get filteredLocations {
    return widget.locations.where((loc) {
      bool matchesDistrict = _selectedDistrict == null || loc.district == _selectedDistrict;
      bool matchesType = _selectedType == null || loc.type == _selectedType;
      return matchesDistrict && matchesType;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Filter Lokasi'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: _buildDistrictDropdown(),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTypeDropdown(),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLocations.length,
              itemBuilder: (context, index) {
                final location = filteredLocations[index];
                return ListTile(
                  title: Text(location.name, style: context.textTheme.titleLarge),
                  subtitle: Text('${location.type} - ${location.district}', style: context.textTheme.bodySmall?.copyWith(color: AppColors.grey50)),
                  trailing: const Icon(IconsaxPlusLinear.arrow_right_3, size: 16, color: AppColors.grey50),
                  onTap: () {
                    Navigator.pop(context, location);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDistrictDropdown() {
    return CustomDropdownField(
      label: 'Kecamatan',
      value: _selectedDistrict,
      items: [
        const DropdownMenuItem<String>(
          value: null,
          child: Text('Semua Kecamatan'),
        ),
        ..._districts.map((district) => DropdownMenuItem<String>(
          value: district,
          child: Text(district),
        )),
      ],
      onChanged: (value) {
        setState(() {
          _selectedDistrict = value?.toString();
        });
      },
    );
  }

  Widget _buildTypeDropdown() {
    return CustomDropdownField(
      label: 'Jenis Fasilitas',
      value: _selectedType,
      items: [
        const DropdownMenuItem<String>(
          value: null,
          child: Text('Semua Fasilitas'),
        ),
        ..._facilityTypes.map((type) => DropdownMenuItem<String>(
          value: type,
          child: Text(type),
        )),
      ],
      onChanged: (value) {
        setState(() {
          _selectedType = value?.toString();
        });
      },
    );
  }
}
