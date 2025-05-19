import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:latlong2/latlong.dart';
import 'package:geojson_vi/geojson_vi.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'dart:convert';

@RoutePage()
class ChoroplethMapPage extends StatefulWidget {
  const ChoroplethMapPage({super.key});

  @override
  State<ChoroplethMapPage> createState() => _ChoroplethMapPageState();
}

class _ChoroplethMapPageState extends State<ChoroplethMapPage> {
  List<Polygon> _polygons = [];
  Map<String, double> _districtRatios = {};
  double? _maxRatio;
  double? _minRatio;
  LatLng? _tapPosition;
  String? _selectedDistrict;
  double? _selectedRatio;

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

    final rows = const CsvToListConverter().convert(csvData);

    for (int i = 1; i < rows.length; i++) {
      final row = rows[i];
      if (row.length >= 4) {
        final district = row[0].toString().trim();
        final ratio =
            row[3] is double ? row[3] : double.tryParse(row[3].toString()) ?? 0;
        _districtRatios[district] = ratio;
      }
    }

    if (_districtRatios.isNotEmpty) {
      _maxRatio = _districtRatios.values.reduce((a, b) => a > b ? a : b);
      _minRatio = _districtRatios.values.reduce((a, b) => a < b ? a : b);
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
        final polygons = <Polygon>[];

        for (final feature in featureCollection.features) {
          final geometry = feature?.geometry;
          final properties = feature?.properties;

          final geoJsonName = properties?['district']?.toString() ??
              properties?['village']?.toString() ??
              '';

          final csvName = _nameMapping.entries
              .firstWhere(
                (entry) => geoJsonName.contains(entry.key),
                orElse: () => MapEntry('', ''),
              )
              .value;

          final ratio = csvName.isNotEmpty ? _districtRatios[csvName] ?? 0 : 0;
          final color = _getColorForRatio(ratio.toDouble());

          if (geometry is GeoJSONPolygon) {
            final coords = geometry.coordinates.first
                .map((p) => LatLng(p[1], p[0]))
                .toList();

            polygons.add(
              Polygon(
                points: coords,
                color: color.withOpacity(0.7),
                borderColor: Colors.blueAccent,
                borderStrokeWidth: 1.0,
                isFilled: true,
                label: '$csvName\n${ratio.toStringAsFixed(1)}',
                labelStyle: const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          if (geometry is GeoJSONMultiPolygon) {
            for (final polygon in geometry.coordinates) {
              final coords =
                  polygon.first.map((p) => LatLng(p[1], p[0])).toList();

              polygons.add(
                Polygon(
                  points: coords,
                  color: color.withOpacity(0.7),
                  borderColor: Colors.black,
                  borderStrokeWidth: 1.0,
                  isFilled: true,
                  label: '$csvName\n${ratio.toStringAsFixed(1)}',
                  labelStyle: const TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
          }
        }

        setState(() {
          _polygons = polygons;
        });
      } else {
        print('Failed to load GeoJSON: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading GeoJSON: $e');
    }
  }

  Color _getColorForRatio(double ratio) {
    if (_maxRatio == null || _minRatio == null || _maxRatio == _minRatio) {
      return Colors.grey;
    }
    final normalized = (ratio - _minRatio!) / (_maxRatio! - _minRatio!);
    return Color.lerp(Colors.green, Colors.red, normalized)!;
  }

  LatLng? _currentCenter;
  String _coordinatesText = "Lat/Lng: -";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: const LatLng(-7.2575, 112.7521),
              initialZoom: 11.5,
              onTap: (tapPosition, latLng) {
                setState(() {
                  _tapPosition = latLng;
                  // For demo, we'll just show the coordinates
                  // In a real app, you would determine which district was tapped
                  _selectedDistrict =
                      '${latLng.latitude.toStringAsFixed(6)}, ${latLng.longitude.toStringAsFixed(6)}';
                  _selectedRatio =
                      null; // You would calculate this based on the tapped district
                });
              },
              onPositionChanged: (position, hasGesture) {
                setState(() {
                  _currentCenter = position.center;
                  _coordinatesText =
                      "Lat/Lng: ${_currentCenter!.latitude.toStringAsFixed(6)}, ${_currentCenter!.longitude.toStringAsFixed(6)}";
                });
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              if (_polygons.isNotEmpty)
                PolygonLayer(
                  polygons: _polygons,
                ),
              // Marker for tapped position
              if (_tapPosition != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _tapPosition!,
                      width: 40,
                      height: 40,
                      child: const Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'Population per Health Facility Ratio',
                    textStyle: const TextStyle(
                      backgroundColor: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const TextSourceAttribution(
                    'Green: Low ratio (better) | Red: High ratio (worse)',
                    textStyle: TextStyle(
                      backgroundColor: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Coordinate display bar
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 52,
                width: 364,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                        if (_currentCenter != null) {
                          final coordinates =
                              '${_currentCenter!.latitude.toStringAsFixed(6)}, ${_currentCenter!.longitude.toStringAsFixed(6)}';
                          Clipboard.setData(ClipboardData(text: coordinates));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('Coordinates copied: $coordinates')),
                          );
                        }
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
          // In your Stack widget, replace the existing Positioned widget for the info container with:

          // Replace the existing Positioned widget for the info container with:

          if (_tapPosition != null && _selectedDistrict != null)
            Positioned(
              left: 16,
              right: 16,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Calculate position using OverlayEntry approach
                  final renderBox = context.findRenderObject() as RenderBox?;
                  if (renderBox == null) return Container();

                  final mapState = MapCamera.maybeOf(context);
                  if (mapState == null) return Container();

                  final screenPosition = mapState.project(_tapPosition!);
                  final offset = renderBox.globalToLocal(
                    Offset(screenPosition.x, screenPosition.y),
                  );

                  // Position the container below the pin (40px height + 10px padding)
                  final topPosition = offset.dy + 50;
                  final maxHeight =
                      constraints.maxHeight - 200; // Leave some margin

                  return Transform.translate(
                    offset: Offset(0, topPosition.clamp(0.0, maxHeight)),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_pin, color: Colors.red),
                              const SizedBox(width: 8),
                              Text(
                                _selectedDistrict!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          if (_selectedRatio != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                'Population per facility: ${_selectedRatio!.toStringAsFixed(1)}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
