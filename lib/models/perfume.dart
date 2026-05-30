import 'package:flutter/material.dart';

class Perfume {
  final String price;
  final String id;
  final String name;
  final String farsiName;
  final String farsiBrand;
  final Gradient brandGradient;
  final String summery;
  final String brand;
  final String year;
  final String gender;
  final String concentration;
  final String rating;
  final List<String> topNotes;
  final List<String> middleNotes;
  final List<String> baseNotes;
  final List<String> accords;
  final String longevity;
  final String sillage;
  final String description;
  final bool inCollection;
  final bool inWishlist;
  final String image;
  final Color brandColor;

  Perfume({
    required this.id,
    required this.name,
    required this.brand,
    required this.year,
    required this.gender,
    required this.concentration,
    required this.rating,
    required this.topNotes,
    required this.middleNotes,
    required this.baseNotes,
    required this.accords,
    required this.longevity,
    required this.sillage,
    required this.description,
    this.inCollection = false,
    this.inWishlist = false,
    required this.image,
    required this.farsiName,
    required this.farsiBrand,
    required this.summery,
    required this.brandGradient,
    required this.brandColor, required this.price,
  });
}

final List<Perfume> mockPerfumes = [
  Perfume(
      id: '1',
      price: "37000000",
      brandColor: const Color.fromARGB(255, 71, 6, 1),
      brandGradient: const LinearGradient(
          colors: [Color(0xFF2D120F), Color(0xFFD18E38)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      farsiName: "الکساندریا 2",
      farsiBrand: "زرجوف",
      summery: "با الکساندریا 2 پادشاه زمستان باش",
      name: 'Alexandria II',
      brand: 'XERJOFF',
      year: '2012',
      gender: 'مردانه - زنانه',
      concentration: 'ادو پرفیوم',
      rating: '9 / 10',
      topNotes: ['سیب', 'اسطوخودوس', 'دارچین'],
      middleNotes: ['سدر ', 'رُز', 'گل برف'],
      baseNotes: ['کهربا', 'عود', 'مشک'],
      accords: ['چوبی', 'شرقی', 'ادویه‌ای', 'شیرین', 'کرمی'],
      longevity: '9/10',
      sillage: '9/10',
      description:
          '''عطری باشکوه، عمیق و سلطنتی از دنیای نیش‌پرفیوم‌هاست؛ رایحه‌ای که شکوه چوب عود را با لطافت اسطوخودوس، رز و وانیل در هم می‌آمیزد و حسی گرم، مخملی و اشرافی خلق می‌کند.
شروع عطر آرام و مرموز است، اما به‌تدریج به قلبی گرم و لوکس می‌رسد؛ جایی که چوب‌های شرقی، کهربا و مشک، امضایی فراموش‌نشدنی روی پوست باقی می‌گذارند.
الکساندریا ۲ عطری برای کسانی‌ست که به دنبال رایحه‌ای خاص، ماندگار و عمیق هستند؛ عطری که بیشتر شبیه یک تجربه هنری‌ست تا فقط یک عطر روزمره''',
      inCollection: true,
      image: 'assets/images/alex.webp'),
  Perfume(
      id: '2',
            price: "15000000",

      brandColor: const Color(0xFF0A1428),
      brandGradient: const LinearGradient(
          colors: [Color(0xFF0A1428), Color(0xFF429CD6)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      farsiName: "وای",
      farsiBrand: "ایوسن لورن",
      summery:
          "توی تابستون گرمته و میخوای خنک شی؟\n اینم عطر وای از برند ایسون لورن",
      name: 'Y Eau de Parfum',
      brand: 'YVES SAINT LAURENT ',
      year: '2018',
      gender: 'مردانه',
      concentration: 'ادو پرفیوم',
      rating: ' 8 / 10',
      topNotes: ['سیب', 'ترنج', 'زنجبیل'],
      middleNotes: ['شمعدانی', 'دانه سرو کوهی', 'سالویا'],
      baseNotes: ['سدر', 'چوب عنبر', 'خس خس', 'صمغ کندر'],
      accords: ['فرش', 'مصنوعی', 'شیرین', 'میوه‌ای'],
      longevity: '8/10',
      sillage: '7/10',
      description:
          '''یک عطر مدرن، همه‌کاره و به شدت محبوب که بر اساس سایت‌های مرجع، مظهر جذابیت و خلاقیت مردانه است. ترکیب این عطر بازی هوشمندانه‌ای بین شادابیِ میوه‌ای و تاریکیِ چوبی است.
 این عطر شروعی خنک و انرژی‌بخش با سیب سبز و زنجبیل، قلبی گیاهی از مریم‌گلی، و پایه‌ای گرم و ماندگار از چوب عنبر و دانه تونکا.
​ یک عطر «آچارفرانسه» واقعی؛ مناسب برای تمام فصول (جز روزهای خیلی داغ) و هماهنگ با هر دو استایل کژوال و رسمی.
​ پخش بوی بسیار قدرتمند و ماندگاری بالای ۸ ساعت که بازخورد مثبت (تعریف و تمجید) فراوانی از اطرافیان جذب می‌کند.''',
      inCollection: true,
      image: 'assets/images/y.webp'),
  Perfume(
      id: '3',
            price: "45000000",

      brandColor: const Color(0xFF421A07),
      brandGradient: const LinearGradient(
          colors: [Color(0xFF421A07), Color(0xFFEAA34F)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      farsiName: "آنجلز شیر",
      farsiBrand: "بای‌کیلیان",
      summery: "دوست دارید ذوج جذابی باشید؟ \nآنجلز شیر بای‌کیلیان بپوشید",
      name: 'Angels Share',
      brand: 'BY KILIAN',
      year: '2020',
      gender: 'مردانه - زنانه',
      concentration: 'ادو پرفیوم',
      rating: '9 / 10',
      topNotes: ['کنیاک'],
      middleNotes: ['دارچین', 'درخت بلوط', 'دانه تونکا'],
      baseNotes: ['پرالین', 'چوب صندل سفید', 'وانیل'],
      accords: ['شیرین', 'خوراکی', 'ادویه ای', 'چوبی'],
      longevity: '8/10',
      sillage: '8/10',
      description:
          '''شاهکاری وکس، گرم و شیرین (گورماند) که بر اساس سایت‌های مرجع، الهام‌گرفته از اصالت فرانسوی خانواده‌ی معروف «هنسی» و سهمِ تبخیرشده‌ی کنیاک از بشکه‌های چوبی است.
  شروعی الکلی و مجلل با کنیاک، قلبی گرم و ادویه‌ای از دارچین، دانه تونکا و چوب بلوط، و پایه‌ای به شدت اعتیادآور، شکلاتی و کرمی از پرالین و وانیل.
 عطری بی‌رقیب برای فصول سرد (پاییز و زمستان) و قرارهای خاص شبانه؛ حسی از ابهت، ثروت و در عین حال صمیمیت را تداعی می‌کند.
خط بو و پخش فوق‌العاده قدرتمند با ماندگاری طولانی‌مدت که جذابیت بالایی دارد و تحسین اطرافیان را به همراه می‌آورد.''',
      inCollection: true,
      inWishlist: true,
      image: 'assets/images/anf.webp'),
  Perfume(
      id: '4',
            price: "20000000",

      brandColor: const Color(0xFF040814),
      brandGradient: const LinearGradient(colors: [
        Color(0xFF040814),
        Color(0xFF1A325C),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      farsiName: "ساواج الکسیر",
      farsiBrand: "دیور",
      summery: "دوست داری رایحه اصالت رو بدونی؟\n ساواج الکسیر بزن",
      name: 'Sauvage Elixir',
      brand: 'DIOR',
      year: '2021',
      gender: 'مردانه',
      concentration: 'ادو پرفیوم',
      rating: '8.10',
      topNotes: ['هل', 'دارچین', 'گریپ فروت', 'جوز'],
      middleNotes: [
        'اسطوخودوس',
      ],
      baseNotes: ['کهربا', 'شیرین بیان', 'نعناع هندی', 'چوب صندل', 'خس خس'],
      accords: ['ادویه‌ای', 'چوبی', 'شیرین', 'فرش', 'مصنوعی'],
      longevity: '9/10',
      sillage: ': 9/10',
      description: '''

تاریک، ادویه‌ای و به شدت قدرتمند که بر اساس سایت‌های مرجع، نسخه‌ای بسیار غلیظ، لوکس و مدرن از خانواده‌ی محبوب ساواج است که روحی کلاسیک و باوقار دارد.
انفجاری تند، داغ و غنی از دارچین، جوز هندی و هل در ترکیب با گریپ‌فروت، قلبی بسیار باکیفیت و تمیز از اسطوخودوس (لوندر)، و پایه‌ای تاریک، چوبی و عمیق از شیرین‌بیان، چوب صندل و کهربا.
 مناسب فصول سرد (پاییز و زمستان)و موقعیت‌های رسمی یا شبانه؛ عطری جدی، کاریزماتیک و باابهت که حس پختگی و قدرت مردانه را تداعی می‌کند.
ماندگاری خوب همراه با پخش بو و خط بویی بسیار خوب که به راحتی فضای محیط را تحت تأثیر قرار می‌دهد.''',
      inCollection: true,
      inWishlist: true,
      image: 'assets/images/sav.webp'),
  Perfume(
      id: '5',
            price: "32000000",

      brandColor: const Color(0xFF5A3825),
      brandGradient: const LinearGradient(
          colors: [Color(0xFF5A3825), Color(0xFFD9BCA3)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      farsiName: "آلتیر",
      farsiBrand: "مارلی",
      summery: "اعتماد بهنفس بیشتر با مارلی التیر",
      name: 'Althaïr',
      brand: 'PARFUMS de MARLY',
      year: '2023',
      gender: 'مردانه',
      concentration: 'ادو پرفیوم',
      rating: '8 / 10',
      topNotes: ['ترنج', 'هل', 'دارچین', 'شکوفه پرتقال'],
      middleNotes: ['لامی', 'وانیل'],
      baseNotes: ['آمبروکسان', 'چوب گایاک', 'مشک', 'پرالین'],
      accords: ['شیرین', 'خوراکی', 'کرمی', 'ادویه‌ای'],
      longevity: '9/10',
      sillage: '8/10',
      description: '''
شاهکاری لوکس، مدرن و شیرین که بر اساس سایت‌های مرجع، ستایشی باشکوه و متفاوت از رایحه ارزشمند «وانیل بربون» است و تضادی هوشمندانه میان نت‌های ادویه‌ایِ گرم و تازگیِ مرکباتی ایجاد می‌کند.
 شروعی ادویه‌ای و نیمه‌شاداب با  دارچین، هل و شکوفه پرتقال ، قلبی غنی، کرمی و محوری از  وانیل بربون ، و پایه‌ای عمیق، تمیز و چوبی از چوب گایاک، آمبروکسان و مشک.
گزینه‌ای بی‌نظیر برای فصول سرد (پاییز و زمستان)؛ عطری فوق‌العاده جذاب برای قرارهای شبانه و استفاده روزمره در هوای خنک که حسی از شیک‌پوشی، ثروت، گرما و صمیمیت را ساطع می‌کند.
 ماندگاری بسیار طولانی‌مدت همراه با پخش بویی نرم و فریبنده که به دلیل ماهیت جذاب وانیل، به شدت آهنربای بازخورد مثبت و تعریف و تمجید اطرافیان است.''',
      inCollection: true,
      inWishlist: true,
      image: 'assets/images/mar.webp'),
];

final List<Perfume> myCollection =
    mockPerfumes.where((p) => p.inCollection).toList();
