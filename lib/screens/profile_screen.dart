import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/perfume.dart';
import '../widgets/perfume_bottle.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: AppColors.creamDim),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Avatar
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [AppColors.gold, AppColors.accent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color: AppColors.bgCard,
                      width: 3,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'A',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 26,
                  height: 26,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.bgCard,
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: AppColors.gold,
                    size: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Ali Zolfaghari',
              style: TextStyle(
                color: AppColors.cream,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              '@alizolfaghari',
              style: TextStyle(color: AppColors.creamDim, fontSize: 13),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.gold.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                '✦  Fragrance Enthusiast',
                style: TextStyle(
                  color: AppColors.gold,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Stats
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.bgCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.divider),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ProfileStat(value: '${myCollection.length}', label: 'Collection'),
                  _VertDivider(),
                  _ProfileStat(
                    value: '${mockPerfumes.where((p) => p.inWishlist).length}',
                    label: 'Wishlist',
                  ),
                  _VertDivider(),
                  const _ProfileStat(value: '12', label: 'Reviews'),
                  _VertDivider(),
                  const _ProfileStat(value: '8', label: 'Following'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Fragrance DNA
            _SectionTitle(title: 'Fragrance DNA'),
            const SizedBox(height: 10),
            _FragranceDNA(),

            const SizedBox(height: 20),

            // Recent Activity
            _SectionTitle(title: 'Recently Worn'),
            const SizedBox(height: 10),
            ...myCollection.take(3).map(
                  (p) => _WornTile(perfume: p),
                ),

            const SizedBox(height: 20),

            // Settings
            _SectionTitle(title: 'Settings'),
            const SizedBox(height: 10),
            _SettingsItem(icon: Icons.notifications_outlined, label: 'Notifications'),
            _SettingsItem(icon: Icons.language, label: 'Language'),
            _SettingsItem(icon: Icons.dark_mode_outlined, label: 'Appearance'),
            _SettingsItem(icon: Icons.privacy_tip_outlined, label: 'Privacy'),
            _SettingsItem(
              icon: Icons.logout,
              label: 'Sign Out',
              isDestructive: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _VertDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 40, color: AppColors.divider);
  }
}

class _ProfileStat extends StatelessWidget {
  final String value, label;
  const _ProfileStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.cream,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _FragranceDNA extends StatelessWidget {
  final _dna = const [
    ('Woody', 0.82, Color(0xFF8B6E4A)),
    ('Sweet', 0.65, Color(0xFFD4A574)),
    ('Floral', 0.53, Color(0xFFB07AB0)),
    ('Citrus', 0.40, Color(0xFFD4C474)),
    ('Aromatic', 0.35, Color(0xFF7AB0A0)),
  ];

  const _FragranceDNA();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: _dna.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    item.$1,
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
                        widthFactor: item.$2,
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: item.$3,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${(item.$2 * 100).round()}%',
                  style: TextStyle(
                    color: item.$3,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _WornTile extends StatelessWidget {
  final Perfume perfume;
  const _WornTile({required this.perfume});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 44,
            height: 60,
            child: PerfumeBottleWidget(perfume: perfume, size: 60),
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
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  perfume.brand,
                  style: const TextStyle(
                    color: AppColors.creamDim,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.bgSurface,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'Today',
              style: TextStyle(color: AppColors.creamDim, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isDestructive;

  const _SettingsItem({
    required this.icon,
    required this.label,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final c = isDestructive ? const Color(0xFFD07070) : AppColors.creamDim;
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Icon(icon, color: c, size: 20),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              color: isDestructive ? const Color(0xFFD07070) : AppColors.cream,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          if (!isDestructive)
            const Icon(Icons.chevron_right, color: AppColors.creamDim, size: 18),
        ],
      ),
    );
  }
}
