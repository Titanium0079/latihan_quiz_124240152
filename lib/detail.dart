import 'package:flutter/material.dart';

import '../models/food_item.dart';

class DetailPage extends StatefulWidget {
  final FoodItem foodItem;

  const DetailPage({super.key, required this.foodItem});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // Controller untuk membaca dan mengontrol isi teks dari TextField porsi
  late TextEditingController _portionController;

  @override
  void initState() {
    super.initState();
    // Mengisi input awal dengan jumlah porsi saat ini
    _portionController = TextEditingController(
      text: widget.foodItem.quantity.toString(),
    );
  }

  @override
  void dispose() {
    _portionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Pesanan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.foodItem.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.foodItem.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Harga: Rp ${widget.foodItem.formattedPrice} / porsi',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.foodItem.description,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  const Text('Ubah Jumlah Porsi:'),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _portionController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Porsi',
                      prefixIcon: Icon(Icons.shopping_cart),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // BottomNavigatorBar diisi tombol aksi di layar bagian bawah
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            // Konversi teks dari input ke angka integer
            int newQuantity = int.tryParse(_portionController.text) ?? 0;

            // Validasi: Jika angka minus, paksa angka ke 0
            if (newQuantity < 0) newQuantity = 0;

            // Mengubah nilai quantity pada objek model
            widget.foodItem.quantity = newQuantity;

            // Navigator.pop: Menutup Halaman Detail dan kembali ke Halaman Utama
            Navigator.pop(context);
          },
          child: const Text(
            'Simpan Pesanan',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
