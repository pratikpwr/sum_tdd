import 'package:flutter/material.dart';

class SumTDDScreen extends StatefulWidget {
  const SumTDDScreen({super.key});

  @override
  State<SumTDDScreen> createState() => _SumKataScreenState();
}

class _SumKataScreenState extends State<SumTDDScreen> {
  final TextEditingController _controller = TextEditingController();

  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sum TDD')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter Numbers String',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: () {}, child: const Text('Sum')),
            const SizedBox(height: 16),
            Text(
              'Result: $result',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
