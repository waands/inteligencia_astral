import 'package:flutter/material.dart';
import 'package:inteligencia_astral/pages/login.dart';
import 'package:inteligencia_astral/components/text_field.dart';
import 'package:inteligencia_astral/components/my_buttom.dart';
import 'package:inteligencia_astral/components/calendar.dart';
import 'package:inteligencia_astral/components/time_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import '/theme.dart';



class Register2 extends StatelessWidget {
  Register2({super.key});
  final nicknameController = TextEditingController();
  final birthDateController = TextEditingController();
  final birthHourController = TextEditingController();
  final birthCityController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.colors.roxo1, AppTheme.colors.roxo2],
          )
        ),
      
      //backgroundColor: const Color.fromARGB(255, 68, 20, 88),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const SizedBox(height: 50),
            //logo
            Image.asset('lib/imgs/logo.png'),

            const SizedBox(height: 25),

            //Inteligencia Astral
            Text(
              "Inteligência Astral",
              style: TextStyle(color: AppTheme.colors.white, fontSize: 32),
            ),
            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(color: AppTheme.colors.white,
                             thickness: 2,
              ),
            ),

            const SizedBox(height: 25),

            //Apelido
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text(
                  "Como deseja ser chamado",
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),              
                ),
                ]
              )
            ),
            
            MyTextField(
              controller: nicknameController,
              hintText: '...',
              obscureText: false,
            ),
            const SizedBox(height: 20),

            //Data de nascimento
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text(
                  "Data de nascimento",
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),              
                ),
                ]
              )
            ),
            
            const Calendar(),   
            const SizedBox(height: 20),       

            //Horário de nascimento
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text(
                  "Horário de nascimento",
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),              
                ),
                ]
              )
            ),
            const MyTime(),
            const SizedBox(height: 20), 
            
            //Cidade de nascimento
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text(
                  "Em qual cidade você nasceu",
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),              
                ),
                ]
              )
            ),

            Padding(
              padding: const EdgeInsets.all(25),
              child: CSCPicker(
                flagState: CountryFlag.DISABLE,
                countryDropdownLabel: "País",
                stateDropdownLabel: "Estado",
                cityDropdownLabel: "Cidade",
                onCountryChanged: (country) { },
                onStateChanged:(state) { },
                onCityChanged:(city) { },
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

            const SizedBox(height: 20), 

            //Registrar 2/2
            MyButtom(
              Texto: '2/2   REGISTRAR', 
              onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Login(),
                  ));
                  }
            ),
            const SizedBox(height: 10),
            
            ]
          ),
        ),
      ),
    )
  );

  }

}
