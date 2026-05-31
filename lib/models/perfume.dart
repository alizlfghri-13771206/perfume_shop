import 'package:flutter/material.dart';
import 'package:atramin/models/constants.dart';

class Perfume {
  final String price;
  final String id;
  final String name;
  final String farsiName;
  final String farsiBrand;
  final Gradient brandGradient;
  final String summery;
  final String brand;
  final int priceinInt;
  final List<Map> usage;
  final List<Map> ratings;
  String bottleCapacity;
  final String season;
  final String nature;
  final String fragranceFamily;
  final String year;
  final String gender;
  final String concentration;
  final String rating;
  final List<String> topNotes;
  final List<String> middleNotes;
  final List<String> baseNotes;
  final List<Map> accords;
  final String longevity;
  final String sillage;
  final String description;
  final bool inCollection;
  bool inWishlist;
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
    required this.inWishlist,
    required this.image,
    required this.farsiName,
    required this.farsiBrand,
    required this.summery,
    required this.brandGradient,
    required this.brandColor,
    required this.price,
    required this.hasDecant,
    required this.bottleCapacity,
    required this.season,
    required this.nature,
    required this.fragranceFamily,
    required this.usage,
    required this.ratings,
    required this.priceinInt,
  });

  static final List<Perfume> mockPerfumes = [
    Perfume(
        id: '1',
        hasDecant: false,
        inWishlist: false,
        usage: [
          {'label': 'عصرگاهی', 'percentage': 36, 'color': Colors.grey},
          {'label': 'شب گردی', 'percentage': 35, 'color': Colors.brown},
          {
            'label': 'اوقات فراغت',
            'percentage': 15,
            'color': Colors.orangeAccent
          },
          {'label': 'روزانه', 'percentage': 7, 'color': Colors.amber[200]},
          {'label': 'محل کار', 'percentage': 7, 'color': Colors.purple[300]},
        ],
        ratings: [
          {'title': 'رایحه', 'score': '9 / 10', 'stars': 4},
          {'title': 'ماندگاری', 'score': '9 / 10', 'stars': 4},
          {'title': 'پخش بو', 'score': '9/ 10', 'stars': 4},
          {'title': 'ارزش خرید نسبت به قیمت', 'score': '7 / 10', 'stars': 3},
        ],
        price: "67,689,000",
        priceinInt: 67689000,
        bottleCapacity: "عطر 100 میل",
        season: "پاییز و زمستان",
        nature: "گرم",
        fragranceFamily: "شرقی چوبی",
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
        accords: [
          {'label': 'چوبی', 'percentage': 23, 'color': AcordsColor.choobi},
          {'label': 'شرقی', 'percentage': 23, 'color': AcordsColor.sharghi},
          {'label': 'ادویه‌ای', 'percentage': 19, 'color': AcordsColor.advieh},
          {'label': 'شیرین', 'percentage': 12, 'color': AcordsColor.shirin},
          {'label': 'گلی', 'percentage': 9, 'color': AcordsColor.goli},
        ],
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
        inWishlist: false,
        ratings: [
          {'title': 'رایحه', 'score': '8 / 10', 'stars': 4},
          {'title': 'ماندگاری', 'score': '8/ 10', 'stars': 4},
          {'title': 'پخش بو', 'score': '7/ 10', 'stars': 3},
          {'title': 'ارزش خرید نسبت به قیمت', 'score': '8 / 10', 'stars': 4},
        ],
        usage: [
          {'label': 'روزانه', 'percentage': 23, 'color': Colors.amber[200]},
          {
            'label': 'اوقات فراغت',
            'percentage': 21,
            'color': Colors.orangeAccent
          },
          {'label': 'محل کار', 'percentage': 18, 'color': Colors.purple[300]},
          {'label': 'عصرگاهی', 'percentage': 12, 'color': Colors.grey},
          {'label': 'شب گردی', 'percentage': 12, 'color': Colors.brown},
        ],
        hasDecant: false,
        price: "20,790,000",
        priceinInt: 20790000,
        bottleCapacity: "عطر 100 میل",
        season: "چهارفصل",
        nature: "معتدل",
        fragranceFamily: "معطر فوژه",
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
        accords: [
          {'label': 'فرش', 'percentage': 22, 'color': AcordsColor.fresh},
          {'label': 'مصنوعی', 'percentage': 20, 'color': AcordsColor.masnooee},
          {'label': 'شیرین', 'percentage': 18, 'color': AcordsColor.shirin},
          {'label': 'میوه‌ای', 'percentage': 13, 'color': AcordsColor.miveh},
        ],
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
        inWishlist: false,
        usage: [
          {'label': 'عصرگاهی', 'percentage': 35, 'color': Colors.grey},
          {'label': 'شب گردی', 'percentage': 34, 'color': Colors.brown},
          {
            'label': 'اوقات فراغت',
            'percentage': 18,
            'color': Colors.orangeAccent
          },
          {'label': 'روزانه', 'percentage': 7, 'color': Colors.amber[200]},
          {'label': 'محل کار', 'percentage': 6, 'color': Colors.purple[300]},
        ],
        ratings: [
          {'title': 'رایحه', 'score': '9 / 10', 'stars': 4},
          {'title': 'ماندگاری', 'score': '8/ 10', 'stars': 4},
          {'title': 'پخش بو', 'score': '8/ 10', 'stars': 4},
          {'title': 'ارزش خرید نسبت به قیمت', 'score': '7 / 10', 'stars': 3},
        ],
        hasDecant: true,
        price: "43,998,000",
        priceinInt: 43998000,
        bottleCapacity: "عطر 50 میل",
        season: "پاییز و زمستان",
        nature: "گرم",
        fragranceFamily: "شرقی وانیلی",
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
        accords: [
          {'label': 'شیرین', 'percentage': 27, 'color': AcordsColor.shirin},
          {'label': 'خوراکی', 'percentage': 25, 'color': AcordsColor.khoraki},
          {'label': 'ادویه‌ای', 'percentage': 20, 'color': AcordsColor.advieh},
          {'label': 'چوبی', 'percentage': 13, 'color': AcordsColor.choobi},
        ],
        longevity: '8/10',
        sillage: '8/10',
        description:
            '''شاهکاری وکس، گرم و شیرین (گورماند) که بر اساس سایت‌های مرجع، الهام‌گرفته از اصالت فرانسوی خانواده‌ی معروف «هنسی» و سهمِ تبخیرشده‌ی کنیاک از بشکه‌های چوبی است.
  شروعی الکلی و مجلل با کنیاک، قلبی گرم و ادویه‌ای از دارچین، دانه تونکا و چوب بلوط، و پایه‌ای به شدت اعتیادآور، شکلاتی و کرمی از پرالین و وانیل.
 عطری بی‌رقیب برای فصول سرد (پاییز و زمستان) و قرارهای خاص شبانه؛ حسی از ابهت، ثروت و در عین حال صمیمیت را تداعی می‌کند.
خط بو و پخش فوق‌العاده قدرتمند با ماندگاری طولانی‌مدت که جذابیت بالایی دارد و تحسین اطرافیان را به همراه می‌آورد.''',
        inCollection: true,
        image: 'assets/images/anf.webp'),
    Perfume(
        id: '4',
        inWishlist: false,
        usage: [
          {'label': 'روزانه', 'percentage': 27, 'color': Colors.amber[200]},
          {'label': 'محل کار', 'percentage': 26, 'color': Colors.purple[300]},
          {
            'label': 'اوقات فراغت',
            'percentage': 25,
            'color': Colors.orangeAccent
          },
          {'label': 'شب گردی', 'percentage': 12, 'color': Colors.brown},
          {'label': 'عصرگاهی', 'percentage': 10, 'color': Colors.grey},
        ],
        ratings: [
          {'title': 'رایحه', 'score': '7 / 10', 'stars': 3},
          {'title': 'ماندگاری', 'score': '7 / 10', 'stars': 3},
          {'title': 'پخش بو', 'score': '6/ 10', 'stars': 3},
          {'title': 'ارزش خرید نسبت به قیمت', 'score': '8 / 10', 'stars': 4},
        ],
        bottleCapacity: "عطر 100 میل",
        season: "بهار و تابستان",
        nature: "خنک",
        fragranceFamily: "گلی چوبی",
        hasDecant: true,
        price: "6,607,000",
        priceinInt: 6607000,
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
        accords: [
          {'label': 'گلی', 'percentage': 31, 'color': AcordsColor.goli},
          {'label': 'فرش', 'percentage': 23, 'color': AcordsColor.fresh},
          {'label': 'شیرین', 'percentage': 14, 'color': AcordsColor.shirin},
          {'label': 'پودری', 'percentage': 11, 'color': AcordsColor.poodry},
        ],
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
        inWishlist: false,
        hasDecant: true,
        usage: [
          {'label': 'عصرگاهی', 'percentage': 31, 'color': Colors.grey},
          {'label': 'شب گردی', 'percentage': 29, 'color': Colors.brown},
          {
            'label': 'اوقات فراغت',
            'percentage': 19,
            'color': Colors.orangeAccent
          },
          {'label': 'روزانه', 'percentage': 12, 'color': Colors.amber[200]},
          {'label': 'محل کار', 'percentage': 9, 'color': Colors.purple[300]},
        ],
        ratings: [
          {'title': 'رایحه', 'score': '8 / 10', 'stars': 4},
          {'title': 'ماندگاری', 'score': '9 / 10', 'stars': 4},
          {'title': 'پخش بو', 'score': '8/ 10', 'stars': 4},
          {'title': 'ارزش خرید نسبت به قیمت', 'score': '7 / 10', 'stars': 3},
        ],
        price: "56,408,000",
        priceinInt: 56408000,
        bottleCapacity: "عطر 125 میل",
        season: "پاییز و زمستان",
        nature: "گرم",
        fragranceFamily: "شرقی وانیلی",
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
        accords: [
          {'label': 'شیرین', 'percentage': 25, 'color': AcordsColor.shirin},
          {'label': 'خوراکی', 'percentage': 22, 'color': AcordsColor.khoraki},
          {'label': 'کرمی', 'percentage': 18, 'color': AcordsColor.creamy},
          {'label': 'ادویه‌ای', 'percentage': 14, 'color': AcordsColor.advieh},
        ],
        longevity: '9/10',
        sillage: '8/10',
        description: '''
شاهکاری لوکس، مدرن و شیرین که بر اساس سایت‌های مرجع، ستایشی باشکوه و متفاوت از رایحه ارزشمند «وانیل بربون» است و تضادی هوشمندانه میان نت‌های ادویه‌ایِ گرم و تازگیِ مرکباتی ایجاد می‌کند.
 شروعی ادویه‌ای و نیمه‌شاداب با  دارچین، هل و شکوفه پرتقال ، قلبی غنی، کرمی و محوری از  وانیل بربون ، و پایه‌ای عمیق، تمیز و چوبی از چوب گایاک، آمبروکسان و مشک.
گزینه‌ای بی‌نظیر برای فصول سرد (پاییز و زمستان)؛ عطری فوق‌العاده جذاب برای قرارهای شبانه و استفاده روزمره در هوای خنک که حسی از شیک‌پوشی، ثروت، گرما و صمیمیت را ساطع می‌کند.
 ماندگاری بسیار طولانی‌مدت همراه با پخش بویی نرم و فریبنده که به دلیل ماهیت جذاب وانیل، به شدت آهنربای بازخورد مثبت و تعریف و تمجید اطرافیان است.''',
        inCollection: true,
        image: 'assets/images/mar.webp'),
    Perfume(
        id: '6',
        usage: [
          {'label': 'روزانه', 'percentage': 22, 'color': Colors.amber[200]},
          {'label': 'عصرگاهی', 'percentage': 21, 'color': Colors.grey},
          {'label': 'شب گردی', 'percentage': 21, 'color': Colors.brown},
          {'label': 'محل کار', 'percentage': 18, 'color': Colors.purple[300]},
          {
            'label': 'اوقات فراغت',
            'percentage': 18,
            'color': Colors.orangeAccent
          },
        ],
        ratings: [
          {'title': 'رایحه', 'score': '8 / 10', 'stars': 4},
          {'title': 'ماندگاری', 'score': '8 / 10', 'stars': 4},
          {'title': 'پخش بو', 'score': '8/ 10', 'stars': 4},
          {'title': 'ارزش خرید نسبت به قیمت', 'score': '7 / 10', 'stars': 3},
        ],
        hasDecant: false,
        price: "45,751,000",
        priceinInt: 45751000,
        bottleCapacity: "عطر 100 میل",
        season: "چهارفصل",
        nature: "معتدل",
        fragranceFamily: "شرقی گلی",
        brandColor: const Color(0xFF0A1428),
        brandGradient: const LinearGradient(
            colors: [Color(0xFFBE7C71), Color(0xFFF7E5DF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        farsiName: "کوکو مادمازل",
        farsiBrand: "شنل",
        summery: "با کوکو مادمازل،  یک مادمازل واقعی شو",
        name: 'Coco',
        brand: 'CHANEL ',
        year: '2001',
        inWishlist: false,
        gender: 'زنانه',
        concentration: 'ادو پرفیوم',
        rating: ' 8 / 10',
        topNotes: [
          'ترنج',
          'گریپ فروت',
        ],
        middleNotes: ['یاس', 'سرخالو', 'رُز'],
        baseNotes: ['مشک', 'نعناع هندی', 'خس خس', 'وانیل'],
        accords: [
          {'label': 'گلی', 'percentage': 24, 'color': AcordsColor.goli},
          {'label': 'شیرین', 'percentage': 16, 'color': AcordsColor.shirin},
          {'label': 'فرش', 'percentage': 12, 'color': AcordsColor.fresh},
          {'label': 'میوه‌ای', 'percentage': 12, 'color': AcordsColor.miveh},
        ],
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
        usage: [
          {'label': 'عصرگاهی', 'percentage': 28, 'color': Colors.grey},
          {'label': 'شب گردی', 'percentage': 28, 'color': Colors.brown},
          {
            'label': 'اوقات فراغت',
            'percentage': 18,
            'color': Colors.orangeAccent
          },
          {'label': 'روزانه', 'percentage': 14, 'color': Colors.amber[200]},
          {'label': 'محل کار', 'percentage': 13, 'color': Colors.purple[300]},
        ],
        ratings: [
          {'title': 'رایحه', 'score': '8 / 10', 'stars': 4},
          {'title': 'ماندگاری', 'score': '9 / 10', 'stars': 4},
          {'title': 'پخش بو', 'score': '9/ 10', 'stars': 4},
          {'title': 'ارزش خرید نسبت به قیمت', 'score': '7 / 10', 'stars': 3},
        ],
        hasDecant: false,
        price: "34,651,000",
        priceinInt: 34651000,
        bottleCapacity: "عطر 60 میل",
        season: "پاییز و زمستان",
        nature: "گرم",
        fragranceFamily: "رایحه‌های معطر",
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
        accords: [
          {'label': 'ادویه‌ای', 'percentage': 26, 'color': AcordsColor.advieh},
          {'label': 'چوبی', 'percentage': 21, 'color': AcordsColor.choobi},
          {'label': 'شیرین', 'percentage': 16, 'color': AcordsColor.shirin},
          {'label': 'فرش', 'percentage': 13, 'color': AcordsColor.fresh},
          {'label': 'مصنوعی', 'percentage': 11, 'color': AcordsColor.masnooee},
        ],
        longevity: '9/10',
        sillage: ': 9/10',
        description: '''

تاریک، ادویه‌ای و به شدت قدرتمند که بر اساس سایت‌های مرجع، نسخه‌ای بسیار غلیظ، لوکس و مدرن از خانواده‌ی محبوب ساواج است که روحی کلاسیک و باوقار دارد.
انفجاری تند، داغ و غنی از دارچین، جوز هندی و هل در ترکیب با گریپ‌فروت، قلبی بسیار باکیفیت و تمیز از اسطوخودوس (لوندر)، و پایه‌ای تاریک، چوبی و عمیق از شیرین‌بیان، چوب صندل و کهربا.
 مناسب فصول سرد (پاییز و زمستان)و موقعیت‌های رسمی یا شبانه؛ عطری جدی، کاریزماتیک و باابهت که حس پختگی و قدرت مردانه را تداعی می‌کند.
ماندگاری خوب همراه با پخش بو و خط بویی بسیار خوب که به راحتی فضای محیط را تحت تأثیر قرار می‌دهد.''',
        inCollection: true,
        inWishlist: false,
        image: 'assets/images/sav.webp'),
  ];

  static List<Perfume> addedToCartPlants() {
    List<Perfume> selectedPlants = Perfume.mockPerfumes;
    return selectedPlants
        .where((element) => element.inWishlist == true)
        .toList();
  }
}
