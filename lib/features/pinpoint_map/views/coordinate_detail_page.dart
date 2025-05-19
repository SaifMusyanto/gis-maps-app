import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gis_maps_app/core/app_colors.dart';
import 'package:gis_maps_app/util/extensions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../models/faskes_model.dart';

@RoutePage()
class CoordinateDetailPage extends StatefulWidget {
  final FaskesModel location;
  
  const CoordinateDetailPage({super.key, required this.location});

  @override
  State<CoordinateDetailPage> createState() => _CoordinateDetailPageState();
}

class _CoordinateDetailPageState extends State<CoordinateDetailPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.location.name),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(widget.location.latitude, widget.location.longitude),
                  zoom: 16,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId(widget.location.name),
                    position: LatLng(widget.location.latitude, widget.location.longitude),
                  ),
                },
                scrollGesturesEnabled: false,
                zoomControlsEnabled: false,
                zoomGesturesEnabled: false,
                style: _mapStyle,
              ),
            ),
          ),
          Expanded(flex: 2, child: _buildInfoCard()),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          border: Border.all(color: AppColors.grey10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Nama', widget.location.name),
            const Divider(),
            _buildInfoRow('Jenis Fasilitas', widget.location.type),
            const Divider(),
            _buildInfoRow('Penyelenggara', widget.location.provider),
            const Divider(),
            _buildInfoRow('District', widget.location.district),
            const Divider(),
            _buildInfoRow('Coordinates', '${widget.location.latitude}, ${widget.location.longitude}'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: context.textTheme.titleSmall,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: context.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }}
