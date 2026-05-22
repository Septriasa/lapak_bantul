import 'package:flutter/material.dart';

class InformasiPage extends StatelessWidget {
  const InformasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f6f8),

      appBar: AppBar(
        title: const Text(
          "Informasi Pajak",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //PBB
            sectionTitle("PBB"),
            infoTile(
              title: "Apa itu PBB?",
              content:
                  "PBB adalah Pajak Bumi dan Bangunan yang dikenakan atas kepemilikan atau pemanfaatan tanah dan bangunan.",
            ),
            infoTile(
              title: "Cara Menghitung PBB",
              content:
                  "PBB dihitung berdasarkan NJOP (Nilai Jual Objek Pajak) dikalikan dengan tarif pajak yang berlaku.",
            ),

            const SizedBox(height: 16),

            //BPHTB
            sectionTitle("BPHTB"),
            infoTile(
              title: "Apa itu BPHTB?",
              content:
                  "BPHTB adalah Bea Perolehan Hak atas Tanah dan Bangunan yang dikenakan saat terjadi transaksi jual beli atau peralihan hak.",
            ),
            infoTile(
              title: "Cara Menghitung BPHTB",
              content:
                  "BPHTB dihitung dari nilai transaksi dikurangi NJOPTKP, lalu dikalikan tarif pajak.",
            ),

            const SizedBox(height: 16),

            //LAYANAN
            sectionTitle("Layanan"),
            infoTile(
              title: "Jam Pelayanan",
              content:
                  "Jam pelayanan Bapenda Bantul: Senin - Jumat, 08.00 - 16.00 WIB.",
            ),
            infoTile(
              title: "Kontak BAPENDA Bantul",
              content:
                  "Telepon: (0274) 089800986512\nEmail: bapenda@bantul.go.id",
            ),
          ],
        ),
      ),
    );
  }

  //WIDGET JUDUL SECTION
  Widget sectionTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xff0d3b66),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  //WIDGET EXPANSION TILE (BIAR BISA DIKLIK & BUKA)
  Widget infoTile({
    required String title,
    required String content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 12),
        childrenPadding: const EdgeInsets.all(12),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        children: [
          Text(
            content,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}