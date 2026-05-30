import 'package:flutter/material.dart';
import 'package:parfumo_ui/models/perfume.dart';
import 'package:parfumo_ui/theme/app_theme.dart';
import 'package:parfumo_ui/screens/detail_screen.dart';

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
      case 1:
        return mockPerfumes.where((p) => p.concentration.contains('دکانت')).toList();
      case 2:
        return mockPerfumes.where((p) => p.gender.contains('مردانه')).toList();
      case 0:
        return mockPerfumes.where((p) => p.gender == 'زنانه').toList();
      default:
        return mockPerfumes;
    }
  }

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
              // ── سرچ ──────────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 6, 5, 0),
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
                      onTap: () => setState(() => _selectedCategory = index),
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
                            fontWeight: isSelected
                                ? FontWeight.w800
                                : FontWeight.w600,
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
                            horizontal: 18, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.filter_alt_outlined,
                                color: Colors.white, size: 18),
                            SizedBox(width: 6),
                            Text(
                              'فیلتر کردن',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    // دراپ‌داون مرتب‌سازی
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        height: 46,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedSort,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Colors.orange),
                            alignment: AlignmentDirectional.centerEnd,
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
                                        textDirection: TextDirection.rtl,
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── گرید ──────────────────────────────────────────────────
              Expanded(
                child: _filtered.isEmpty
                    ? const Center(
                        child: Text(
                          'محصولی یافت نشد',
                          style: TextStyle(color: Colors.black38, fontSize: 14),
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.only(bottom: 16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailScreen(perfume: perfume),
                              ),
                            ),
                          );
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
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
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