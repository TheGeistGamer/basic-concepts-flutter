import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls Screen'),
      ),
      body: const _UIControllsView(),
    );
  }
}

class _UIControllsView extends StatefulWidget {
  const _UIControllsView();

  @override
  State<_UIControllsView> createState() => _UIControllsViewState();
}

enum Transportation { car, bike, bus, train }

class _UIControllsViewState extends State<_UIControllsView> {
  bool isDeveloper = true;
  Transportation selectTransportation = Transportation.car;

  bool wantsBreakFast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
            value: isDeveloper,
            title: const Text('Developer Mode'),
            subtitle: const Text('Controlers adicionales'),
            onChanged: (value) => setState(() => isDeveloper = !isDeveloper)),
        ExpansionTile(
          title: const Text('Vehicle Transportation'),
          subtitle: Text('$selectTransportation'),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por Carro'),
              value: Transportation.car,
              groupValue: selectTransportation,
              onChanged: (value) =>
                  setState(() => selectTransportation = Transportation.car),
            ),
            RadioListTile(
              title: const Text('By Bike'),
              subtitle: const Text('Viajar por Bicicleta'),
              value: Transportation.bike,
              groupValue: selectTransportation,
              onChanged: (value) =>
                  setState(() => selectTransportation = Transportation.bike),
            ),
            RadioListTile(
              title: const Text('By Train'),
              subtitle: const Text('Viajar por Tren'),
              value: Transportation.train,
              groupValue: selectTransportation,
              onChanged: (value) =>
                  setState(() => selectTransportation = Transportation.train),
            ),
            RadioListTile(
              title: const Text('By Bus'),
              subtitle: const Text('Viajar por Bus'),
              value: Transportation.bus,
              groupValue: selectTransportation,
              onChanged: (value) =>
                  setState(() => selectTransportation = Transportation.bus),
            ),
          ],
        ),
        CheckboxListTile(
          value: wantsBreakFast,
          onChanged: (value) =>
              setState(() => wantsBreakFast = !wantsBreakFast),
          title: const Text('Breakfast'),
          subtitle: const Text('Desayuno'),
        ),
        CheckboxListTile(
          value: wantsLunch,
          onChanged: (value) => setState(() => wantsLunch = !wantsLunch),
          title: const Text('Breakfast'),
          subtitle: const Text('Desayuno'),
        ),
        CheckboxListTile(
          value: wantsDinner,
          onChanged: (value) => setState(() => wantsDinner = !wantsDinner),
          title: const Text('Breakfast'),
          subtitle: const Text('Desayuno'),
        ),
      ],
    );
  }
}
