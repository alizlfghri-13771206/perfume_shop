import 'package:flutter/material.dart';
import 'package:parfumo_ui/models/perfume.dart';
import 'package:parfumo_ui/theme/app_theme.dart';
import 'package:parfumo_ui/screens/detail_screen.dart';
import 'package:parfumo_ui/utils/persian_numbers.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  int _selectedCategory = 3;
  String _selectedSort = 'پربازدیدترین';

  final List<String> _categories = [
    'زنانه',
    'مردانه',
    'دکانت',
    'همه محصولات',
  ];

  final List<String> _sortOptions = [
    'پربازدیدترین',
    'جدیدترین',
    'ارزان‌ترین',
    'گران‌ترین',
  ];
  List<Perfume> get _filtered {
    switch (_selectedCategory) {
      case 0:
        return Perfume.mockPerfumes.where((p) => p.gender != "مردانه").toList();
      case 1:
        return Perfume.mockPerfumes.where((p) => p.gender != "زنانه").toList();
      case 2:
        return Perfume.mockPerfumes.where((x) => x.hasDecant == true).toList();
      case 3:
        return Perfume.mockPerfumes;

      default:
        return Perfume.mockPerfumes; // اینجا return نداشت
    }
  }

  Key gridKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'فروشگاه',
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
              // ── سرچ ──────────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 16, 5, 0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: const Icon(Icons.search, size: 30),
                        ),
                        const Text(
                          'کالای مورد نظرتان را جستجو نمایید...',
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(color: Colors.black38, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ── کتگوری‌ها ─────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(_categories.length, (index) {
                    final isSelected = _selectedCategory == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() => _selectedCategory = index);
                        gridKey = UniqueKey();
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: isSelected
                            ? BoxDecoration(
                                border: BoxBorder.fromLTRB(
                                    bottom: const BorderSide(
                                        color: Colors.orange, width: 2)))
                            : const BoxDecoration(),
                        child: Text(
                          _categories[index],
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: isSelected
                                ? screenWidth * 0.04
                                : screenWidth * 0.031,
                            fontWeight:
                                isSelected ? FontWeight.w800 : FontWeight.w600,
                            color: isSelected ? Colors.black : Colors.black54,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              // ── فیلتر و مرتب‌سازی ────────────────────────────────────
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  children: [
                    // دکمه فیلتر
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 49, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'فیلتر کردن',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.filter_alt_outlined,
                                color: Colors.white, size: 18),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // دراپ‌داون مرتب‌سازی
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          height: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedSort,
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.orange),
                              onChanged: (val) {
                                if (val != null) {
                                  setState(() => _selectedSort = val);
                                }
                              },
                              items: _sortOptions
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e,
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── گرید ──────────────────────────────────────────────────
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: _filtered.isEmpty
                      ? const Center(
                          key: ValueKey('empty'),
                          child: Text(
                            'محصولی یافت نشد',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 14,
                            ),
                          ),
                        )
                      : GridView.builder(
                          key: ValueKey(_filtered.length),
                          padding: const EdgeInsets.only(bottom: 16),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: screenWidth > 600 ? 3 : 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.62,
                          ),
                          itemCount: _filtered.length,
                          itemBuilder: (context, index) {
                            final perfume = _filtered[index];

                            return _PerfumeCard(
                              perfume: perfume,
                              cardWidth: (screenWidth - 42) / 2,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PerfumeProductScreen(
                                      perfume: perfume,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PerfumeCard extends StatelessWidget {
  final Perfume perfume;
  final VoidCallback onTap;
  final double cardWidth;

  const _PerfumeCard({
    required this.perfume,
    required this.onTap,
    required this.cardWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        padding: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: AppColors.accentLight.withValues(alpha: .06),
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.black54),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(perfume.image),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    perfume.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    perfume.brand,
                    style: const TextStyle(color: Colors.black54, fontSize: 10),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star,
                          color: Colors.amberAccent, size: 11),
                      const SizedBox(width: 3),
                      Text(
                        perfume.rating,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        // ignore: prefer_const_constructors
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: perfume.brandColor.withValues(alpha: .1),
                            borderRadius: BorderRadius.circular(14)),
                        child: Text(
                          "${perfume.price.farsiNumber} تومان",
                          style: const TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w600),
                          textDirection: TextDirection.rtl,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
