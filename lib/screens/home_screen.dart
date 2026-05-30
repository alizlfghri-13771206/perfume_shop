import 'package:flutter/material.dart';
import 'package:parfumo_ui/theme/app_theme.dart';
import 'package:parfumo_ui/models/perfume.dart';
import 'package:parfumo_ui/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  int currentIndex = 0;

  int _selectedCategory = 0;
  final PageController pageController = PageController(initialPage: 0);

  final List<String> _categories = [
    'پربازدیدها',
    'تازه‌ها',
    'مردانه',
    'زنانه',
  ];

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 2),
      duration: const Duration(microseconds: 600),
      decoration: const BoxDecoration(
          color: Color.fromARGB(191, 59, 39, 31), shape: BoxShape.circle),
      height: 8,
      width: isActive ? 14 : 6,
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 7; i++) {
      if (i == currentIndex) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  void autoChangePage() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    final nextIndex = (currentIndex + 1) % 7;

    pageController.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    autoChangePage();
  }

  @override
  void initState() {
    super.initState();
    autoChangePage();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final heroHeight = screenHeight * 0.24; 
    final cardListHeight = screenHeight * 0.24;
    final cardWidth = screenWidth * 0.38;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnim,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              children: [

                // HEADER
                const Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'فروشگاه عطرآمین',
                          style: TextStyle(
                            color: AppColors.cream,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // SEARCH BAR
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
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // HERO PAGEVIEW
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: heroHeight,
                    child: Stack(
                      children: [
                        PageView(
                          allowImplicitScrolling: true,
                          onPageChanged: (value) {
                            setState(() {
                              currentIndex = value;
                            });
                          },
                          controller: pageController,
                          children: [
                            _HeroCard(
                              perfume: mockPerfumes[0],
                              imageHeightFraction: 1.2,
                              imageWidthFraction: 0.6,
                              imageTopFraction: -0.1,
                              imageLeftFraction: -0.15,
                            ),
                            _HeroCard(
                              perfume: mockPerfumes[1],
                              imageHeightFraction: 1.05,
                              imageWidthFraction: 0.49,
                              imageTopFraction: -0.1,
                              imageLeftFraction: -0.1,
                            ),
                            _HeroCard(
                              perfume: mockPerfumes[6],
                              imageHeightFraction: 1.05,
                              imageWidthFraction: 0.51,
                              imageTopFraction: -0.12,
                              imageLeftFraction: -0.1,
                            ),
                            _HeroCard(
                              perfume: mockPerfumes[2],
                              imageHeightFraction: 1.0,
                              imageWidthFraction: 0.47,
                              imageTopFraction: 0.0,
                              imageLeftFraction: -0.05,
                            ),
                            _HeroCard(
                              perfume: mockPerfumes[4],
                              imageHeightFraction: 1.05,
                              imageWidthFraction: 0.51,
                              imageTopFraction: -0.12,
                              imageLeftFraction: -0.1,
                            ),
                            _HeroCard(
                              perfume: mockPerfumes[5],
                              imageHeightFraction: 1.05,
                              imageWidthFraction: 0.51,
                              imageTopFraction: -0.12,
                              imageLeftFraction: -0.1,
                            ),
                            _HeroCard(
                              perfume: mockPerfumes[3],
                              imageHeightFraction: 1.05,
                              imageWidthFraction: 0.51,
                              imageTopFraction: -0.08,
                              imageLeftFraction: -0.08,
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 20,
                          right: screenWidth * 0.35,
                          child: Row(
                            children: _buildIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // CATEGORIES
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _categories.length,
                      itemBuilder: (context, index) => _CategoryChip(
                        label: _categories[index],
                        selected: _selectedCategory == index,
                        onTap: () {
                          setState(() => _selectedCategory = index);
                        },
                      ),
                    ),
                  ),
                ),

                // PERFUME CARDS
                SizedBox(
                  height: cardListHeight,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    itemCount: mockPerfumes.length,
                    itemBuilder: (context, index) => _PerfumeCard(
                      perfume: mockPerfumes[index],
                      cardWidth: cardWidth,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                PerfumeProductScreen(perfume: mockPerfumes[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── _HeroCard ──────────────────────────────────────────────────────────────
// به جای مقادیر pixel ثابت، fraction (نسبت) می‌گیرد و با LayoutBuilder حل می‌کند
class _HeroCard extends StatelessWidget {
  final Perfume perfume;
  final double imageHeightFraction;
  final double imageWidthFraction;
  final double imageTopFraction;
  final double imageLeftFraction;

  const _HeroCard({
    required this.perfume,
    required this.imageHeightFraction,
    required this.imageWidthFraction,
    required this.imageTopFraction,
    required this.imageLeftFraction,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final h = constraints.maxHeight;
        final w = constraints.maxWidth;
        return Stack(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: perfume.brandGradient.withOpacity(.3),
                border: Border.all(color: AppColors.divider),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    perfume.name,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      color: AppColors.cream,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      height: 1.5,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${perfume.farsiBrand}|${perfume.brand} ",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: perfume.brandColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    perfume.summery,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              height: h * imageHeightFraction,
              width: w * imageWidthFraction,
              top: h * imageTopFraction,
              left: w * imageLeftFraction,
              child: Image.asset(perfume.image),
            ),
          ],
        );
      },
    );
  }
}

// ── _CategoryChip ─────────────────────────────────────────────────────────
// بدون تغییر
class _CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: selected
            ? BoxDecoration(
                border: BoxBorder.fromLTRB(
                    bottom: const BorderSide(color: Colors.orange, width: 2)))
            : const BoxDecoration(),
        child: Text(
          label,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: selected ? Colors.black : Colors.black45,
            fontSize: 16,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

// ── _PerfumeCard ──────────────────────────────────────────────────────────
// عرض از بیرون (cardWidth) می‌گیرد
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
        margin: const EdgeInsets.only(right: 10, left: 8),
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
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 10,
                    ),
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
