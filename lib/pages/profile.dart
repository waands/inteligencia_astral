import 'package:inteligencia_astral/components/calendarU.dart';
import 'package:inteligencia_astral/components/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:inteligencia_astral/theme.dart';
import 'package:inteligencia_astral/components/time_picker.dart';
import 'package:inteligencia_astral/components/switch.dart';
import 'package:inteligencia_astral/components/calendarU.dart';
import 'package:csc_picker/csc_picker.dart';

class Profile extends StatelessWidget {
  void editName() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inteligencia Astral'),
          backgroundColor: AppTheme.colors.purpura,
        ),
        drawer: const NavMenu(),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppTheme.colors.purpura, AppTheme.colors.roxo2],
            )),
            child: SafeArea(
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                  //Nome
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Gustavo Lorenzo",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        WidgetSpan(
                          child: IconButton(
                              onPressed: editName,
                              icon: const Icon(Icons.edit_note,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: AppTheme.colors.white,
                      thickness: 2,
                    ),
                  ),
                  const SizedBox(height: 25),

                  //Notificações
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Notificações diárias',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          SwitchExample(),
                        ]),
                  ),
                  MyTime(),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: AppTheme.colors.white,
                      thickness: 2,
                    ),
                  ),
                  const SizedBox(height: 25),

                  //Data de nascimento
                  const Text(
                    "Data de nascimento",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),

                  MyCalendar(
                    hintText: 'Selecione a data',
                    onDateSelected: (DateTime selectedDate) {
                      String formattedDate = "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                      debugPrint("[data de nascimento]:  $formattedDate");
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: AppTheme.colors.white,
                      thickness: 2,
                    ),
                  ),
                  const SizedBox(height: 25),

                  //Horário de nascimento
                  const Text(
                    "Horário de nascimento",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),

                  const MyTime(),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: AppTheme.colors.white,
                      thickness: 2,
                    ),
                  ),
                  const SizedBox(height: 25),

                  //Local de nascimento
                  const Text(
                    "Local de nascimento",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: CSCPicker(
                      flagState: CountryFlag.DISABLE,
                      countryDropdownLabel: "País",
                      stateDropdownLabel: "Estado",
                      cityDropdownLabel: "Cidade",
                      onCountryChanged: (country) {},
                      onStateChanged: (state) {},
                      onCityChanged: (city) {},
                      searchBarRadius: 5,
                      dropdownDecoration: BoxDecoration(
                        color: const Color.fromARGB(255, 126, 111, 195),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      disabledDropdownDecoration: BoxDecoration(
                        color: Color.fromARGB(255, 50, 17, 65),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      selectedItemStyle: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: AppTheme.colors.white,
                      thickness: 2,
                    ),
                  ),
                  //imagem mapa astral
                ])))));
  }
}
