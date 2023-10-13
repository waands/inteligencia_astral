import 'package:flutter/material.dart';
import '/theme.dart';

class MyCalendar extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final String hintText;
  const MyCalendar({Key? key, required this.hintText, required this.onDateSelected})
      : super(key: key);

  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime? selectedDate;

  void openDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
      return Theme(
      data: ThemeData(
        primarySwatch: Colors.purple, // Cor do cabeçalho do calendário
        splashColor: AppTheme.colors.green, // Cor dos elementos interativos, como botões
      ),
      child: child!,
    );
  },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });

      widget.onDateSelected(pickedDate); // Chame a função de retorno de chamada com a data selecionada
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openDatePicker,
      child: Container(
        padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 126, 111, 195),
            borderRadius: BorderRadius.circular(4),
          ),
        child: Center(
          child: Text(
            selectedDate != null
                ? "${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}"
                : widget.hintText,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
