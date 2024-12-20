import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    required this.settings,
    required this.onSettingsChanged,
  });

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      } as ValueChanged<bool>,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferências'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Glutem',
                  'Somente refeições sem glutem',
                  settings.isGlutenFree,
                  (value) => setState(
                    () {
                      settings.isGlutenFree = value;
                    },
                  ),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Somente refeições sem Lactose',
                  settings.isLactoseFree,
                  (value) => setState(
                    () {
                      settings.isLactoseFree = value;
                    },
                  ),
                ),
                _createSwitch(
                  'Vegano',
                  'Somente refeições veganas',
                  settings.isVegan,
                  (value) => setState(
                    () {
                      settings.isVegan = value;
                    },
                  ),
                ),
                _createSwitch(
                  'Vegetariano',
                  'Somente refeições vegetagianas',
                  settings.isVegetarian,
                  (value) => setState(
                    () {
                      settings.isVegetarian = value;
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
