import 'package:flutter/material.dart';
import 'package:weather_app/ui/core/themes/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          width: 320,
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              labelText: "Digite o nome da cidade",
              prefixIcon: Icon(Icons.search),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
        actions: [
          SizedBox(width: 20),
          GestureDetector(child: Icon(Icons.light_mode)),
        ],
      ),
    );
  }
}
