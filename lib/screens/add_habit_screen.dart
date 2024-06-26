import 'package:flutter/material.dart';
import '../models/habit.dart';

class AddHabitScreen extends StatefulWidget {
  final Function(Habit) onSave;

  AddHabitScreen({required this.onSave});

  @override
  _AddHabitScreenState createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  late Color selectedColor;
  late TextEditingController titleController;
  late TextEditingController progressController;

  @override
  void initState() {
    super.initState();
    selectedColor = Colors.blue;
    titleController = TextEditingController();
    progressController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    progressController.dispose();
    super.dispose();
  }

  void _saveHabit() {
    Habit newHabit = Habit(
      color: selectedColor,
      title: titleController.text,
      progress: progressController.text,
    );
    widget.onSave(newHabit);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff131b26),
      appBar: AppBar(
        backgroundColor: const Color(0xff131b26),
        elevation: 0,
        title: const Text(
          'Добавление новой привычки',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check, color: Colors.white),
            onPressed: _saveHabit,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Название',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: titleController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff1b232e),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Напишите привычку, над которой хотите работать',
                hintStyle: TextStyle(color: Colors.grey.shade500),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Детали',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: progressController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff1b232e),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Напишите детали или частоту привычки',
                hintStyle: TextStyle(color: Colors.grey.shade500),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Цвет',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildColorButton(Colors.blue),
                buildColorButton(Colors.green),
                buildColorButton(Colors.orange),
                buildColorButton(Colors.purple),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildColorButton(Color color) {
    bool isSelected = selectedColor == color;
    return InkWell(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(color: Colors.white, width: 3)
              : null,
        ),
      ),
    );
  }
}
