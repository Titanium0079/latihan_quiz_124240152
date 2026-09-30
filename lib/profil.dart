import 'package:flutter/material.dart';

// Profil bersifat statis 
class ProfilePage extends StatelessWidget{
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
      ),
      body: Center( // Meletakkan seluruh konten di tengah-tengah layar
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircleAvatar: Widget lingkaran untuk foto profil/ikon pengguna
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.orange,
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Muhammad Titan Deannova',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'UPN "Veteran" Yogyakarta',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 40),
            
            // ListTile: Widget standar Flutter untuk membuat baris berikon dan bertuliskan judul/subjudul
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.orange),
              title: const Text('Menu Favorit'),
              subtitle: const Text('Lihat makanan yang sering dipesan'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.orange),
              title: const Text('Riwayat Pemesanan'),
              subtitle: const Text('Lihat riwayat transaksi sebelumnya'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
