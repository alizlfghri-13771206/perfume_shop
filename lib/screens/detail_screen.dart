import 'package:flutter/material.dart';
import 'package:parfumo_ui/models/constants.dart';
import 'package:parfumo_ui/models/perfume.dart';

class PerfumeProductScreen extends StatefulWidget {
  final Perfume perfume;
  const PerfumeProductScreen({super.key, required this.perfume});

  @override
  State<PerfumeProductScreen> createState() => _PerfumeProductScreenState();
}

class _PerfumeProductScreenState extends State<PerfumeProductScreen> {
  // --- متغیرهای وضعیت برای کنترل تب‌ها ---
  int activeContextTab = 0; // 0 برای مناسب برای، 1 برای امتیازها
  int activeNotesTab = 0; // 0 برای نت‌های بویایی، 1 برای آکوردها

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: InkResponse(
          onTap: () {
            setState(() {
              widget.perfume.inWishlist = !widget.perfume.inWishlist;
            });
            if (widget.perfume.inWishlist == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  dismissDirection: DismissDirection.up,
                  duration: const Duration(milliseconds: 900),
                  content: Text(
                    "عطر ${widget.perfume.name} به سبد خرید اضافه شد",
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(fontFamily: "yekan", fontSize: 16),
                  ),
                ),
              );
            }
          },
          child: Container(
            width: double.infinity,
            height: 58,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(8)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'افزودن به سبد خرید',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(width: 5),
                Icon(Icons.shopping_cart_outlined, color: Colors.white),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // appBar
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // X Button
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: widget.perfume.brandColor
                                  .withValues(alpha: .5),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.close,
                                color: Colors.white.withValues(alpha: .9)),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ۱. اطلاعات اولیه و تصویر محصول
                  _buildProductHeaderSection(),

                  // ۲. بخش قیمت و انتخاب حجم
                  _buildPriceAndSizeSection(),

                  const Divider(
                      height: 30, thickness: 1, color: Colors.black87),

                  // ۳. جدول مشخصات فنی محصول
                  _buildSpecificationsSection(),

                  const Divider(
                      height: 32,
                      thickness: 1,
                      color: Color.fromARGB(255, 63, 34, 34)),

                  // ۴. بخش داینامیک (مناسب برای / امتیازها)
                  _buildUsageContextSection(),

                  const Divider(
                      height: 32, thickness: 1, color: Color(0xFFF2F2F2)),

                  // ۵. بخش داینامیک (نت‌های بویایی / آکوردها)
                  _buildOlfactoryNotesSection(),

                  const Divider(
                      height: 32, thickness: 1, color: Color(0xFFF2F2F2)),

                  const SizedBox(
                      height:
                          100), // فضای کافی برای اسکرول راحت به خاطر وجود FAB
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- ۱. بخش هدر و تصویر محصول ---
  Widget _buildProductHeaderSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: SizedBox(
                  height: 270,
                  width: 270,
                  child: Image.asset(widget.perfume.image))),

          const SizedBox(height: 20),
          // امتیاز و ستاره‌ها
          Row(
            children: [
              const Row(
                children: [
                  Icon(Icons.verified_user, color: Colors.green, size: 18),
                  SizedBox(width: 4),
                  Text(
                    'گارانتی تضمین اصالت',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.perfume.rating,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < 4 ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 18,
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // عنوان محصول
          Text(
            "عطر ${widget.perfume.farsiBrand} ${widget.perfume.farsiName}",
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700, height: 1.5),
          ),
          const SizedBox(height: 5),
          Text(
            "| ${widget.perfume.brand} ${widget.perfume.name}",
            textDirection: TextDirection.ltr,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, height: 1.5),
          ),

          const SizedBox(height: 12),

          // اطلاعات کوتاه زیر عنوان
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('جنسیت : ${widget.perfume.gender}',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 2),
                  Text('سال عرضه: ${widget.perfume.year}',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              const SizedBox(width: 16),
              const Text('گروه بویایی: شرقی گلی',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    );
  }

  // --- ۲. بخش قیمت و انتخاب حجم ---
  Widget _buildPriceAndSizeSection() {
    final sizes = [
      widget.perfume.bottleCapacity,
      '1 میل دکانت',
      '2 میل دکانت',
      '3 میل دکانت',
      '5 میل دکانت',
      '10 میل دکانت',
      '15 میل دکانت'
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          // قیمت
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.perfume.price,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(width: 5),
              const Text('تومان',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Text('انتخاب حجم',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 18),
          // گرید یا لیست انتخاب حجم‌ها
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: sizes.map((size) {
              final isSelected = widget.perfume.bottleCapacity == size;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.perfume.bottleCapacity = size;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF4A90E2)
                        : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF4A90E2)
                          : Colors.transparent,
                    ),
                  ),
                  child: Text(
                    size,
                    style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : const Color.fromARGB(172, 0, 0, 0),
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // --- ۳. بخش مشخصات فنی محصول ---
  Widget _buildSpecificationsSection() {
    final specs = [
      {'title': 'برند', 'value': widget.perfume.brand},
      {'title': 'جنسیت', 'value': widget.perfume.gender},
      {'title': 'طبع', 'value': widget.perfume.nature},
      {'title': 'مناسب فصل', 'value': widget.perfume.season},
      {'title': 'غلظت', 'value': widget.perfume.concentration},
      {'title': 'گروه بویایی', 'value': widget.perfume.fragranceFamily},
      {'title': 'سال عرضه', 'value': widget.perfume.year},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: specs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(specs[index]['title']!,
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(specs[index]['value']!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                          color: Colors.blueAccent)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // --- ۴. بخش تب‌بار داینامیک اول (مناسب برای / امتیازها) ---
  Widget _buildUsageContextSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              _buildCustomTab(
                title: 'مناسب برای',
                isActive: activeContextTab == 0,
                onTap: () => setState(() => activeContextTab = 0),
              ),
              const SizedBox(width: 12),
              _buildCustomTab(
                title: 'امتیاز ها',
                isActive: activeContextTab == 1,
                onTap: () => setState(() => activeContextTab = 1),
              ),
            ],
          ),
          const SizedBox(height: 24),
          activeContextTab == 0
              ? _buildUsageContextContent()
              : _buildRatingsContent(),
        ],
      ),
    );
  }

  Widget _buildUsageContextContent() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.perfume.usage.length,
      itemBuilder: (context, index) {
        final usage = widget.perfume.usage[index];
        final pct = usage['percentage'] as int;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Directionality(
            textDirection:
                TextDirection.ltr, // اجبارِ این بخش به لایوت چپ‌چین (LTR)
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // ۱. متن فارسی که حالا در سمت چپ‌ترین نقطه قرار می‌گیرد
                SizedBox(
                  width: 90,
                  child: Text(
                    usage['label'] as String,
                    textAlign: TextAlign.left, // تراز شدن خود متن به سمت چپ
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: pct / 60,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: usage['color'] as Color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '$pct%',
                        style: TextStyle(
                            color: (usage['color'] == Colors.amber[200])
                                ? Colors.black54
                                : Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRatingsContent() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.perfume.ratings.length,
      itemBuilder: (context, index) {
        final item = widget.perfume.ratings[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item['title'] as String,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C3E50)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    item['score'] as String,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: List.generate(5, (starIndex) {
                      return Icon(
                        starIndex < (item['stars'] as int)
                            ? Icons.star
                            : Icons.star_border,
                        color: const Color(0xFFFFD43B),
                        size: 22,
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // --- ۵. بخش تب‌بار داینامیک دوم (نت‌های بویایی / آکوردها) ---
  Widget _buildOlfactoryNotesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              _buildCustomTab(
                title: 'نت های بویایی',
                isActive: activeNotesTab == 0,
                onTap: () => setState(() => activeNotesTab = 0),
              ),
              const SizedBox(width: 12),
              _buildCustomTab(
                title: 'آکوردها',
                isActive: activeNotesTab == 1,
                onTap: () => setState(() => activeNotesTab = 1),
              ),
            ],
          ),
          const SizedBox(height: 24),
          activeNotesTab == 0 ? _buildNotesContent() : _buildAccordsContent(),
        ],
      ),
    );
  }

  Widget _buildNotesContent() {
    return Column(
      children: [
        _buildNoteRow('اولیه', widget.perfume.topNotes),
        const SizedBox(height: 16),
        _buildNoteRow('میانی', widget.perfume.middleNotes),
        const SizedBox(height: 16),
        _buildNoteRow('پایانی', widget.perfume.baseNotes),
      ],
    );
  }

  Widget _buildNoteRow(String type, List<String> ingredients) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 60,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 15.0, left: 10, right: 10, bottom: 10),
            child: Text(
              type,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 15),
            ),
          ),
        ),
        Expanded(
          child: Wrap(
            spacing: 16,
            runSpacing: 12,
            children: ingredients.map((item) {
              return Column(
                children: [
                  // شکل نوت ها
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NoteImages.all[item] != null
                        ? AssetImage(NoteImages.all[item]!)
                        : null,
                    child: NoteImages.all[item] == null
                        ? const Icon(Icons.spa_outlined)
                        : null,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildAccordsContent() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.perfume.accords.length,
      itemBuilder: (context, index) {
        final accord = widget.perfume.accords[index];
        final pct = accord['percentage'] as int;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Directionality(
            textDirection:
                TextDirection.ltr, // اجبارِ این بخش به لایوت چپ‌چین (LTR)
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // ۱. متن فارسی که حالا در سمت چپ‌ترین نقطه قرار می‌گیرد
                SizedBox(
                  width: 90,
                  child: Text(
                    accord['label'] as String,
                    textAlign: TextAlign.left, // تراز شدن خود متن به سمت چپ
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: pct / 60,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: accord['color'] as Color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '$pct%',
                        style: TextStyle(
                            color: (accord['color'] == Colors.amber[200])
                                ? Colors.black54
                                : Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // --- تابع کمکی ساخت دکمه‌های تب‌بار اختصاصی و لوکس ---
  Widget _buildCustomTab(
      {required String title,
      required bool isActive,
      required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            color: isActive
                ? Colors.lightBlue.withValues(alpha: .03)
                : Colors.grey.withValues(alpha: .05),
            border: const Border(
              bottom: BorderSide(
                color: Colors.black26,
                width: 3,
              ),
              left: BorderSide(
                color: Colors.black26,
                width: 1,
              ),
              top: BorderSide(
                color: Colors.black26,
                width: 1,
              ),
              right: BorderSide(
                color: Colors.black26,
                width: 1,
              ),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
              color: isActive ? Colors.blueAccent : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
