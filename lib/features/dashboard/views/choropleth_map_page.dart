import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:geojson_vi/geojson_vi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:sizer/sizer.dart';

@RoutePage()
class ChoroplethMapPage extends StatefulWidget {
  const ChoroplethMapPage({super.key});

  @override
  State<ChoroplethMapPage> createState() => _ChoroplethMapPageState();
}

class _ChoroplethMapPageState extends State<ChoroplethMapPage> {
  GoogleMapController? _mapController;
  final Set<Polygon> _polygons = {};
  final Set<Marker> _markers = {};
  Map<String, double> _districtRatios = {};
  double? _maxRatio;
  double? _minRatio;
  LatLng? _tapPosition;
  String? _selectedDistrict;
  double? _selectedRatio;
  LatLng _initialPosition = const LatLng(-7.2575, 112.7521);
  String _coordinatesText = "Lat/Lng: -";

  // Mapping between GeoJSON names and CSV names
  final Map<String, String> _nameMapping = {
    'Asemrowo': 'Asemrowo',
    'Benowo': 'Benowo',
    'Bubutan': 'Bubutan',
    'Bulak': 'Bulak',
    'Dukuh Pakis': 'Dukuh Pakis',
    'Gayungan': 'Gayungan',
    'Genteng': 'Genteng',
    'Gubeng': 'Gubeng',
    'Gunung Anyar': 'Gunung Anyar',
    'Jambangan': 'Jambangan',
    'Karangpilang': 'Karangpilang',
    'Kenjeran': 'Kenjeran',
    'Krembangan': 'Krembangan',
    'Lakarsantri': 'Lakarsantri',
    'Mulyorejo': 'Mulyorejo',
    'Pabean Cantian': 'Pabean Cantian',
    'Pakal': 'Pakal',
    'Rungkut': 'Rungkut',
    'Semampir': 'Semampir',
    'Sukolilo': 'Sukolilo',
    'Sambikerep': 'Sambikerep',
    'Sawahan': 'Sawahan',
    'Sukomanunggal': 'Sukomanunggal',
    'Simokerto': 'Simokerto',
    'Tambaksari': 'Tambaksari',
    'Tandes': 'Tandes',
    'Tegalsari': 'Tegalsari',
    'Tenggilis Mejoyo': 'Tenggilis Mejoyo',
    'Wiyung': 'Wiyung',
    'Wonocolo': 'Wonocolo',
    'Wonokromo': 'Wonokromo',
  };

