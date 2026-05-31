import 'package:flutter/material.dart';
import 'package:parfumo_ui/models/perfume.dart';
import 'package:parfumo_ui/utils/persian_numbers.dart';

class NewPerfumeWidget extends StatelessWidget {
  final List<Perfume> perfumeList;
  final int index;

  const NewPerfumeWidget(
      {super.key, required this.perfumeList, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 80,
        padding: const EdgeInsets.only(left: 10),
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 3),
                Text(
                  perfumeList[index].price.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          perfumeList[index].brandColor,
                          Colors.white12
                        ]),
                    shape: BoxShape.circle,
                  ),
                  height: 65,
                  width: 65,
                ),
                Positioned(
                  bottom: -5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 90,
                    child: Image.asset(
                      perfumeList[index].image,
                    ),
                  ),
                ),
                Positioned(
                  right: 80,
                  bottom: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      Text(
                        perfumeList[index].name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "yekan",
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        perfumeList[index].brand,
                        style: const TextStyle(
                          color: Colors.black45,
                          fontFamily: "yekan",
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
