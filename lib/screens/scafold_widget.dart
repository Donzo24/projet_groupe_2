import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:projet_image/models/phone.dart';
import 'package:projet_image/screens/forms.dart';
import 'package:projet_image/screens/index.dart';
import 'package:projet_image/screens/login.dart';
import 'package:projet_image/screens/parametre.dart';
import 'package:http/http.dart' as http;

class ScafoldWidget extends StatefulWidget {
  const ScafoldWidget({super.key});

  @override
  State<ScafoldWidget> createState() => _ScafoldWidgetState();
}

class _ScafoldWidgetState extends State<ScafoldWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int currentIndex = 0;

  List<Map> data = [
    {
      'icon': Icons.access_alarm_outlined,
      'titre': "Titre 1",
      'sous_titre': "Sous titre 1"
    },
    {
      'icon': Icons.access_alarm_outlined,
      'titre': "Titre 1",
      'sous_titre': "Sous titre 1"
    },
    {
      'icon': Icons.access_alarm_outlined,
      'titre': "Titre 1",
      'sous_titre': "Sous titre 1"
    }
  ];

  List<Map> menus = [
    {
      'titre': "Mon compte",
      'icon': Icons.person
    },
    {
      'titre': "Parametre",
      'icon': Icons.settings
    },
    {
      'titre': "Deconnecion",
      'icon': Icons.logout
    }
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        // leading: Icon(Icons.sort),
        title: Text("Fiteness App"),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Get.to(() {
              //   return LoginPage();
              // });

              Get.to(() => FormPage(), transition: Transition.upToDown);
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 10,
              left: 10
            ),
            child: IconButton(
              icon: Icon(Icons.linked_camera),
              onPressed: () {
                Get.to(() => IndexPage());
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: List.generate(3, (index) {
            return ListTile(
              onTap: () {

                Get.to(() => Parametre(titre: "Setting Page"));

                // Get.off(() => Parametre());

                // Get.offAll(() => Parametre());

              },
              title: Text(menus[index]['titre']),
              leading: Icon(menus[index]['icon']),
            );
          })
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        currentIndex: currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.yellow,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: "Feed"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil"
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          saveUser();
        },
        child: Icon(Icons.add),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(50, (index) {
                  return SizedBox();
                }),
              ),
            )
          ),
          FutureBuilder(
            future: http.get(Uri.parse("https://api.restful-api.dev/objects")),
            builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  // print("En cours");
                } else if(snapshot.connectionState == ConnectionState.done) {
                  // print("Terminer");
                  var reponse = snapshot.data;

                  // print(reponse!.statusCode);

                  // print(reponse.body);

                  var json = jsonDecode(reponse!.body) as List<dynamic>;

                  // print(json);

                  List<Phone> phones = [];

                  for (var i = 0; i < json.length; i++) {
                    phones.add(Phone.fromJson(json[i]));
                  }

                  return SizedBox(
                    child: ListView(
                      shrinkWrap: true,
                      children: phones.map((phone) {
                        return Card(
                          child: ListTile(
                            title: Text(phone.name),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                editPhone(phone: phone);
                              },
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                  
                } else if(snapshot.hasError) {
                  print("Une erreur s'est proudit");
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          ),
          createProfilPage(),
        ],
      )
    );
  }

  Widget createProfilPage() {
    return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Colors.red
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://plus.unsplash.com/premium_photo-1720886073981-f975d3dc93f8?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8"
                )
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    )
                  ),
                )
              ],
            )
          );
  }

  Widget createItemBox({required IconData icon, required String titre, required String sousTitre}) {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(85),
            border: Border.all(
              color: Colors.black
            )
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                titre
              ),
              subtitle: Text(sousTitre),
              leading: CircleAvatar(
                child: Icon(icon),
              ),
              trailing: CircleAvatar(
                child: Icon(Icons.chevron_right),
              ),
            ),
          ),
        ),
      );
  }

  void saveUser() {
    
    Get.bottomSheet(
      StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: 500,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("Titre"),
                    trailing: Text("trailling"),
                  ),
                ),
                Column(
                  children: List.generate(data.length, (index) {
                    return createItemBox(
                      icon: data[index]['icon'], 
                      titre: data[index]['titre'], 
                      sousTitre: data[index]['sous_titre']
                    );
                  }),
                )
              ],
            ),
          );
        },
      )
    );
  }
  
  void editPhone({required Phone phone}) {
    print(phone.name);

    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: FormBuilderTextField(
                name: "nam",
                initialValue: phone.name,
              ),
            )
          ],
        ),
      )
    );
  }


} 