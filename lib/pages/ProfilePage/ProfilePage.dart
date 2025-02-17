import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_care/pages/ProfilePage/AvatarBlock.dart';
import 'package:pet_care/pages/ProfilePage/MainInfoBlock.dart';
import 'package:pet_care/pages/ProfilePage/Passport.dart';
import 'package:pet_care/repository/profilespetsrepo.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        decoration:
            BoxDecoration(color: Color.fromRGBO(255, 223, 142, 10), boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: const Offset(0.0, 0.0),
            spreadRadius: 0.0,
          )
        ]),
        padding: EdgeInsets.all(10),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          AvatarBlock(profilespets[1].name, profilespets[1].photo),
          Column(
            children: [
              Container(
                  child: Icon(
                    CupertinoIcons.add,
                    size: 55,
                    color: Colors.black,
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 240, 240, 1),
                      //color: Color.fromRGBO(255, 223, 142, 10),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  height: 70,
                  width: 70),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Добавить",
                  style: GoogleFonts.comfortaa(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800,
                      fontSize: 12),
                ),
              )
            ],
          )
        ]),
      ),
      Container(
        padding: EdgeInsets.all(10),
        child: Text(
          "Основные данные",
          textAlign: TextAlign.center,
          style: GoogleFonts.comfortaa(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w800,
              fontSize: 20),
        ),
      ),
      Container(
        margin: EdgeInsets.all(8),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainInfoBlock("Возраст", "1 год \n10 месяцев",
                Color.fromRGBO(131, 184, 107, 80)),
            MainInfoBlock(
              "Вес",
              "15 кг",
              Color.fromRGBO(255, 223, 142, 10),
            ),
            // MainInfoBlock("Порода", "Корги", Color.fromRGBO(131, 184, 107, 60)),
            MainInfoBlock("Пол", "Мужской", Color.fromRGBO(129, 181, 217, 90)),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        child: Text(
          "Паспорт питомца",
          textAlign: TextAlign.center,
          style: GoogleFonts.comfortaa(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w800,
              fontSize: 20),
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 0, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Passport("Екатерина", "30.01.2020", "Корги", "Рыжий",
                "Прививка от бешенства", "Нет"),
          ],
        ),
      ),
    ]);
  }
}
