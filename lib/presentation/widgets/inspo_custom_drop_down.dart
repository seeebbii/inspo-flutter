
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_theme.dart';
import '../../utils/dimensions.dart';

class InspoCustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T? selectedValue;
  final ValueChanged<T?> onChanged;

  InspoCustomDropdown({
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  _InspoCustomDropdown<T> createState() => _InspoCustomDropdown<T>();
}

class _InspoCustomDropdown<T> extends State<InspoCustomDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.black),
        borderRadius: BorderRadius.circular(6.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: DropdownButton<T>(
          value: widget.selectedValue,
          onChanged: widget.onChanged,
          hint: Center(
            child: Text(
              "PICK YOUR BRANCH",
              style: Dimensions.customTextStyle(
                13,
                FontWeight.w600,
                AppTheme.blackColor,
              ),
            ),
          ),
          isExpanded: true,
          icon: null,
          items: widget.items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Center(
                  child: Text(
                    item.toString(),
                    style: Dimensions.customTextStyle(
                      16,
                      FontWeight.w400,
                      AppTheme.blackColor,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
