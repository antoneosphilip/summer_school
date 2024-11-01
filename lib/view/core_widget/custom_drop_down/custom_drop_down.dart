import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_school_app/view_model/block/absence_cubit/absence_cubit.dart';

import '../../../core/color_manager/color_manager.dart';
import '../../../core/style_font_manager/style_manager.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedValue;
  List<int> listOfClasses = [];

  @override
  void initState() {
    super.initState();
    for (int i = 1; i < 30; i++) {
      listOfClasses.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Row(
            children: [
              const Icon(
                Icons.list,
                size: 16,
                color: ColorManager.colorWhite,
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  'اختر فصل',
                  style: TextStyleManager.textStyle20w700,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: listOfClasses
              .map((int item) => DropdownMenuItem<String>(
            value: item.toString(),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                item.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            AbsenceCubit.get(context).getAbsence(id: int.parse(value!));
            setState(() {
              selectedValue = value;
            });
          },
          buttonStyleData: ButtonStyleData(
            height: 50.h,
            width: 160.w,
            padding: EdgeInsets.only(left: 14.w, right: 14.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.w),
              color: ColorManager.colorPrimary,
            ),
            elevation: 2,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14,
            iconEnabledColor: ColorManager.colorWhite,
            iconDisabledColor: ColorManager.colorWhite,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200.h,
            width: 200.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: ColorManager.colorPrimary,
            ),
            offset: const Offset(-20, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all<double>(6),
              thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
          ),
          menuItemStyleData: MenuItemStyleData(
            height: 40.h,
            padding: EdgeInsets.only(left: 14.w, right: 14.w),
          ),
        ),
      ),
    );
  }
}
