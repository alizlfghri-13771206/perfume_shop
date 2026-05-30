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
  final bool hasDecant;

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
    required this.brandColor,
    required this.price,
    required this.hasDecant,
  });
}

final List<Perfume> mockPerfumes = [
  Perfume(
      id: '1',
      hasDecant: false,
      price: "67689000",
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
      hasDecant: false,
      price: "20790000",
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
      hasDecant: true,
      price: "43998000",
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
      hasDecant: true,
      price: "6600000",
      brandColor: const Color(0xFF0A1428),
      brandGradient: const LinearGradient(
          colors: [Color(0xFFCC968C), Color(0xFFFAF0ED)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      farsiName: "لامور",
      farsiBrand: "لالیک",
      summery: "ظرافت زنانه‌ت رو با لالیک لامور به رخ بکش",
      name: 'L-Amour',
      brand: 'LALIQUE',
      year: '2013',
      gender: 'زنانه',
      concentration: 'ادو پرفیوم',
      rating: ' 7 / 10',
      topNotes: ['ترنج', 'بهار نارنج', 'رُز'],
      middleNotes: ['گاردنیای یاسمنی', 'یاس', 'گل مریم'],
      baseNotes: ['سدر', 'مشک', 'چوب صندل'],
      accords: ['گلی', 'فرش', 'شیرین', 'پودری'],
      longevity: '7/10',
      sillage: '6/10',
      description:
          ''' شاهکاری لطیف، رمانتیک و مظهر ظرافت زنانه، الهام‌گرفته از هنر ژاپنی و اعلام عشقی خالص و گلی به زیباییِ بی‌پایان است.
 شروعی شاداب، مرکباتی و تمیز از بهارنارنج ، ترنج و رز، قلبی غنی و فوق‌العاده رویایی از دسته‌ای از گل‌های سفید مثل یاس، گاردنیا و مریم، و پایه‌ای نرم، پودری و آرامش‌بخش از مشک، چوب سدر و صندل.
 گزینه‌ای بی‌رقیب برای فصول گرم (بهار و تابستان) و استفاده روزمره؛ عطری ایده‌آل برای محیط‌های اداری، دانشگاه، یا قرارهای دوستانه .
 پخش بویی ملایم، محترم و کاملاً صمیمی همراه با ماندگاری متوسطکه بازخوردی به شدت مثبت، آرامش‌بخش و کاملاً بی‌آزار از اطرافیان جذب می‌کند.''',
      inCollection: true,
      image: 'assets/images/lali.webp'),
  Perfume(
      id: '5',
      hasDecant: true,
      price: "56408000",
      brandColor: const Color(0xFF5A3825),
      brandGradient: const LinearGradient(
          colors: [Color(0xFF5A3825), Color(0xFFD9BCA3)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      farsiName: "آلتیر",
      farsiBrand: "مارلی",
      summery: "اعتماد به نفس بیشتر با مارلی التیر",
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
  Perfume(
      id: '6',
      hasDecant: false,
      price: "45751000",
      brandColor: const Color(0xFF0A1428),
      brandGradient: const LinearGradient(
          colors: [Color(0xFFBE7C71), Color(0xFFF7E5DF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      farsiName: "کوکو مادمازل",
      farsiBrand: "شنل",
      summery:
          "با کوکو مادمازل،  یک مادمازل واقعی شو",
      name: 'Coco',
      brand: 'CHANEL ',
      year: '2001',
      gender: 'زنانه',
      concentration: 'ادو پرفیوم',
      rating: ' 8 / 10',
      topNotes: ['ترنج', 'گریپ فروت', 'پرتقال'],
      middleNotes: ['یاس', 'سرخالو', 'رُز'],
      baseNotes: ['مشک', 'نعناع هندی', 'خس خس', 'وانیل'],
      accords: ['گلی', 'شیرین', 'فرش', 'میوه‌ای'],
      longevity: '8/10',
      sillage: '7/10',
      description:
          '''رایحه‌ای مجلل، مستقل و مظهر شیک‌پوشی پاریسی که بر اساس سایت‌های مرجع، عطری مدرن، پرانرژی و در عین حال به شدت باوقار است.
شروعی درخشان، مرکباتی و گازدار از پرتقال، ماندارین و شکوفه پرتقال، قلبی مجلل، باران‌خورده و گلی از رز ترکی، یاسمن و یلانگ-یلانگ، و پایه‌ای به شدت نمادین، اشرافی و امضامانند از نعناع هندی (پاتچولی)، مشک سفید، وانیل و خس‌خس (وتیور).
ملکه بی‌رقیبِ عطرهای چهارفصل زنانه؛ گزینه‌ای ایده‌آل به عنوان عطر امضا، جلسات مهم کاری، مهمانی‌ها یا استفاده روزمره که حسی از ثروت، اعتمادبه‌نفس، مدرنیته و ظرافتِ هم‌زمان را تداعی می‌کند.

''',
      inCollection: true,
      image: 'assets/images/coco.webp'),
  Perfume(
      id: '7',
      hasDecant: false,
      price: "34651000",
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
];

final List<Perfume> myCollection =
    mockPerfumes.where((p) => p.inCollection).toList();
