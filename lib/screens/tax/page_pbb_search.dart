import 'package:flutter/material.dart';
import 'page_pbb.dart';

class PagePbbSearch extends StatelessWidget {
  PagePbbSearch({super.key});

  final TextEditingController nopController = TextEditingController();

  void goToPbb(BuildContext context) {
    if (nopController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PagePBB(nop: nopController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F4F8),

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
          children: [

            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xff8EA2B8), width: 1.5),
              ),
              child: Row(
                children: [

                  const Icon(Icons.search),

                  const SizedBox(width: 10),

                  Expanded(
                    child: TextField(
                      controller: nopController,
                      onSubmitted: (_) => goToPbb(context),
                      decoration: const InputDecoration(
                        hintText: "Masukan NOP...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () => goToPbb(context),
                  )
                ],
              ),
            ),

            const Spacer(),

            const Text("Masukan NOP untuk melihat rincian pajak"),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}