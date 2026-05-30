class Events {
  final String title;
  final String content;
  final String image;

  Events({required this.title, required this.content, required this.image});

static final List<Events> events = [
  Events(
    title: "Essential Parfums Bois Impérial Extrait 2024",
    content:
        "کمتر از سه هفته از معرفی رسمی این عطر میگذره که عطرآمین برای دکانت موجود کرده",
    image: "assets/images/e/3.jpg",
  ),

  Events(
    title: "Giorgio Armani Acqua di Gio Profondo Parfum",
    content: "جدیدترین عطر لاین آکوا دی جیو 2024 به دکانت ها اضافه شد",
    image: "assets/images/e/1.jpg",
  ),

  Events(
    title: "Encre indigo Lalique",
    content:
        "دکانت این عطر جدید هم اضافه شد.",
    image: "assets/images/e/4.jpg",
  ),

  Events(
    title: "مقایسه تام فورد توسکان لدر و آکوا دی پارما لدر ادوپرفیوم",
    content:
        "یک مقایسه کامل و موشکافانه",
    image: "assets/images/e/2.jpg",
  ),
];
}
