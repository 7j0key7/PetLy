import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = '', weight = '';
  final nameController = TextEditingController();
  final weightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        name = prefs.getString('name') ?? '';
        weight = prefs.getString('weight') ?? '';
      });
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    weightController.dispose();
    super.dispose();
  }

  void saveData() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', nameController.text);
      await prefs.setString('weight', weightController.text);
      setState(() {
        name = nameController.text;
        weight = weightController.text;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Данные сохранены: $name, $weight кг')),
      );
    }
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Имя питомца: ${name.isEmpty ? "—" : name}'),
              Text('Вес питомца: ${weight.isEmpty ? "—" : "$weight кг"}'),
              const SizedBox(height: 20),

              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Имя питомца',
                  border: OutlineInputBorder(),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Введите имя';
                  if (v.trim().length > 30) return 'Имя не должно быть длиннее 30';
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Вес питомца
              TextFormField(
                controller: weightController,
                decoration: const InputDecoration(
                  labelText: 'Вес питомца (кг)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Введите вес';
                  if (double.tryParse(v) == null) return 'Только цифры';
                  if (double.parse(v) <= 0) return 'Вес должен быть >0';
                  return null;
                },
              ),
              const SizedBox(height: 20),

              ElevatedButton(onPressed: saveData, child: const Text('Сохранить')),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DetailsScreen()),
                ),
                child: const Text('Перейти на новый экран'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}