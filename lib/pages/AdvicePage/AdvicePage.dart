import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_care/pages/AdvicePage/AdviceList.dart';
import 'package:pet_care/pages/AdvicePage/AdviceWidget.dart';
import 'package:pet_care/repository/advicerepo.dart';

//главная страница советов
class AdvicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      AdviceMainBlock(articles[0].title, articles[0].image),
      Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Статьи",
                textAlign: TextAlign.left,
                style: GoogleFonts.comfortaa(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w800,
                    fontSize: 24)),
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdviceList())),
              child: Text("Показать все",
                  style: GoogleFonts.comfortaa(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800,
                      fontSize: 14)),
            )
          ],
        ),
      ),
      Container(
        height: 209.0,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, i) {
            return AdviceBlock(articles[i].title, articles[i].image, i);
          },
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Избранное",
                textAlign: TextAlign.left,
                style: GoogleFonts.comfortaa(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w800,
                    fontSize: 24)),
            TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdviceListFavourite())),
              child: Text("Показать все",
                  style: GoogleFonts.comfortaa(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800,
                      fontSize: 14)),
            )
          ],
        ),
      ),
      Container(
        height: 209.0,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, i) {
            return AdviceBlock(articles[i].title, articles[i].image, i);
          },
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
        ),
      ),
    ]);
  }
}
