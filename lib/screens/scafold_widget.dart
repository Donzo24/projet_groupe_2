import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          Icon(Icons.person),
          Padding(
            padding: EdgeInsets.only(
              right: 10,
              left: 10
            ),
            child: Icon(Icons.linked_camera),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: List.generate(3, (index) {
            return ListTile(
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
                  return Container(
                    // height: 150,
                    // width: double.infinity,
                    // color: Colors.cyan,
                    margin: EdgeInsets.all(10),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=3276&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                          )
                        )
                      ),
                    )
                  );
                }),
              ),
            )
          ),
          Container(
            color: Colors.white,
            height: 200,
            child: ListView(
              shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: List.generate(20, (index) {
                  return Container(
                    height: 70,
                    color: Colors.grey,
                    margin: EdgeInsets.all(10),
                  );
                }),
              )
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


} 