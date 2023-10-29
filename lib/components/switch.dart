import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchExample extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  const SwitchExample({Key? key, this.onChanged}) : super(key: key);

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _loadValue();
  }

  _loadValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _value = prefs.getBool('notificationsEnabled') ?? false;
    });
  }

  _saveValue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notificationsEnabled', value);
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _value,
      activeColor: const Color.fromARGB(255, 165, 225, 208),
      onChanged: (bool newValue) {
        setState(() {
          _value = newValue;
        });
        _saveValue(newValue);
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      },
    );
  }
}
