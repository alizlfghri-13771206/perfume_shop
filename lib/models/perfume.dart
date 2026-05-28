import 'package:flutter/material.dart';

class Perfume {
  final String id;
  final String name;
  final String brand;
  final String year;
  final String gender;
  final String concentration;
  final double rating;
  final int votes;
  final List<String> topNotes;
  final List<String> middleNotes;
  final List<String> baseNotes;
  final List<String> accords;
  final String longevity;
  final String sillage;
  final String description;
  final bool inCollection;
  final bool inWishlist;

  const Perfume({
    required this.id,
    required this.name,
    required this.brand,
    required this.year,
    required this.gender,
    required this.concentration,
    required this.rating,
    required this.votes,
    required this.topNotes,
    required this.middleNotes,
    required this.baseNotes,
    required this.accords,
    required this.longevity,
    required this.sillage,
    required this.description,
    this.inCollection = false,
    this.inWishlist = false,
  });
}

final List<Perfume> mockPerfumes = [
  const Perfume(
    id: '1',
    name: 'Alexandria II',
    brand: 'XERJOFF',
    year: '2012',
    gender: 'مردانه - زننانه',
    concentration: 'ادو پرفیوم',
    rating: 9 / 10,
    votes: 12840,
    topNotes: ['apple', 'Lavender', 'Cinnamon'],
    middleNotes: ['Cedar ', 'Rose', 'Snowdrop'],
    baseNotes: ['Amber', 'Oud', 'Musk'],
    accords: ['Woody', 'Oriental', 'Spicy', 'Sweet', 'Creamy'],
    longevity: '9/10',
    sillage: '9/10',
    description:
        '''عطری باشکوه، عمیق و سلطنتی از دنیای نیش‌پرفیوم‌هاست؛ رایحه‌ای که شکوه چوب عود را با لطافت اسطوخودوس، رز و وانیل در هم می‌آمیزد و حسی گرم، مخملی و اشرافی خلق می‌کند.
شروع عطر آرام و مرموز است، اما به‌تدریج به قلبی گرم و لوکس می‌رسد؛ جایی که چوب‌های شرقی، کهربا و مشک، امضایی فراموش‌نشدنی روی پوست باقی می‌گذارند.
الکساندریا ۲ عطری برای کسانی‌ست که به دنبال رایحه‌ای خاص، ماندگار و عمیق هستند؛ عطری که بیشتر شبیه یک تجربه هنری‌ست تا فقط یک عطر روزمره''',
    inCollection: true,
  ),
  const Perfume(
    id: '2',
    name: 'Bleu de Chanel',
    brand: 'Chanel',
    year: '2010',
    gender: 'Men',
    concentration: 'Eau de Parfum',
    rating: 4.4,
    votes: 18250,
    topNotes: ['Citrus', 'Mint', 'Pink Pepper'],
    middleNotes: ['Ginger', 'Nutmeg', 'Jasmine', 'Iso E Super'],
    baseNotes: ['Cedar', 'Sandalwood', 'Frankincense', 'Vetiver'],
    accords: ['Woody', 'Aromatic', 'Citrus', 'Fresh Spicy'],
    longevity: 'Long Lasting',
    sillage: '',
    description:
        'A woody aromatic fragrance that embodies free-spirited masculinity. A bold, decisive scent that breaks free from convention.',
    inCollection: false,
  ),
  const Perfume(
    id: '3',
    name: 'Black Orchid',
    brand: 'Tom Ford',
    year: '2006',
    gender: 'Unisex',
    concentration: 'Eau de Parfum',
    rating: 4.3,
    votes: 9870,
    topNotes: ['Truffle', 'Gardenia', 'Black Currant', 'Ylang-Ylang'],
    middleNotes: ['Orchid', 'Spices', 'Lotus Wood', 'Fruity Notes'],
    baseNotes: ['Patchouli', 'Vetiver', 'Sandalwood', 'Vanilla', 'Oakmoss'],
    accords: ['Dark', 'Woody', 'Floral', 'Sweet', 'Earthy'],
    longevity: 'Very Long Lasting',
    sillage: '',
    description:
        'A rich, dark, and sensual fragrance. Black Orchid is a luxurious and sensual fragrance of rich, dark accords and an alluring potion of black orchids.',
    inCollection: true,
    inWishlist: false,
  ),
  const Perfume(
    id: '4',
    name: 'Santal 33',
    brand: 'Le Labo',
    year: '2011',
    gender: 'Unisex',
    concentration: 'Eau de Parfum',
    rating: 4.2,
    votes: 7650,
    topNotes: ['Cardamom', 'Iris', 'Violet', 'Ambrette'],
    middleNotes: [
      'Sandalwood',
      'Australian Sandalwood',
      'Cedarwood',
      'Leather'
    ],
    baseNotes: ['Musk', 'Papyrus', 'Amber'],
    accords: ['Woody', 'Smoky', 'Leather', 'Warm Spicy', 'Powdery'],
    longevity: 'Long Lasting',
    sillage: ': Color(0xFF8B6E4A)',
    description:
        'A woody, smoky scent that captures the spirit of the American Southwest. Sandalwood and cedarwood create a warm, intimate trail.',
    inCollection: false,
    inWishlist: true,
  ),
  const Perfume(
    id: '5',
    name: 'La Vie Est Belle',
    brand: 'Lancôme',
    year: '2012',
    gender: 'Women',
    concentration: 'Eau de Parfum',
    rating: 4.1,
    votes: 15300,
    topNotes: ['Blackcurrant', 'Pear'],
    middleNotes: ['Iris', 'Jasmine', 'Orange Blossom'],
    baseNotes: ['Praline', 'Vanilla', 'Patchouli', 'Sandalwood'],
    accords: ['Sweet', 'Floral', 'Powdery', 'Fruity', 'Gourmand'],
    longevity: 'Long Lasting',
    sillage: '',
    description:
        'An iris gourmand with praline, vanilla and patchouli. La Vie Est Belle — life is beautiful — an ode to happiness and the freedom to choose one\'s own path.',
    inCollection: true,
    inWishlist: false,
  ),
  const Perfume(
    id: '6',
    name: 'Aventus',
    brand: 'Creed',
    year: '2010',
    gender: 'Men',
    concentration: 'Eau de Parfum',
    rating: 4.6,
    votes: 22100,
    topNotes: ['Pineapple', 'Bergamot', 'Apple', 'Blackcurrant'],
    middleNotes: ['Rose', 'Dry Birch', 'Moroccan Jasmine', 'Patchouli'],
    baseNotes: ['Musk', 'Oakmoss', 'Ambergris', 'Vanilla'],
    accords: ['Fruity', 'Woody', 'Smoky', 'Fresh', 'Chypre'],
    longevity: 'Long Lasting',
    sillage: '',
    description:
        'Celebrating the life of Napoleon Bonaparte — his ambition, power and determination — Aventus opens with a burst of fruity freshness.',
    inCollection: false,
    inWishlist: true,
  ),
];

final List<Perfume> myCollection =
    mockPerfumes.where((p) => p.inCollection).toList();
