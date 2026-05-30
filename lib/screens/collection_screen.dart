import 'package:flutter/material.dart';
import 'package:parfumo_ui/theme/app_theme.dart';
import 'package:parfumo_ui/models/perfume.dart';
import 'detail_screen.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});
  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tab;
  bool _isGrid = true;

  final List<Perfume> _owned = myCollection;
  final List<Perfume> _wishlist =
      mockPerfumes.where((p) => p.inWishlist).toList();

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('My Collection'),
        actions: [
          IconButton(
            icon: Icon(
              _isGrid ? Icons.view_list : Icons.grid_view,
              color: AppColors.creamDim,
            ),
            onPressed: () => setState(() => _isGrid = !_isGrid),
          ),
        ],
        bottom: TabBar(
          controller: _tab,
          indicatorColor: AppColors.gold,
          labelColor: AppColors.cream,
          unselectedLabelColor: AppColors.creamDim,
          tabs: [
            Tab(text: 'Owned (${_owned.length})'),
            Tab(text: 'Wishlist (${_wishlist.length})'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tab,
        children: [
          _CollectionBody(
            perfumes: _owned,
            isGrid: _isGrid,
            emptyMsg: 'No fragrances in your collection yet',
          ),
          _CollectionBody(
            perfumes: _wishlist,
            isGrid: _isGrid,
            emptyMsg: 'Your wishlist is empty',
          ),
        ],
      ),
    );
  }
}

class _CollectionBody extends StatelessWidget {
  final List<Perfume> perfumes;
  final bool isGrid;
  final String emptyMsg;

  const _CollectionBody({
    required this.perfumes,
    required this.isGrid,
    required this.emptyMsg,
  });

  @override
  Widget build(BuildContext context) {
    if (perfumes.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.collections_bookmark_outlined,
                color: AppColors.creamDim, size: 52),
            const SizedBox(height: 12),
            Text(
              emptyMsg,
              style: const TextStyle(color: AppColors.creamDim, fontSize: 14),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.gold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Explore Fragrances',
                style: TextStyle(color: AppColors.gold),
              ),
            ),
          ],
        ),
      );
    }

    // Stats Header
    return Column(
      children: [
        _StatsBar(perfumes: perfumes),
        Expanded(
          child: isGrid
              ? _GridView(perfumes: perfumes)
              : _ListView(perfumes: perfumes),
        ),
      ],
    );
  }
}

class _StatsBar extends StatelessWidget {
  final List<Perfume> perfumes;
  const _StatsBar({required this.perfumes});

  @override
  Widget build(BuildContext context) {

    final brands = perfumes.map((p) => p.brand).toSet().length;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.gold.withValues(alpha:0.1),
            AppColors.accent.withValues(alpha:0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gold.withValues(alpha:0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _StatItem(
            value: '${perfumes.length}',
            label: 'Fragrances',
            icon: Icons.water_drop_outlined,
          ),
        
          _Divider(),
          _StatItem(
            value: '$brands',
            label: 'Brands',
            icon: Icons.business_outlined,
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 36,
      color: AppColors.divider,
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value, label;
  final IconData icon;
  const _StatItem({required this.value, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.gold, size: 18),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.cream,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: AppColors.creamDim, fontSize: 11),
        ),
      ],
    );
  }
}

class _GridView extends StatelessWidget {
  final List<Perfume> perfumes;
  const _GridView({required this.perfumes});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 90),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.72,
      ),
      itemCount: perfumes.length,
      itemBuilder: (_, i) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(perfume: perfumes[i]),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.divider),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                    gradient: RadialGradient(
                      colors: [
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Image.asset(perfumes[i].image)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 6, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      perfumes[i].name,
                      style: const TextStyle(
                        color: AppColors.cream,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      perfumes[i].brand,
                      style: const TextStyle(
                        color: AppColors.creamDim,
                        fontSize: 11,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: AppColors.gold, size: 12),
                        const SizedBox(width: 3),
                        Text(
                          perfumes[i].rating,
                          style: const TextStyle(
                            color: AppColors.gold,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  final List<Perfume> perfumes;
  const _ListView({required this.perfumes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 90),
      itemCount: perfumes.length,
      itemBuilder: (_, i) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(perfume: perfumes[i]),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.divider),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 70,
                child: Image.asset(perfumes[i].image),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      perfumes[i].name,
                      style: const TextStyle(
                        color: AppColors.cream,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      perfumes[i].brand,
                      style: const TextStyle(
                        color: AppColors.creamDim,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      perfumes[i].concentration,
                      style: const TextStyle(
                        color: AppColors.gold,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Icon(Icons.star, color: AppColors.gold, size: 14),
                  Text(
                    perfumes[i].rating,
                    style: const TextStyle(
                      color: AppColors.gold,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