  // Map to store district boundaries for tap detection
  final Map<Polygon, Map<String, dynamic>> _polygonInfo = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _loadCsvData();
    await _loadGeoJsonFromUrl();
  }

  Future<void> _loadCsvData() async {
    const csvData = '''
district,jumlah_faskes,penduduk,rasio_penduduk_per_fasilitas
Asemrowo,3,47437,15812.33333
Benowo,17,71033,4178.411765
Bubutan,18,97707,5428.166667
Bulak,10,46350,4635
Darmo,1,,0
Dukuh Pakis,46,59293,1288.978261
Gayungan,29,43617,1504.034483
Genteng,38,58601,1542.131579
Gubeng,90,133900,1487.777778
Gunung Anyar,24,60535,2522.291667
Jambangan,16,53639,3352.4375
Karangpilang,17,74931,4407.705882
Kenjeran,22,177561,8070.954545
Krembangan,22,114674,5212.454545
Lakarsantri,30,63017,2100.566667
Mulyorejo,74,86824,1173.297297
Pabean Cantian,32,74810,2337.8125
Pakal,9,60877,6764.111111
Rungkut,62,120067,1936.564516
Semampir,27,181226,6712.074074
Sukolilo,58,113876,1963.37931
Sambikerep,30,66796,2226.533333
Sawahan,44,199548,4535.181818
Sukomanunggal,29,104271,3595.551724
Simokerto,21,92832,4420.571429
Tambaksari,49,226136,4615.020408
Tandes,27,91784,3399.407407
Tegalsari,48,98484,2051.75
Tenggilis Mejoyo,24,58695,2445.625
Wiyung,31,74224,2394.322581
Wonocolo,39,79559,2039.974359
Wonokromo,59,155559,2636.59322
''';

    // Manual parsing instead of using CsvToListConverter
    final lines = csvData.trim().split('\n');

    // Skip header row
    for (int i = 1; i < lines.length; i++) {
      final row = lines[i].split(',');
      if (row.length >= 4) {
        final district = row[0].trim();

        // Parse the ratio value
        final ratioStr = row[3].trim();
        double ratio = 0.0;

        if (ratioStr.isNotEmpty) {
          try {
            ratio = double.parse(ratioStr);
          } catch (e) {
            print('Failed to parse ratio for $district: $ratioStr - $e');
          }
        }

        // Store the ratio in the districtRatios map
        _districtRatios[district] = ratio;
      }
    }

    // Debug output
    print('Loaded district ratios:');
    _districtRatios.forEach((district, ratio) {
      print('$district: $ratio');
    });

    if (_districtRatios.isNotEmpty) {
      _maxRatio = _districtRatios.values.reduce((a, b) => a > b ? a : b);
      _minRatio = _districtRatios.values.reduce((a, b) => a < b ? a : b);
      print('Min ratio: $_minRatio, Max ratio: $_maxRatio');
    }
  }

  Future<void> _loadGeoJsonFromUrl() async {
    const geoJsonUrl =
        'https://raw.githubusercontent.com/JfrAziz/indonesia-district/refs/heads/master/id35_jawa_timur/id3578_kota_surabaya/id3578_kota_surabaya.geojson';

    try {
      final response = await http.get(Uri.parse(geoJsonUrl));
      if (response.statusCode == 200) {
        final featureCollection =
        GeoJSONFeatureCollection.fromJSON(response.body);
        final polygons = <Polygon>{};
        int polygonId = 0;

        for (final feature in featureCollection.features) {
          final geometry = feature?.geometry;
          final properties = feature?.properties;

          final geoJsonName = properties?['district']?.toString() ??
              properties?['village']?.toString() ??
              '';

          // Lookup the CSV name using the mapping
          final csvName = _nameMapping[geoJsonName] ?? '';

          // Get the ratio from the CSV data
          final ratio = csvName.isNotEmpty ? _districtRatios[csvName] ?? 0.0 : 0.0;

          // Debug the mapping
          print('GeoJSON Name: $geoJsonName, CSV Name: $csvName, Ratio: $ratio');

          final color = _getColorForRatio(ratio);

          if (geometry is GeoJSONPolygon) {
            final coords = geometry.coordinates.first
                .map((p) => LatLng(p[1], p[0]))
                .toList();

            final polygon = Polygon(
              polygonId: PolygonId('polygon_$polygonId'),
              points: coords,
              fillColor: color.withOpacity(0.7),
              strokeColor: Colors.blueAccent,
              strokeWidth: 1,
            );

            polygons.add(polygon);

            // Store district info for this polygon
            _polygonInfo[polygon] = {
              'name': csvName,
              'ratio': ratio,
            };

            // Add a marker for the polygon center (optional - for labels)
            if (coords.isNotEmpty) {
              final center = _calculatePolygonCenter(coords);
              _addDistrictMarker(center, csvName, ratio, 'marker_$polygonId');
            }

            polygonId++;
          }

          if (geometry is GeoJSONMultiPolygon) {
            for (final polygon in geometry.coordinates) {
              final coords =
              polygon.first.map((p) => LatLng(p[1], p[0])).toList();

              final googlePolygon = Polygon(
                polygonId: PolygonId('polygon_$polygonId'),
                points: coords,
                fillColor: color.withOpacity(0.7),
                strokeColor: Colors.black,
                strokeWidth: 1,
              );

              polygons.add(googlePolygon);

              // Store district info for this polygon
              _polygonInfo[googlePolygon] = {
                'name': csvName,
                'ratio': ratio,
              };

              // Add a marker for the polygon center (optional - for labels)
              if (coords.isNotEmpty) {
                final center = _calculatePolygonCenter(coords);
                _addDistrictMarker(center, csvName, ratio, 'marker_$polygonId');
              }

              polygonId++;
            }
          }
        }

        setState(() {
          _polygons.addAll(polygons);
        });
      } else {
        print('Failed to load GeoJSON: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading GeoJSON: $e');
    }
  }

  LatLng _calculatePolygonCenter(List<LatLng> points) {
    double latitude = 0;
    double longitude = 0;

    for (var point in points) {
      latitude += point.latitude;
      longitude += point.longitude;
    }

    return LatLng(
        latitude / points.length,
        longitude / points.length
    );
  }

  void _addDistrictMarker(LatLng position, String name, double ratio, String markerId) {
    if (name.isEmpty) return;

    final infoWindow = InfoWindow(
      title: name,
      snippet: ratio > 0 ? 'Penduduk Per Fasilitas: ${ratio.toStringAsFixed(1)}' : 'No data',
    );

    final marker = Marker(
      markerId: MarkerId(markerId),
      position: position,
      infoWindow: infoWindow,
      // Make the marker transparent but clickable
      alpha: 0.0,
    );

    setState(() {
      _markers.add(marker);
    });
  }

  Color _getColorForRatio(double ratio) {
    if (_maxRatio == null || _minRatio == null || _maxRatio == _minRatio) {
      return Colors.grey;
    }
    final normalized = (ratio - _minRatio!) / (_maxRatio! - _minRatio!);
    return Color.lerp(Colors.green, Colors.red, normalized)!;
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    // You can customize the map style here
    _setMapStyle(controller);
  }

  Future<void> _setMapStyle(GoogleMapController controller) async {
    // Optional: Load a custom map style
    try {
      // You would typically load this from a JSON file
      const mapStyle = '''
      [
        {
          "featureType": "administrative",
          "elementType": "geometry",
          "stylers": [
            {
              "visibility": "off"
            }
          ]
        },
        {
          "featureType": "poi",
          "stylers": [
            {
              "visibility": "off"
            }
          ]
        }
      ]
      ''';
      await controller.setMapStyle(mapStyle);
    } catch (e) {
      print('Error setting map style: $e');
    }
  }

  void _onMapTap(LatLng position) {
    setState(() {
      _tapPosition = position;
      _selectedDistrict = '${position.latitude.toStringAsFixed(6)}, ${position.longitude.toStringAsFixed(6)}';
      _selectedRatio = null;

      // In a real app, you would determine which district was tapped
      // This approach is an approximation since Google Maps doesn't provide built-in
      // polygon hit testing
      _checkTappedDistrict(position);
    });

    // Add a marker at the tapped position
    _markers.removeWhere((marker) => marker.markerId.value == 'tapped_location');
    _markers.add(
      Marker(
        markerId: const MarkerId('tapped_location'),
        position: position,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
  }

  void _checkTappedDistrict(LatLng position) {
    // This is a simplified approach since Google Maps doesn't provide built-in point-in-polygon testing
    // For a production app, you might want to use a more sophisticated algorithm
    // or implement server-side geocoding against administrative boundaries

    // For now, we'll just show any InfoWindow that might be close
    _mapController?.showMarkerInfoWindow(const MarkerId('closest_district'));
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      _coordinatesText = "Lat/Lng: ${position.target.latitude.toStringAsFixed(6)}, ${position.target.longitude.toStringAsFixed(6)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 11.5,
            ),
            polygons: _polygons,
            markers: _markers,
            onTap: _onMapTap,
            onCameraMove: _onCameraMove,
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
          ),
          // Legend for choropleth colors
          Positioned(
            bottom: 88,
            left: 16,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Rasio Penduduk Per Fasilitas',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 4),
                      const Text('Rasio rendah (baik)', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 4),
                      const Text('Rasio tinggi (buruk)', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Coordinate display bar
          Positioned(
            top: 48,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 52,
                width: 364,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.blue),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _coordinatesText,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(IconsaxPlusLinear.copy),
                      onPressed: () {
                        final coordinates = _coordinatesText.replaceAll('Lat/Lng: ', '');
                        Clipboard.setData(ClipboardData(text: coordinates));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Coordinates copied: $coordinates')),
                        );
                      },
                      color: Colors.blue,
                      iconSize: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // District information card (shown when a district is tapped)
          // if (_tapPosition != null && _selectedDistrict != null)
          //   Positioned(
          //     bottom: 100,
          //     left: 16,
          //     right: 16,
          //     child: Container(
          //       padding: const EdgeInsets.all(16),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(12),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.black.withOpacity(0.2),
          //             blurRadius: 8,
          //             offset: const Offset(0, 4),
          //           ),
          //         ],
          //       ),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Row(
          //             children: [
          //               const Icon(Icons.location_pin, color: Colors.red),
          //               const SizedBox(width: 8),
          //               Expanded(
          //                 child: Text(
          //                   _selectedDistrict!,
          //                   style: const TextStyle(
          //                     fontSize: 16,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                   overflow: TextOverflow.ellipsis,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           if (_selectedRatio != null)
          //             Padding(
          //               padding: const EdgeInsets.only(top: 8),
          //               child: Text(
          //                 'Population per facility: ${_selectedRatio!.toStringAsFixed(1)}',
          //                 style: const TextStyle(fontSize: 14),
          //               ),
          //             ),
          //         ],
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}