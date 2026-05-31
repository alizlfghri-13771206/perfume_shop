import 'package:flutter/material.dart';
import 'package:atramin/models/perfume.dart';
import 'package:atramin/theme/app_theme.dart';
import "package:atramin/screens/widgets/new_perfumes_widget.dart";

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
      int lengthOfPlant = widget.inShoppingCartPerfumes.length;
      for (int i = 0; i < lengthOfPlant; i++) {
        sum = sum + widget.inShoppingCartPerfumes[i].priceinInt;
      }
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
          child: Column(
            children: widget.inShoppingCartPerfumes.isNotEmpty
                ? [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'سبد خرید',
                          style: TextStyle(
                            color: AppColors.cream,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
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
                              const SizedBox(width: 5),
                              Text(
                                sumPrices().toString(),
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "جمع کل : ",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  ]
                : [
                    const SizedBox(height: 30),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'سبد خرید',
                          style: TextStyle(
                            color: AppColors.cream,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "سبد خرید خالی است :|",
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
      ),
    );
  }
}
