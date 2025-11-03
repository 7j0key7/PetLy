import 'package:flutter/material.dart';
class DetailsScreen extends StatelessWidget {
const DetailsScreen({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
        backgroundColor: const Color.fromARGB(255, 154, 242, 199),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 54, 210, 135),
          centerTitle: true,
          title: const Text('PetLy'),
        ),
body: const Center(
child: Text('Второй экран'),
),
);
}
}