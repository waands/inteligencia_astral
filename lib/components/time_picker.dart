import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

class MyTime extends StatefulWidget {
  const MyTime({Key? key}) : super(key: key);

  @override
  State<MyTime> createState() => _MyTimeState();
}

class _MyTimeState extends State<MyTime> {
  Time _time = Time(hour: 11, minute: 30, second: 20);

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }

  void openTimePicker() {
    Navigator.of(context).push(
      showPicker(
        context: context,
        value: _time,
        sunrise: TimeOfDay(hour: 6, minute: 0), // optional
        sunset: TimeOfDay(hour: 18, minute: 0), // optional
        duskSpanInMinutes: 120, // optional
        accentColor: Colors.purple,
        onChange: onTimeChanged,
        onChangeDateTime: (DateTime dateTime) {
          // print(dateTime);
          String formattedTime = "${dateTime.hour}:${dateTime.minute}";
          debugPrint("[horario de nascimento]:  $formattedTime");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: openTimePicker,
        child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 126, 111, 195),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                "${_time}".split('(')[1].split(')')[0],
                style: TextStyle(color: Colors.white),
              ),
            )));
  }
}
