
import 'package:flutter/material.dart';
import 'package:parfumo_ui/models/perfume.dart';
import 'package:parfumo_ui/utils/persian_numbers.dart';

class NewPerfumeWidget extends StatelessWidget {
    final List<Perfume> perfumeList;
    final int index;

  const NewPerfumeWidget({
    super.key,
    required this.perfumeList,
    required this.index
  }) ;


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {

      },
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
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Text("تومان")
                ),
                const SizedBox(width: 3),
                Text(
                  perfumeList[index].price.toString().farsiNumber,
                  style: const TextStyle(
                    fontFamily: "laleh",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber.withValues(
                      alpha: .8,
                    ),
                    shape: BoxShape.circle,
                  ),
                  height: 60,
                  width: 60,
                ),
                Positioned(
                  bottom: -5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80,
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
                        perfumeList[index].farsiBrand,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "yekan",
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        perfumeList[index].name,
                        style: const TextStyle(
                          color: Colors.black45,
                          fontFamily: "yekan",
                          fontSize: 18,
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