import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import "package:parfumo_ui/root.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  static const Color _primaryBlue = Color(0xFF29ABE2);
  static const Color _textGrey = Color(0xFF7A8FA0);
  static const Color _bgColor = Color(0xFFF4FAFE);

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: isActive ? _primaryBlue : _primaryBlue.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 8,
      width: isActive ? 24 : 8,
    );
  }

  List<Widget> _buildIndicators() {
    return List.generate(
      3,
      (i) => _buildIndicator(i == _currentIndex),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: Stack(
        children: [
          // Subtle top decoration
          Positioned(
            top: -80,
            right: -80,
            child: Container(
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _primaryBlue.withValues(alpha: 0.08),
              ),
            ),
          ),
          Positioned(
            bottom: -60,
            left: -60,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _primaryBlue.withValues(alpha: 0.06),
              ),
            ),
          ),

          Column(
            children: [
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).push(
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const RootPage())),
                      style: TextButton.styleFrom(
                        foregroundColor: _textGrey,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                      ),
                      child: const Text(
                        'رد کردن',
                        style: TextStyle(
                          fontFamily: 'laleh',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // PageView
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (v) => setState(() => _currentIndex = v),
                  children: const [
                    _SplashPage1(),
                    _SplashPage2(),
                    _SplashPage3(),
                  ],
                ),
              ),

              // Indicators + Button row
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 28, 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Indicators
                    Row(children: _buildIndicators()),

                    // Button: arrow on pages 1&2, text button on page 3
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _currentIndex < 2
                          ? _ArrowButton(
                              key: const ValueKey('arrow'),
                              onTap: () {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 350),
                                  curve: Curves.easeInOut,
                                );
                              },
                            )
                          : _StartButton(
                              key: const ValueKey('start'),
                              onTap: () => Navigator.of(context).push(
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const RootPage())),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Page 1 ──────────────────────────────────────────────────────────────────

class _SplashPage1 extends StatelessWidget {
  const _SplashPage1();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF29ABE2).withValues(alpha: 0.25),
                    blurRadius: 40,
                    spreadRadius: 8,
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/splash/1.webp', // ← replace with your actual asset path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'به عطرآمین خوش آمدید',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'IranYekan',
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1A2A3A),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'دنیایی از عطرهای خاص، اورجینال و ماندگار\nبرای سلیقه‌هایی که متفاوت انتخاب می‌کنند.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'yekan',
                fontSize: 17,
                // fontWeight: FontWeight.w400,
                color: Color(0xFF7A8FA0),
                height: 1.9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Page 2 ──────────────────────────────────────────────────────────────────

class _SplashPage2 extends StatelessWidget {
  const _SplashPage2();

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Two trust logos side by side
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TrustLogo(
                    assetPath:
                        'assets/images/splash/logo2.webp'), // enamad2.png
                SizedBox(width: 28),
                _TrustLogo(
                    assetPath:
                        'assets/images/splash/enamad2.webp'), // logo2.png (hexagon)
              ],
            ),
            SizedBox(height: 44),
            Text(
              'با خیال راحت خرید کنید',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'IranYekan',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A2A3A),
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'تمامی محصولات عطرآمین\nبا ضمانت ۱۰۰٪ اصالت و کیفیت ارائه می‌شوند.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'yekan',
                fontSize: 17,
                color: Color(0xFF7A8FA0),
                height: 1.9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TrustLogo extends StatelessWidget {
  final String assetPath;
  const _TrustLogo({required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF29ABE2).withValues(alpha: 0.12),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Image.asset(assetPath, fit: BoxFit.contain),
    );
  }
}

// ─── Page 3 ──────────────────────────────────────────────────────────────────

class _SplashPage3 extends StatelessWidget {
  const _SplashPage3();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Perfume hero image
            SizedBox(
              height: 490,
              child: Image.asset(
                'assets/images/splash/3.webp', // ← 3.png (the V-shaped perfumes)
                fit: BoxFit.contain,
              ),
            ),
            // const SizedBox(height: 20),
            const Text(
              'از میان بهترین عطرهای لوکس و جهانی،\nانتخابی متناسب با شخصیت خود داشته باشید.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'yekan',
                fontSize: 17,
                color: Color(0xFF7A8FA0),
                height: 1.9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Reusable Buttons ─────────────────────────────────────────────────────────

class _ArrowButton extends StatelessWidget {
  final VoidCallback onTap;
  const _ArrowButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 54,
        height: 54,
        decoration: const BoxDecoration(
          color: Color(0xFF29ABE2),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }
}

class _StartButton extends StatelessWidget {
  final VoidCallback onTap;
  const _StartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(PageTransition(
            type: PageTransitionType.rightToLeft, child: const RootPage(),duration:Duration(seconds: 1) ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(41, 171, 226, 1),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF29ABE2).withValues(alpha: 0.35),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Text(
          'سفر خود را آغاز کنید',
          style: TextStyle(
            fontFamily: 'IranYekan',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
