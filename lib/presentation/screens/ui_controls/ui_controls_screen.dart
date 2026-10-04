import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: _UiControls(),
    );
  }
}

class _UiControls extends StatefulWidget {
  @override
  State<_UiControls> createState() => _UiControlsState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsState extends State<_UiControls> {
  bool isDriverActive = false;
  Transportation selectedTransportation = Transportation.car;

  void changeSwitchListTile(bool value) {
    isDriverActive = value;
    ScaffoldMessenger.of(context).clearSnackBars();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDriverActive,
          onChanged: (value) {
            changeSwitchListTile(value);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text(isDriverActive ? 'Activado' : 'Desactivado'),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          title: const Text('Driver activo'),
          subtitle: const Text('Lleva pasajeros'),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Medio de transporte',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              SegmentedButton<Transportation>(
                segments: const [
                  ButtonSegment(
                    value: Transportation.car,
                    label: Text('Auto'),
                    icon: Icon(Icons.directions_car_outlined),
                  ),
                  ButtonSegment(
                    value: Transportation.plane,
                    label: Text('Avión'),
                    icon: Icon(Icons.flight_outlined),
                  ),
                  ButtonSegment(
                    value: Transportation.boat,
                    label: Text('Barco'),
                    icon: Icon(Icons.directions_boat_outlined),
                  ),
                  ButtonSegment(
                    value: Transportation.submarine,
                    label: Text('Sub'),
                    icon: Icon(Icons.surfing_outlined),
                  ),
                ],
                selected: {selectedTransportation},
                onSelectionChanged: (Set<Transportation> newSelection) {
                  setState(() {
                    selectedTransportation = newSelection.first;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
