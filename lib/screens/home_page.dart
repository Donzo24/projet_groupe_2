import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Titre"),
      ),
      body: Center(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Hello World !",
                style: GoogleFonts.crimsonPro(
                  color: Colors.red,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )
              ),
            ),

            Stack(
              children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://www.challenges.fr/assets/img/2020/06/11/cover-r4x3w1200-5ee1eb43deaac-the-e-thrust.jpg"
                        )
                      )
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                        )
                      ),
                    )
                  ),

                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: Text(
                      "Hello",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                    )
                  )

                  
                  
              ],
            ),


            // Container(
            //     height: 200,
            //     margin: EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       image: DecorationImage(
            //         fit: BoxFit.cover,
            //         image: NetworkImage(
            //           "https://www.challenges.fr/assets/img/2020/06/11/cover-r4x3w1200-5ee1eb43deaac-the-e-thrust.jpg"
            //         )
            //       )
            //     ),
            //   ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.network(
                "https://img.static-af.com/images/media/E56219E9-21C7-4BB0-B7A5F5353A5140D3/",
              ),
            ),
            Image.asset(
              "assets/images/dice-2.png",
              height: 100,
            ),
            ElevatedButton(
              onPressed: connexion,
              child: Text("CONNEXION")
            ),
            TextButton(
              onPressed: register, 
              child: Text("Text button")
            ),
            OutlinedButton(
              onPressed: connexion, 
              child: Text("Outiline Button")
            )
            // Padding(
            //   padding: EdgeInsets.all(10),
            //   child: GestureDetector(
            //     onTap: connexion,
            //     child: Container(
            //     height: 40,
            //     width: 100,
            //     child: Center(
            //       child: Text("TEST"),
            //     ),
            //     decoration: BoxDecoration(
            //       color: Colors.orangeAccent,
            //       borderRadius: BorderRadius.circular(10)
            //     ),
            //   ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void connexion() {
    print("Hello !");
  }

  void register() {
    print("Register");
  }
}