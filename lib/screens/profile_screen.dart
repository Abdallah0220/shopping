import 'package:flutter/material.dart';
import 'package:shopping/screens/auth/login_screen.dart';
import 'package:shopping/screens/profile/edit_profile_screen.dart';
import 'package:shopping/screens/profile/my_orders_screen.dart';
import 'package:shopping/screens/profile/wishlist_screen.dart';
import 'package:shopping/screens/profile/settings_screen.dart';
import 'package:shopping/screens/profile/help_center_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0.5,
        centerTitle: true,
        title: const Text('My Profile', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Avatar with animation
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 600),
              builder: (context, value, child) {
                return Transform.scale(scale: value, child: child);
              },
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
                backgroundColor: Colors.transparent,
              ),
            ),

            const SizedBox(height: 16),

            // Name & Email
            Text(
              'Abdallah Mohamed',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'brody2750@gmail.com',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 32),

            // Menu Items
            _buildTile(
              context: context,
              icon: Icons.person_outline,
              label: 'Edit Profile',
              destination: const EditProfileScreen(),
            ),
            _buildTile(
              context: context,
              icon: Icons.shopping_bag_outlined,
              label: 'My Orders',
              destination: const MyOrdersScreen(),
            ),
            _buildTile(
              context: context,
              icon: Icons.favorite_border,
              label: 'Wishlist',
              destination: const WishlistScreen(),
            ),
            _buildTile(
              context: context,
              icon: Icons.settings_outlined,
              label: 'Settings',
              destination: const SettingsScreen(),
            ),
            _buildTile(
              context: context,
              icon: Icons.help_outline,
              label: 'Help Center',
              destination: const HelpCenterScreen(),
            ),

            const SizedBox(height: 30),

            // Logout Button
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                return Opacity(opacity: value, child: child);
              },
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.logout, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  label: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Widget destination,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destination),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.blueAccent),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
