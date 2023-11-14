import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:inteligencia_astral/backend/authentication.dart';
import 'package:inteligencia_astral/backend/dataHandler.dart';
import 'package:inteligencia_astral/components/calendarU.dart';
import 'package:inteligencia_astral/components/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:inteligencia_astral/components/text_field.dart';
import 'package:inteligencia_astral/pages/login.dart';
import 'package:inteligencia_astral/theme.dart';
import 'package:inteligencia_astral/components/time_picker.dart';
import 'package:inteligencia_astral/components/switch.dart';
import 'package:intl/intl.dart';
import 'package:inteligencia_astral/components/calendarU.dart';
import 'package:csc_picker/csc_picker.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late User currentUser;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    List<User> users = await DataHandler().fetchUserData();

    if (users.isNotEmpty) {
      setState(() {
        currentUser = users.first;
        isLoading = false; //os dados foram carregados
      });
    }
  }

  void editName() {
    // Implemente a lógica de edição do nome se necessário
  }

  void signOutAndNavigate(BuildContext context) async {
    await AuthenticationService().signout();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Login(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavMenu(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppTheme.colors.purpura, AppTheme.colors.roxo2],
              ),
            ),
          ),
          Center(
            child: isLoading
                ? CircularProgressIndicator(
                  color: AppTheme.colors.white,
                )
                : buildProfilePage(), // Exibe a página do perfil após o carregamento
          ),],),
    );
  }

  Widget buildProfilePage() {
    TimeOfDay birth = TimeOfDay.fromDateTime(DateTime.parse(currentUser.birthdate));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Inteligencia Astral'),
          backgroundColor: AppTheme.colors.purpura,
        ),
        drawer: const NavMenu(),
        body: currentUser != null
          ? Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppTheme.colors.purpura, AppTheme.colors.roxo2],
            )),
            child: SafeArea(
                child: Stack(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Nome
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: currentUser.nick,
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        /*WidgetSpan(
                          child: IconButton(
                              onPressed: editName,
                              icon: const Icon(Icons.edit_note,
                                  color: Colors.white)),
                        ),*/
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Notificações diárias',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SwitchExample(),
                      ],
                    ),
                  ),

                  MyTime(
                    onTimeChanged: (Time selectedTime) {
                      String formattedTime =
                          "${selectedTime.hour}:${selectedTime.minute}";
                      debugPrint("[horario de nascimento]:  $formattedTime");
                    }, timeShown: Time(hour: 00, minute: 00, second: 00),
                  ),

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
                    hintText: DateFormat('dd/MM/yyyy').format(DateTime.parse(currentUser.birthdate)),
                    onDateSelected: (DateTime selectedDate) {
                      String formattedDate =
                          "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                      debugPrint("[data de nascimento]:  $formattedDate");
                    }, shownDate: DateTime.parse(currentUser.birthdate),
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

                  MyTime(
                    onTimeChanged: (Time selectedTime) {
                      String formattedTime =
                          "${selectedTime.hour}:${selectedTime.minute}";
                      debugPrint("[horario de nascimento]:  $formattedTime");
                    }, 
                    
                    timeShown: Time(hour: birth.hour, minute: birth.minute, second: 00),
                  ),

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

                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 126, 111, 195),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                        child: Text(
                      currentUser.city,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ))),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: AppTheme.colors.white,
                      thickness: 2,
                    ),
                  ),
                ],
              ),

              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppTheme.colors.roxo2,
                        textStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        minimumSize: const Size(
                            double.infinity, 50), // Define a altura desejada
                      ),
                      onPressed: () => signOutAndNavigate(context),
                      child: Text('Sair'),
                    ),
                  ),
                ),
              ),
              //imagem mapa astral
            ]))
          ): 
        Center(
          child: Stack(
            children: [
              const CircularProgressIndicator(),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppTheme.colors.roxo2,
                        textStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        minimumSize: const Size(
                            double.infinity, 50), // Define a altura desejada
                      ),
                      onPressed: () => signOutAndNavigate(context),
                      child: Text('Sair'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          
        ),
      );
  }
}
