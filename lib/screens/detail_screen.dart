import 'package:flutter/material.dart';
import 'package:parfumo_ui/models/perfume.dart';



class PerfumeProductScreen extends StatefulWidget {
  final Perfume perfume;
  const PerfumeProductScreen({super.key,required this.perfume});

  @override
  State<PerfumeProductScreen> createState() => _PerfumeProductScreenState();
}

class _PerfumeProductScreenState extends State<PerfumeProductScreen> {
  String selectedSize = 'عطر 90 میل';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ۱. بخش تصویر و اطلاعات اولیه محصول
              _buildProductHeaderSection(),
              
              const Divider(height: 32, thickness: 1, color: Color(0xFFF2F2F2)),

              // ۲. بخش قیمت و انتخاب حجم (بدون کادر دیجی‌کالا)
              _buildPriceAndSizeSection(),

              const Divider(height: 32, thickness: 1, color: Color(0xFFF2F2F2)),

              // ۳. جدول مشخصات فنی محصول
              _buildSpecificationsSection(),

              const Divider(height: 32, thickness: 1, color: Color(0xFFF2F2F2)),

              // ۴. نمودارهای موقعیت‌های مناسب استفاده
              _buildUsageContextSection(),

              const Divider(height: 32, thickness: 1, color: Color(0xFFF2F2F2)),

              // ۵. نت‌های بویایی (اولیه، میانی، پایانی)
              _buildOlfactoryNotesSection(),

              const Divider(height: 32, thickness: 1, color: Color(0xFFF2F2F2)),

              // ۶. بخش امتیازدهی کاربران
              _buildUserRatingSection(),
              
              const SizedBox(height: 40),
            ],
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
          // کد محصول
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'کد محصول: 13355',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          // تصویر محصول (در اینجا از یک آیکون/باکس فرضی استفاده شده، می‌توانید با Image.network جایگزین کنید)
          Center(
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.opacity, size: 120, color: Color(0xFF2C1A1D)), 
              // نکته: برای پروژه اصلی از Image.network("آدرس تصویر ورساچه") استفاده کنید.
            ),
          ),
          const SizedBox(height: 16),
          // امتیاز و ستاره‌ها
          Row(
            children: [
              const Text(
                '8 / 10',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
              const Spacer(),
              const Text(
                'گارانتی تضمین اصالت',
                style: TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.verified_user, color: Colors.green, size: 16),
            ],
          ),
          const SizedBox(height: 12),
          // عنوان محصول
          const Text(
            'ادکلن ورساچه کریستال نویر ادو پرفیوم (مشکی) | VERSACE Crystal Noir EDP',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1.5),
          ),
          const SizedBox(height: 12),
          // اطلاعات کوتاه زیر عنوان
          Row(
            children: const [
              Text('سال عرضه: 2004', style: TextStyle(color: Colors.grey, fontSize: 13)),
              SizedBox(width: 16),
              Text('گروه بویایی: شرقی گلی', style: TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }

  // --- ۲. بخش قیمت و انتخاب حجم ---
  Widget _buildPriceAndSizeSection() {
    final sizes = [
      'عطر 90 میل', '1 میل دکانت', '2 میل دکانت',
      '3 میل دکانت', '5 میل دکانت', '10 میل دکانت', '15 میل دکانت'
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // قیمت
          Row(
            children: const [
              Text(
                '15,149,000',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(width: 4),
              Text('تومان', style: TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),
          // راهنمای سایز دکانت
          Row(
            children: [
              const Text('انتخاب حجم', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const Spacer(),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.help_outline, size: 16, color: Colors.blue),
                label: const Text('راهنمای سایز دکانت', style: TextStyle(fontSize: 13, color: Colors.blue)),
              ),
            ],
          ),
          // گرید یا لیست انتخاب حجم‌ها
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: sizes.map((size) {
              final isSelected = selectedSize == size;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSize = size;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF4A90E2) : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? const Color(0xFF4A90E2) : Colors.transparent,
                    ),
                  ),
                  child: Text(
                    size,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontSize: 13,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          // دکمه افزودن به سبد خرید
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4A90E2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
              label: const Text(
                'افزودن به سبد خرید',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text('مشاوره رایگان + پشتیبانی', style: TextStyle(color: Colors.blue)),
            ),
          ),
        ],
      ),
    );
  }

  // --- ۳. بخش مشخصات فنی محصول ---
  Widget _buildSpecificationsSection() {
    final specs = [
      {'title': 'برند', 'value': 'Versace'},
      {'title': 'جنسیت', 'value': 'زنانه'},
      {'title': 'طبع', 'value': 'گرم'},
      {'title': 'مناسب فصل', 'value': 'پاییز و زمستان'},
      {'title': 'غلظت', 'value': 'ادو پرفیوم'},
      {'title': 'گروه بویایی', 'value': 'شرقی گلی'},
      {'title': 'سال عرضه', 'value': '2004'},
      {'title': 'کشور مبدأ', 'value': 'ایتالیا'},
      {'title': 'عطار', 'value': 'آنتوان لی'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('مشخصات محصول', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
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
                  Text(specs[index]['title']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 4),
                  Text(specs[index]['value']!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.blueGrey)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // --- ۴. بخش نمودارهای موقعیت‌های مناسب استفاده ---
  Widget _buildUsageContextSection() {
    final usages = [
      {'label': 'عصرگاهی', 'percentage': 27, 'color': Colors.grey},
      {'label': 'شب گردی', 'percentage': 26, 'color': Colors.brown},
      {'label': 'اوقات فراغت', 'percentage': 17, 'color': Colors.orangeAccent},
      {'label': 'روزانه', 'percentage': 15, 'color': Colors.amber[200]},
      {'label': 'محل کار', 'percentage': 13, 'color': Colors.purple[300]},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('مناسب برای', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: usages.length,
            itemBuilder: (context, index) {
              final usage = usages[index];
              final pct = usage['percentage'] as int;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 90,
                      child: Text(usage['label'] as String, style: const TextStyle(fontSize: 13)),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 24,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: pct / 100,
                            child: Container(
                              height: 24,
                              decoration: BoxDecoration(
                                color: usage['color'] as Color,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                '$pct%',
                                style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // --- ۵. بخش نت‌های بویایی ---
  Widget _buildOlfactoryNotesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('نت های بویایی', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _buildNoteRow('اولیه', ['هل', 'زنجبیل', 'فلفل']),
          const SizedBox(height: 16),
          _buildNoteRow('میانی', ['نارگیل', 'گاردنیای یاسمنی', 'شکوفه پرتقال', 'گل صدتومانی']),
          const SizedBox(height: 16),
          _buildNoteRow('پایانی', ['کهربا', 'مشک', 'چوب صندل سفید']),
        ],
      ),
    );
  }

  Widget _buildNoteRow(String type, List<String> ingredients) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              type,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14),
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
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: const Color(0xFFF5F5F5),
                    child: Icon(Icons.blur_on, color: Colors.grey[700], size: 24),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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

  // --- ۶. بخش امتیازدهی کاربران ---
  Widget _buildUserRatingSection() {
    final ratingCategories = ['رایحه', 'ماندگاری', 'پخش بو', 'ارزش نسبت به قیمت'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('ثبت نظر', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            'از دید شما ادکلن ورساچه کریستال نویر ادو پرفیوم (مشکی) چه امتیازی میخواهد؟',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ratingCategories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        ratingCategories[index],
                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: List.generate(5, (starIndex) {
                          return const Icon(
                            Icons.star_border,
                            color: Colors.amber,
                            size: 26,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}