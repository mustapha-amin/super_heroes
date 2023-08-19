import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_heroes/providers/segmented_btn_controller.dart';

import '../../utils/textstyle.dart';

class CustomSegmentedButton extends StatelessWidget {
  const CustomSegmentedButton({super.key});

  @override
  Widget build(BuildContext context) {
    var sButtonController = Provider.of<SegmentedButtonController>(context);
    bool maleIsSelected = sButtonController.maleIsSelected;
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFBFBFBF),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                !maleIsSelected
                    ? sButtonController.toggleSelection(true)
                    : null;
              },
              child: Card(
                elevation: maleIsSelected ? 1 : 0,
                color: maleIsSelected
                    ? const Color(0xFFFFF1CB)
                    : const Color(0xFFF6F6F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      "Male",
                      style: kTextStyle(15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                maleIsSelected
                    ? sButtonController.toggleSelection(false)
                    : null;
              },
              child: Card(
                elevation: maleIsSelected ? 0 : 1,
                color: !maleIsSelected
                    ? const Color(0xFFFFF1CB)
                    : const Color(0xFFF6F6F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      "Female",
                      style: kTextStyle(15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}