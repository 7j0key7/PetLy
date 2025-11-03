  import 'package:flutter/material.dart';
  import 'details_screen.dart';
  class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> {
    int _counter = 0;

    void _incrementCounter() {
      setState(() {
        _counter++;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 154, 242, 199),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 54, 210, 135),
          centerTitle: true,
          title: const Text('PetLy'),
        ),
body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Счётчик:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailsScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 7, 175, 197),
                foregroundColor: Color.fromARGB(255, 3, 65, 158),
                side: const BorderSide(color: Color.fromARGB(96, 215, 247, 33), width: 2),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
  ),
              ),
              child: const Text('Перейти на новый экран'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
  }