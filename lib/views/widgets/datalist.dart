import 'package:flutter/material.dart';
import 'package:super_heroes/utils/extensions.dart';
import 'package:super_heroes/utils/textstyle.dart';

class DataList extends StatelessWidget {
  List<String>? titles;
  List<dynamic>? values;
  String? heading;

  DataList({this.titles, this.values, this.heading});

  DataList.noTitle(List<dynamic> this.values, String this.heading) {
    titles = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        heading != null
            ? Text(
                heading!,
                style: kTextStyle(19, fontWeight: FontWeight.bold),
              )
            : const SizedBox(),
        ...values!.map(
          (e) => Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/arrow-right.png',
                  width: 18,
                ),
                titles!.isEmpty
                    ? const SizedBox()
                    : Text(
                        '${titles![values!.indexOf(e)]}: ',
                        style: kTextStyle(13, fontWeight: FontWeight.bold),
                      ),
                e.runtimeType == (List<String>)
                    ? Expanded(
                        child: Text(
                          e.join(' '),
                          style: kTextStyle(12),
                        ),
                      )
                    : Expanded(
                        child: Text(
                          e,
                          style: kTextStyle(12),
                        ),
                      ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
