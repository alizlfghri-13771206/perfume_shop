import 'package:flutter/material.dart';
import 'package:parfumo_ui/theme/app_theme.dart';
import 'package:parfumo_ui/models/perfume.dart';
import 'detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _ctrl = TextEditingController();
  String _query = '';
  String _selectedAccord = '';
  String _selectedGender = '';

  final List<String> _accords = [
    'Woody', 'Floral', 'Sweet', 'Citrus', 'Amber',
    'Aromatic', 'Smoky', 'Fresh', 'Leather', 'Earthy',
  ];
  final List<String> _genders = ['Men', 'Women', 'Unisex'];

  List<Perfume> get _results {
    return mockPerfumes.where((p) {
      final matchQuery = _query.isEmpty ||
          p.name.toLowerCase().contains(_query.toLowerCase()) ||
          p.brand.toLowerCase().contains(_query.toLowerCase());
      final matchAccord =
          _selectedAccord.isEmpty || p.accords.contains(_selectedAccord);
      final matchGender =
          _selectedGender.isEmpty || p.gender == _selectedGender;
      return matchQuery && matchAccord && matchGender;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        title: const Text(
          'Search',
          style: TextStyle(
            color: AppColors.cream,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: TextField(
              controller: _ctrl,
              onChanged: (v) => setState(() => _query = v),
              style: const TextStyle(color: AppColors.cream),
              decoration: InputDecoration(
                hintText: 'Perfume name, brand, notes...',
                hintStyle: const TextStyle(color: AppColors.creamDim),
                prefixIcon: const Icon(Icons.search, color: AppColors.creamDim),
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: AppColors.creamDim, size: 18),
                        onPressed: () {
                          _ctrl.clear();
                          setState(() => _query = '');
                        },
                      )
                    : null,
                filled: true,
                fillColor: AppColors.bgSurface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: AppColors.divider),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: AppColors.divider),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: AppColors.gold),
                ),
              ),
            ),
          ),

          // Gender Filter
          SizedBox(
            height: 34,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _genders.length,
              itemBuilder: (_, i) {
                final g = _genders[i];
                final sel = _selectedGender == g;
                return GestureDetector(
                  onTap: () => setState(
                    () => _selectedGender = sel ? '' : g,
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: sel ? AppColors.accent : AppColors.bgSurface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: sel ? AppColors.accent : AppColors.divider,
                      ),
                    ),
                    child: Text(
                      g,
                      style: TextStyle(
                        color: sel ? Colors.white : AppColors.creamDim,
                        fontSize: 12,
                        fontWeight:
                            sel ? FontWeight.w700 : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),

          // Accord Filter
          SizedBox(
            height: 34,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _accords.length,
              itemBuilder: (_, i) {
                final a = _accords[i];
                final sel = _selectedAccord == a;
                return GestureDetector(
                  onTap: () =>
                      setState(() => _selectedAccord = sel ? '' : a),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: sel
                          ? AppColors.gold.withValues(alpha:0.2)
                          : AppColors.bgSurface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: sel ? AppColors.gold : AppColors.divider,
                      ),
                    ),
                    child: Text(
                      a,
                      style: TextStyle(
                        color: sel ? AppColors.gold : AppColors.creamDim,
                        fontSize: 12,
                        fontWeight:
                            sel ? FontWeight.w700 : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  '${_results.length} results',
                  style: const TextStyle(
                    color: AppColors.creamDim,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Results
          Expanded(
            child: _results.isEmpty
                ?  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.search_off,
                          color: AppColors.creamDim,
                          size: 48,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'No fragrances found',
                          style: TextStyle(
                            color: AppColors.creamDim,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 90),
                    itemCount: _results.length,
                    itemBuilder: (_, i) => _SearchResultTile(
                      perfume: _results[i],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              DetailScreen(perfume: _results[i]),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _SearchResultTile extends StatelessWidget {
  final Perfume perfume;
  final VoidCallback onTap;

  const _SearchResultTile({required this.perfume, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
            Container(
              width: 60,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const RadialGradient(
                  colors: [
                    Colors.transparent,
                  ],
                ),
              ),
              child: Center(
                child:Image.asset(perfume.image)
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    perfume.name,
                    style: const TextStyle(
                      color: AppColors.cream,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${perfume.brand} · ${perfume.year}',
                    style: const TextStyle(
                      color: AppColors.creamDim,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 4,
                    children: perfume.accords
                        .take(3)
                        .map(
                          (a) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.bgSurface,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              a,
                              style: const TextStyle(
                                color: AppColors.creamDim,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.gold, size: 13),
                    const SizedBox(width: 3),
                    Text(
                      '${perfume.rating}',
                      style: const TextStyle(
                        color: AppColors.gold,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.creamDim,
                  size: 14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
