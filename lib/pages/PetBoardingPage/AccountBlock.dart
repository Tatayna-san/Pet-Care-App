import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_care/repository/accounts.dart';

import 'Account.dart';

//Виджет для блока-виджета аккаунта
class AccountBlock extends StatefulWidget {
  final Account account;
  final int index;
  AccountBlock(this.account, this.index);

  @override
  State<AccountBlock> createState() => _AccountBlockState(index);
}

class _AccountBlockState extends State<AccountBlock> {
  final int index;
  _AccountBlockState(this.index);
  var _selected_info = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: const Offset(1.0, 1.0),
                  spreadRadius: 0.0,
                )
              ]),
          //padding: EdgeInsets.all(10),
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  width: 200,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 242, 242, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(children: [
                    Avatar(
                      shape: AvatarShape.circle(50),
                      name: widget.account.name,
                    ),
                  ])),
              Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 223, 142, 1),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 125,
                      width: 220,
                      padding: EdgeInsets.all(5),
                      child: Center(
                          child: ListView(children: [
                        Text(
                            widget.account.name +
                                '\n' +
                                widget.account.kinfofpet +
                                '\n' +
                                widget.account.price +
                                ' руб/день',
                            maxLines: 9,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.comfortaa(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w800,
                                fontSize: 15)),
                        TextButton(
                            onPressed: () => _displayDialogInfo(context),
                            child: Text('Подробнее',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.comfortaa(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 13)))
                      ])),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _displayDialogInfo(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text('Информация: '),
      actions: [
        FlatButton(
          child: Text(
            'Ок',
            style: GoogleFonts.comfortaa(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                fontSize: 14),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
      content: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          "Имя: " +
              accounts[index].name +
              "\n" +
              "Кого готовы взять на передержку: " +
              accounts[index].kinfofpet +
              "\n" +
              "Контакты: " +
              accounts[index].email +
              "\n" +
              "Стоимость передержки: " +
              accounts[index].price +
              "\nРайон: " +
              accounts[index].district,
          style: GoogleFonts.comfortaa(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w800,
              fontSize: 16),
        ),
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
