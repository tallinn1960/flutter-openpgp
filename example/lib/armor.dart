import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:openpgp/openpgp.dart';
import 'package:openpgp_example/shared/button_widget.dart';
import 'package:openpgp_example/shared/title_widget.dart';
import 'package:openpgp_example/shared/input_widget.dart';

class Armor extends StatefulWidget {
  const Armor({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _ArmorState createState() => _ArmorState();
}

class _ArmorState extends State<Armor> {
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            TitleWidget(widget.title),
            InputWidget(
              title: "Armor encode",
              key: Key("encode"),
              result: _result,
              onPressed: (controller) async {
                var result = await OpenPGP.armorEncode(
                  Uint8List.fromList(controller.text.codeUnits),
                );

                setState(() {
                  _result = result;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
