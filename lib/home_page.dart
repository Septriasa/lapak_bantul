import 'package:flutter/material.dart';
import 'screens/tax/informasipage.dart';
import 'screens/tax/page_layanankeliling.dart';
import 'screens/tax/page_bphtb.dart';
import 'screens/tax/page_pbb_search.dart';

class PageNew extends StatelessWidget {
  const PageNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F3F7),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Beranda",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                      "assets/images/logo-removebg-preview.jpg",
                    ),
                  )
                ],
              ),
            ),

            Container(
              height: 170,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff0E3A66),
              ),
              child: Stack(
                children: [

                  // Lingkaran dekorasi
                  Positioned(
                    left: -40,
                    top: 20,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.08),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 40,
                    bottom: -60,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.05),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "LaPak Bantul",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Pusat layanan pajak\nterpadu",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/logo lapak.jpeg',
                              width: 110,
                              height: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                  children: [
                    MenuCard(
                      icon: Icons.local_shipping,
                      title: "PBB",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PagePbbSearch(),
                          ),
                        );
                      },
                    ),

                    MenuCard(
                      icon: Icons.local_shipping,
                      title: "BPHTB",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PageBPHTB(),
                          ),
                        );
                      },
                    ),
                    const MenuCard(icon: Icons.event_note, title: "Rekap"),

                    MenuCard(
                      icon: Icons.local_shipping,
                      title: "Layanan\nKeliling",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PageLayanankeliling(),
                          ),
                        );
                      },
                    ),

                    MenuCard(
                      icon: Icons.info,
                      title: "Informasi",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InformasiPage(),
                          ),
                        );
                      },
                    ),

                    const MenuCard(icon: Icons.grid_view, title: "Lainnya"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const MenuCard({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  double scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => scale = 0.95);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => scale = 1.0);
  }

  void _onTapCancel() {
    setState(() => scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffE7E9EF),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 40, color: Colors.black87),
              const SizedBox(height: 12),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}