import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/routes/router.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:csv/csv.dart';
import 'dart:async';

import '../models/faskes_model.dart';

@RoutePage()
class PinpointMapPage extends StatefulWidget {
  const PinpointMapPage({super.key});

  @override
  State<PinpointMapPage> createState() => _PinpointMapPageState();
}

class _PinpointMapPageState extends State<PinpointMapPage> {
  GoogleMapController? _mapController;
  List<FaskesModel> _locations = [];
  Set<Marker> _markers = {};
  bool _isLoading = true;
  final String _mapStyle = '''
  [
    {
      "featureType": "poi",
      "stylers": [
        { "visibility": "off" }
      ]
    }
  ]
  ''';

  static const CameraPosition _surabayaPosition = CameraPosition(
    target: LatLng(-7.2575, 112.7521),
    zoom: 12,
  );

  @override
  void initState() {
    super.initState();
    _loadCsvData();
  }

  Future<void> _loadCsvData() async {
    try {
      final String data = await rootBundle.loadString('assets/core/faskes_coordinates.csv');
      List<List<dynamic>> csvTable = const CsvToListConverter().convert(data, shouldParseNumbers: false);

      if (csvTable.isNotEmpty) {
        csvTable = csvTable.sublist(1);
      }

      List<FaskesModel> validLocations = [];

      for (var row in csvTable) {
        if (row.length >= 6 &&
            row[4] != null &&
            row[5] != null &&
            row[4].toString().isNotEmpty &&
            row[5].toString().isNotEmpty) {
          try {
            double lat = double.parse(row[4].toString());
            double lng = double.parse(row[5].toString());

            validLocations.add(FaskesModel(
              district: row[0].toString(),
              type: row[1].toString(),
              provider: row[2].toString(),
              name: row[3].toString(),
              latitude: lat,
              longitude: lng,
            ));
          } catch (e) {
            print('Error parsing coordinates for ${row[3]}: $e');
          }
        }
      }

      setState(() {
        _locations = validLocations;
        _createMarkers();
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading CSV data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _createMarkers() {
    _markers = _locations.map((location) {
      return Marker(
        markerId: MarkerId(location.name),
        position: LatLng(location.latitude, location.longitude),
        infoWindow: InfoWindow(
          title: location.name,
          snippet: '${location.type} - ${location.provider}',
        ),
        onTap: () => _onMarkerTapped(location),
      );
    }).toSet();
  }

  Set<Marker> _createMarkersWithTap() {
    return _locations.map((location) {
      return Marker(
        markerId: MarkerId(location.name),
        position: LatLng(location.latitude, location.longitude),
        infoWindow: InfoWindow(
          title: location.name,
          snippet: '${location.type} - ${location.provider}',
          onTap: () => _onMarkerTapped(location),
        ),
      );
    }).toSet();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onMarkerTapped(FaskesModel location) {
    context.router.push(CoordinateDetailRoute(location: location));
  }

  Future<void> _openFilterScreen() async {
    final FaskesModel? selectedLocation = await context.router.push(MapFilterRoute(locations: _locations));

    if (selectedLocation != null) {
      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(selectedLocation.latitude, selectedLocation.longitude),
          16.0,
        ),
      );

      Future.delayed(const Duration(milliseconds: 500), () {
        _onMarkerTapped(selectedLocation);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koordinat Fasilitas Kesehatan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _isLoading ? null : _openFilterScreen,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: _surabayaPosition,
                    markers: _createMarkersWithTap(),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    style: _mapStyle,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Menampilkan ${_markers.length} fasilitas kesehatan di Kota Surabaya',
                    style: context.textTheme.labelLarge?.copyWith(color: AppColors.grey50),
                  ),
                ),
              ],
            ),
    );
  }
}
