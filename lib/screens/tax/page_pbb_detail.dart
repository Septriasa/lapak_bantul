import 'package:flutter/material.dart';

class PageDetailSppt extends StatelessWidget {
  const PageDetailSppt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,shadowColor: const Color.fromARGB(255, 54, 54, 54),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // NOP
            const Text(
              "No. NOP 378429749820294337",
              style: TextStyle(
                color: Color(0xff718096),
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 10),

            // Nama WP
            const Text(
              "AHMAD NABIL BAHROIN\nROGER SUMATRA",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff2D3748),
              ),
            ),

            const SizedBox(height: 10),

            // Alamat WP
            const Text(
              "Alamat Lengkap WP : Kab Bantul, Kec. Sewon, DS. Ngireng-ireng, RT01/RW01",
              style: TextStyle(
                color: Color(0xff718096),
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // Lokasi
            _buildItem(
              "Lokasi",
              "DS. Ngireng-ireng, RT01/RW01",
            ),

            // Status
            _buildStatus(),

            // Denda
            _buildItem(
              "Denda",
              "Rp. 0",
            ),

            // NJOP Bumi
            _buildItem(
              "NJOP Bumi",
              "Rp. 300,000",
            ),

            // NJOP Bangunan
            _buildItem(
              "NJOP Bangunan",
              "Rp. 0",
            ),

            // Luas Bumi
            _buildItem(
              "Luas Bumi",
              "227m",
            ),

            // Luas Bangunan
            _buildItem(
              "Luas Bangunan",
              "0m",
            ),
          ],
        ),
      ),
    );
  }

  /// Widget Item Biasa
  Widget _buildItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 8),

        Text(
          title,
          style: const TextStyle(
            color: Color(0xff718096),
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff2D3748),
          ),
        ),

        const SizedBox(height: 8),

        const Divider(
          color: Color(0xffCBD5E0),
          thickness: 1,
        ),
      ],
    );
  }

  /// Widget Status
  Widget _buildStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 8),

        const Text(
          "Status",
          style: TextStyle(
            color: Color(0xff718096),
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 4),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "Sudah Lunas",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const SizedBox(height: 8),

        const Divider(
          color: Color(0xffCBD5E0),
          thickness: 1,
        ),
      ],
    );
  }
}