import 'package:flutter/material.dart';
import 'package:lapak_bantul/main_navigation.dart';

class PageLayanankeliling extends StatefulWidget {
  const PageLayanankeliling({super.key});

  @override
  State<PageLayanankeliling> createState() => _PageLayanankelilingState();
}

class _PageLayanankelilingState extends State<PageLayanankeliling> {
  // Variabel untuk menyimpan tanggal yang sedang dipilih (Default: tanggal pertama)
  String selectedDate = "21/01/2024";

  // Data tiruan jadwal berdasarkan tanggal untuk simulasi perubahan konten
  final Map<String, List<Map<String, String>>> jadwalData = {
    "21/01/2024": [
      {"mobil": "Mobil 01", "waktu": "08:00 - 16:00", "lokasi": "Mangir lor & Manager tengah, sendang"},
      {"mobil": "Mobil 02", "waktu": "08:00 - 16:00", "lokasi": "Mangir lor & Manager tengah, sendang"},
    ],
    "25/01/2024": [
      {"mobil": "Mobil 01", "waktu": "09:00 - 15:00", "lokasi": "Kecamatan Bantul, Lapangan Paseban"},
      {"mobil": "Mobil 03", "waktu": "09:00 - 15:00", "lokasi": "Kantor Desa Kelurahan Palbapang"},
    ],
    "28/01/2024": [
      {"mobil": "Mobil 02", "waktu": "08:30 - 14:00", "lokasi": "Pasar Imogiri, Area Parkir Timur"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    // Mengambil data mobil sesuai tanggal yang dipilih, jika kosong berikan list kosong
    List<Map<String, String>> listMobil = jadwalData[selectedDate] ?? [];

    return Scaffold(
      backgroundColor: const Color(0xffF2F4F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Layanan Keliling",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= HORIZONTAL DATE SELECTOR =================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDateButton("21/01/2024"),
                  _buildDateButton("25/01/2024"),
                  _buildDateButton("28/01/2024"),
                ],
              ),
              const SizedBox(height: 20),

              // ================= LABEL HARI INI =================
              Text(
                "Hari ini, ${formatLabelDate(selectedDate)}",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),

              // ================= LIST MOBIL LAYANAN =================
              Expanded(
                child: listMobil.isEmpty
                    ? const Center(child: Text("Tidak ada jadwal layanan."))
                    : ListView.builder(
                        itemCount: listMobil.length,
                        itemBuilder: (context, index) {
                          final item = listMobil[index];
                          return _buildMobilCard(
                            mobil: item["mobil"]!,
                            waktu: item["waktu"]!,
                            lokasi: item["lokasi"]!,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      // Menampilkan bottom navigation bar di index ke-3 (Keliling)
      bottomNavigationBar: const MainNavigation(
        currentIndex: 3,
      ),
    );
  }

  // Helper widget untuk membuat Button Tanggal Dinamis
  Widget _buildDateButton(String dateStr) {
    // Cek apakah tombol ini adalah tanggal yang sedang dipilih/aktif
    bool isSelected = selectedDate == dateStr;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedDate = dateStr; // Update tanggal aktif saat dipencet
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            // JIKA AKTIF: Warna biru gelap (0xff0D3B66), JIKA TIDAK: Putih keabuan tipis
            color: isSelected ? const Color(0xff0D3B66) : const Color(0xffEAECEF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_month,
                size: 16,
                // JIKA AKTIF: Icon warna kuning cerah, JIKA TIDAK: Grey/Abu-abu
                color: isSelected ? const Color(0xffF4D35E) : Colors.black45,
              ),
              const SizedBox(width: 8),
              Text(
                dateStr,
                style: TextStyle(
                  // JIKA AKTIF: Teks warna putih bold, JIKA TIDAK: Hitam biasa
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget untuk membuat Card Item Mobil Mobilan
  Widget _buildMobilCard({required String mobil, required String waktu, required String lokasi}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mobil,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.black45),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        lokasi,
                        style: const TextStyle(fontSize: 13, color: Colors.black45),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xff0D3B66),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              waktu,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatLabelDate(String dateStr) {
    if (dateStr == "21/01/2024") return "21 Januari 2024";
    if (dateStr == "25/01/2024") return "25 Januari 2024";
    if (dateStr == "28/01/2024") return "28 Januari 2024";
    return dateStr;
  }
}