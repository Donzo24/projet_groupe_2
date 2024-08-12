import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Parametre extends StatefulWidget {
  const Parametre({super.key, required this.titre});

  final String titre;

  @override
  State<Parametre> createState() => _ParametreState();
}

class _ParametreState extends State<Parametre>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
        title: Text(widget.titre),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SizedBox(),
    );
  }
}