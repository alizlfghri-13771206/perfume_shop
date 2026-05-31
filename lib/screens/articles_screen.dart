import 'package:flutter/material.dart';
import 'package:parfumo_ui/models/events.dart';
import 'package:parfumo_ui/theme/app_theme.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:25,vertical: 10),
          child: Column(
            children: [
              const Column(
                    children: [
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'رویدادهای عطرآمین',
                            style: TextStyle(
                              color: AppColors.cream,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  itemCount: Events.events.length,
                  itemBuilder: (context, index) {
                    return EvenetsListTile(event: Events.events[index]);
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

class EvenetsListTile extends StatelessWidget {
  final Events event;

  const EvenetsListTile({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),
        padding:
            const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black38),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    event.title,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 25, 28, 41),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    event.content,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 25, 28, 41),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: BoxBorder.all(color: Colors.black26, width: 1)),
              child: Image.asset(event.image),
            ),
          ],
        ),
      ),
    );
  }
}
