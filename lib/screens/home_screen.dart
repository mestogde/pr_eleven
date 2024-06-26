import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/habit.dart';
import 'add_habit_screen.dart';
import 'details_screen.dart';
import '../widgets/list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Habit> habits2 = [
    Habit(
      color: const Color(0xff7524ff),
      title: 'Выучить 5 новых слов',
      progress: '5 из 7 за неделю',
    ),
    Habit(
      color: const Color(0xfff03244),
      title: 'Вставать рано',
      progress: '5 из 7 за неделю',
    ),
    Habit(
      color: const Color(0xff00d5e2),
      title: 'Читать каждый день',
      progress: '5 из 7 за неделю',
    ),
  ];

  void addNewHabit(Habit newHabit) {
    setState(() {
      habits2.add(newHabit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff131b26),
        body: Container(
          padding: const EdgeInsets.only(top: 25.0, left: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: RichText(
                      softWrap: true,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Трекер Ваших",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          TextSpan(
                            text: " Привычек",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddHabitScreen(
                              onSave: addNewHabit,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(9.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff6f1bff),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff6f1bff),
                              offset: Offset(0, 3),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 25.0),
                ],
              ),
              const SizedBox(height: 35.0),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: habits2.length,
                  itemBuilder: (ctx, id) {
                    return Container(
                      width: 150,
                      margin: const EdgeInsets.only(right: 15.0, top: 9.0, bottom: 9.0),
                      padding: const EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        color: habits2[id].color,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: habits2[id].color,
                            blurRadius: 5.0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            habits2[id].title, // Display habit title only
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 35.0),
              Container(
                height: 90,
                decoration: const BoxDecoration(
                  color: Color(0xff1b232e),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                padding: const EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, f) {
                    int day = DateTime.now().day + f;
                    return FittedBox(
                      child: Container(
                        width: 90,
                        height: 90,
                        margin: const EdgeInsets.only(right: 15.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: day == DateTime.now().day
                              ? const Color(0xff727be8)
                              : const Color(0xff131b26),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "${DateTime.now().day + f}",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: day == DateTime.now().day
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: day == DateTime.now().day
                                    ? Colors.white
                                    : Colors.grey.shade500,
                              ),
                            ),
                            Text(
                              DateFormat('EE').format(
                                DateTime.now().add(
                                  Duration(days: f),
                                ),
                              ),
                              style: TextStyle(
                                color: day == DateTime.now().day
                                    ? Colors.white
                                    : Colors.grey[700],
                                fontWeight: day == DateTime.now().day
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 35.0),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Ваши привычки ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                    TextSpan(
                      text: "${habits2.length}",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: habits2.length,
                  itemBuilder: (ctx, id) {
                    return ListItem(id: id, habit: habits2[id]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
