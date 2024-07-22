import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  var fontSize = 14.0;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Bonjour le monde",
              style: TextStyle(
                fontSize: fontSize
              ),
            ),
          ),
          TextButton(
            child: Text("Augmenter taille"),
            onPressed: () {
              setState((){
                fontSize++;
              });
              
            },
          ),

          OutlinedButton(
            onPressed: firstName, 
            child: Text("Diminuer taille")
          ),

          ElevatedButton(
            onPressed: () {
              print("World");
            }, 
            child: Icon(Icons.usb_rounded)
          )
        ],
      ),
    );
  }

  void firstName() {
    setState((){
      fontSize--;
    });
    
    
  }
  
}