import 'package:flutter/material.dart';
// Perbaikan path import sesuai struktur folder di project kamu
import 'package:lapak_bantul/home_page.dart'; 
import 'package:lapak_bantul/screens/tax/page_pbb_search.dart'; // Mengarah ke pencarian PBB
import 'package:lapak_bantul/screens/tax/page_bphtb.dart';
import 'package:lapak_bantul/screens/tax/page_layanankeliling.dart';
import 'package:lapak_bantul/screens/tax/informasipage.dart';

class MainNavigation extends StatelessWidget {
  final int currentIndex;

  const MainNavigation({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xff0D3B66),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: (index) {
        if (index == currentIndex) return;

        switch (index) {
          // 0: Beranda
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PageNew()), 
            );
            break;

          // 1: PBB
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => PagePbbSearch()),
            );
            break;

          // 2: BPHTB
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PageBPHTB()),
            );
            break;

          // 3: Keliling
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PageLayanankeliling()),
            );
            break;

          // 4: User / Informasi
          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const InformasiPage()),
            );
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description),
          label: 'PBB',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'BPHTB',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_shipping),
          label: 'Keliling',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Informasi',
        ),
      ],
    );
  }
}