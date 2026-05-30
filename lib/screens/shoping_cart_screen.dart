import 'package:flutter/material.dart';
import 'package:parfumo_ui/models/perfume.dart';
import 'package:parfumo_ui/utils/persian_numbers.dart';
import "package:parfumo_ui/screens/widgets/new_perfumes_widget.dart";

class ShopingCartScreen extends StatefulWidget {
  final List<Perfume> inShoppingCartPerfumes;

  const ShopingCartScreen({super.key, required this.inShoppingCartPerfumes});

  @override
  State<ShopingCartScreen> createState() => _ShopingCartScreenState();
}

class _ShopingCartScreenState extends State<ShopingCartScreen> {
  int sumPrices() {
    int sum = 0;

    if (widget.inShoppingCartPerfumes.isNotEmpty) {
      int lengthOfPerfumes = widget.inShoppingCartPerfumes.length;
      for (int i = 0; i < lengthOfPerfumes; i++) {
        sum = sum + int.parse(widget.inShoppingCartPerfumes[i].price);
      }
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.inShoppingCartPerfumes.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 12),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.inShoppingCartPerfumes.length,
                      itemBuilder: (context, index) {
                        return NewPerfumeWidget(
                          perfumeList: widget.inShoppingCartPerfumes,
                          index: index,
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              child: Text("ssss")
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${sumPrices().toString().farsiNumber}${"000".farsiNumber}",
                              style: const TextStyle(
                                fontFamily: "laleh",
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "جمع کل : ",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontFamily: "laleh", fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Text("aas"),
                  ),
                  const Text(
                    "سبد خرید تار عنکبوت بسته :|",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "sans",
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
