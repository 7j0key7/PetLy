import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = '';
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadName();
  }

  Future<void> loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => name = prefs.getString('name') ?? '');
  }

  Future<void> saveName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', controller.text);
    setState(() => name = controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 154, 242, 199),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 210, 135),
        centerTitle: true,
        title: const Text('PetLy'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Имя питомца: ${name.isEmpty ? "—" : name}'),
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Введите имя питомца',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveName,
                child: const Text('Сохранить'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DetailsScreen()),
                  );
                },
                child: const Text('Перейти на новый экран'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
