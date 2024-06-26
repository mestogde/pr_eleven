import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../screens/details_screen.dart';

class ListItem extends StatelessWidget {
  final int id;
  final Habit habit;

  ListItem({required this.id, required this.habit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(habitTitle: habit.title),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 21.0),
        padding: const EdgeInsets.only(right: 25.0),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: habit.color,
                border: Border.all(
                  color: Colors.grey.shade500,
                ),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  habit.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  habit.progress,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                )
              ],
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade500,
            )
          ],
        ),
      ),
    );
  }
}
