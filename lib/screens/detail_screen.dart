import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/perfume.dart';
import '../widgets/perfume_bottle.dart';

class DetailScreen extends StatefulWidget {
  final Perfume perfume;
  const DetailScreen({super.key, required this.perfume});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isWishlisted = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _isWishlisted = widget.perfume.inWishlist;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.perfume;
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: CustomScrollView(
        slivers: [
          // Hero Header
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppColors.bg,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.bgCard,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.divider),
                ),
                child: const Icon(Icons.arrow_back_ios_new, size: 16),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => setState(() => _isWishlisted = !_isWishlisted),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.bgCard,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: Icon(
                    _isWishlisted ? Icons.bookmark : Icons.bookmark_border,
                    color: _isWishlisted ? AppColors.gold : AppColors.creamDim,
                    size: 18,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.bgCard,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.divider),
                ),
                child: const Icon(
                  Icons.share_outlined,
                  color: AppColors.creamDim,
                  size: 18,
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.bgSurface.withOpacity(0.5),
                      AppColors.bg,
                    ],
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Glow
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      child: PerfumeBottleWidget(perfume: p, size: 200),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand + Year
                  Row(
                    children: [
                      Text(
                        p.brand.toUpperCase(),
                        style: const TextStyle(
                          color: AppColors.gold,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: AppColors.creamDim,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        p.year,
                        style: const TextStyle(
                          color: AppColors.creamDim,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    p.name,
                    style: const TextStyle(
                      color: AppColors.cream,
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    p.concentration,
                    style: const TextStyle(
                      color: AppColors.creamDim,
                      fontSize: 13,
                    ),
                  ),

                  // Rating Row
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _RatingBadge(rating: p.rating),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (i) => Icon(
                                i < p.rating.floor()
                                    ? Icons.star
                                    : (i < p.rating
                                          ? Icons.star_half
                                          : Icons.star_border),
                                color: AppColors.gold,
                                size: 16,
                              ),
                            ),
                          ),
                          Text(
                            '${_formatVotes(p.votes)} ratings',
                            style: const TextStyle(
                              color: AppColors.creamDim,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      _GenderBadge(gender: p.gender),
                    ],
                  ),

                  // Accords
                  const SizedBox(height: 20),
                  const Text(
                    'Main Accords',
                    style: TextStyle(
                      color: AppColors.creamDim,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _AccordsBar(accords: p.accords),

                  const SizedBox(height: 20),
                  const Divider(color: AppColors.divider),

                  // Tab Bar
                  TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors.gold,
                    indicatorWeight: 2,
                    labelColor: AppColors.cream,
                    unselectedLabelColor: AppColors.creamDim,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    tabs: const [
                      Tab(text: 'Notes'),
                      Tab(text: 'Performance'),
                      Tab(text: 'About'),
                    ],
                  ),

                  const SizedBox(height: 16),
                  SizedBox(
                    height: 400,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _NotesTab(perfume: p),
                        _PerformanceTab(perfume: p),
                        _AboutTab(perfume: p),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
      bottomNavigationBar: _AddToCollectionBar(perfume: p),
    );
  }

  String _formatVotes(int v) =>
      v >= 1000 ? '${(v / 1000).toStringAsFixed(1)}k' : '$v';
}

class _RatingBadge extends StatelessWidget {
  final double rating;
  const _RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [AppColors.gold, Color(0xFFB8860B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$rating',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Text(
            '/ 5',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _GenderBadge extends StatelessWidget {
  final String gender;
  const _GenderBadge({required this.gender});

  @override
  Widget build(BuildContext context) {
    final c = gender == 'Men'
        ? const Color(0xFF7AB0D0)
        : gender == 'Women'
            ? const Color(0xFFD07AB0)
            : AppColors.gold;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: c.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: c.withOpacity(0.3)),
      ),
      child: Text(
        gender,
        style: TextStyle(
          color: c,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _AccordsBar extends StatelessWidget {
  final List<String> accords;
  const _AccordsBar({required this.accords});

  static const _colors = [
    Color(0xFF5B8A6E),
    Color(0xFF6B5B8A),
    Color(0xFF8A6B5B),
    Color(0xFF5B6B8A),
    Color(0xFF8A5B6B),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(accords.length > 5 ? 5 : accords.length, (i) {
        final width = 1.0 - (i * 0.15);
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            children: [
              SizedBox(
                width: 90,
                child: Text(
                  accords[i],
                  style: const TextStyle(
                    color: AppColors.creamDim,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.bgSurface,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: width,
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: _colors[i % _colors.length],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _NotesTab extends StatelessWidget {
  final Perfume perfume;
  const _NotesTab({required this.perfume});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _NotesPyramid(perfume: perfume),
      ],
    );
  }
}

class _NotesPyramid extends StatelessWidget {
  final Perfume perfume;
  const _NotesPyramid({required this.perfume});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PyramidRow(
          label: 'TOP',
          notes: perfume.topNotes,
          color: const Color(0xFFD4A574),
          icon: Icons.arrow_upward,
        ),
        const SizedBox(height: 8),
        _PyramidRow(
          label: 'HEART',
          notes: perfume.middleNotes,
          color: const Color(0xFF8B7BD4),
          icon: Icons.favorite_border,
        ),
        const SizedBox(height: 8),
        _PyramidRow(
          label: 'BASE',
          notes: perfume.baseNotes,
          color: const Color(0xFF7BD48B),
          icon: Icons.arrow_downward,
        ),
      ],
    );
  }
}

class _PyramidRow extends StatelessWidget {
  final String label;
  final List<String> notes;
  final Color color;
  final IconData icon;

  const _PyramidRow({
    required this.label,
    required this.notes,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 16),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 4),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: notes
                    .map(
                      (n) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          n,
                          style: TextStyle(
                            color: color.withOpacity(0.9),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PerformanceTab extends StatelessWidget {
  final Perfume perfume;
  const _PerformanceTab({required this.perfume});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PerformanceItem(
          label: 'Longevity',
          value: perfume.longevity,
          icon: Icons.access_time,
          progress: _longevityProgress(perfume.longevity),
        ),
        const SizedBox(height: 10),
        _PerformanceItem(
          label: 'Sillage',
          value: perfume.sillage,
          icon: Icons.waves,
          progress: _sillageProgress(perfume.sillage),
        ),
        const SizedBox(height: 10),
        _PerformanceItem(
          label: 'Price / Value',
          value: 'Good Value',
          icon: Icons.monetization_on_outlined,
          progress: 0.72,
        ),
      ],
    );
  }

  double _longevityProgress(String l) {
    switch (l) {
      case 'Very Long Lasting': return 1.0;
      case 'Long Lasting': return 0.75;
      case 'Moderate': return 0.5;
      default: return 0.3;
    }
  }

  double _sillageProgress(String s) {
    switch (s) {
      case 'Enormous': return 1.0;
      case 'Strong': return 0.78;
      case 'Moderate': return 0.5;
      default: return 0.3;
    }
  }
}

class _PerformanceItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final double progress;

  const _PerformanceItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.gold, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        color: AppColors.creamDim,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      value,
                      style: const TextStyle(
                        color: AppColors.cream,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: AppColors.bgSurface,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(AppColors.gold),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutTab extends StatelessWidget {
  final Perfume perfume;
  const _AboutTab({required this.perfume});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.divider),
          ),
          child: Text(
            perfume.description,
            style: const TextStyle(
              color: AppColors.cream,
              fontSize: 14,
              height: 1.7,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.divider),
          ),
          child: Column(
            children: [
              _InfoRow(label: 'Brand', value: perfume.brand),
              _InfoRow(label: 'Year', value: perfume.year),
              _InfoRow(label: 'Type', value: perfume.concentration),
              _InfoRow(label: 'Gender', value: perfume.gender),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label, value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: AppColors.creamDim, fontSize: 13),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.cream,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddToCollectionBar extends StatelessWidget {
  final Perfume perfume;
  const _AddToCollectionBar({required this.perfume});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        border: const Border(top: BorderSide(color: AppColors.divider)),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.gold),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Rate',
                style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.gold,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Add to Collection',
                style: TextStyle(
                  color: AppColors.bg,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
