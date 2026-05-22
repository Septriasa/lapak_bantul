import 'package:flutter/material.dart';
import 'page_pbb_detail.dart';

class PagePBB extends StatelessWidget {
  final String nop;

  const PagePBB({super.key, required this.nop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("PBB", style: TextStyle(color: Colors.black)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("NOP: $nop", style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  CardPajak(
                    tahun: "2021",
                    alamat: "DS. Ngireng-ireng RT01/RW01",
                    nominal: "200.000",
                    status: "Belum Lunas",
                    warnaStatus: Colors.red,
                  ),

                  const SizedBox(height: 15),

                  CardPajak(
                    tahun: "2020",
                    alamat: "DS. Ngireng-ireng RT01/RW01",
                    nominal: "376.000",
                    status: "Lunas",
                    warnaStatus: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardPajak extends StatelessWidget {
  final String tahun;
  final String alamat;
  final String nominal;
  final String status;
  final Color warnaStatus;

  const CardPajak({
    super.key,
    required this.tahun,
    required this.alamat,
    required this.nominal,
    required this.status,
    required this.warnaStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SPPT $tahun",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Text(alamat),

              const SizedBox(height: 10),

              Text("Rp $nominal"),

              const SizedBox(height: 12),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PageDetailSppt(),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Lihat Detail"),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_ios, size: 14),
                  ],
                ),
              ),
            ],
          ),
        ),

        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            decoration: BoxDecoration(
              color: warnaStatus,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Text(status, style: const TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
