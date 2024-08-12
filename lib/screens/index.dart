import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
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
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg-2.jpg"
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
            height: 320,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 2,
              shrinkWrap: true,
              children: [
                createBox(),
                createBox(),
                createBox(),
                createBox(),
                createBox(),
                createBox(),
              ],
            ),
          ),
          )
        ],
      )
    );
  }

  Widget createBox() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 50,
        color: Colors.orange,
      ),
    );
  }
}