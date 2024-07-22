import 'package:flutter/material.dart';

class MoreWidget extends StatefulWidget {
  const MoreWidget({super.key});

  @override
  State<MoreWidget> createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget>
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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
          height: 100,
          child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            createBox(color: Color(colorFromHex("#fccd77"))),
            createBox(color: Color(colorFromHex("#b3a0ff"))),
            createBox(color: Colors.red),
            createBox(color: Colors.red),
          ],
        ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
              leading: Icon(Icons.flaky),
              title: Text("Titre"),
              subtitle: Text("HSJSJ"),
              trailing: Icon(Icons.chevron_right),
          ),
        ),
        Divider()
          ],
        ),
      )
    );
  }

  Widget createBox({required Color color}) {

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 100,
        width: 100,
        color: color,
      ),
    );
  }

  int colorFromHex(String code) {

    var hex = code.toUpperCase().replaceAll("#", "");
    return int.parse("FF$hex", radix: 16);
  }

}