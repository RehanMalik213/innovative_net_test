import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovative_net_test/core/constants/app_images.dart';
import 'package:innovative_net_test/core/themes/app_colors.dart';
import 'package:innovative_net_test/core/widgets/small_box_with_icon.dart';
import 'package:innovative_net_test/core/widgets/text/app_text.dart';

class CustomDropdown extends StatelessWidget {
  final String hint;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.hint,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(border: InputBorder.none),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          hint: Row(
            children: [
              SmallBoxWithIcon(
                height: 31.h,
                width: 31.w,
                boxColor: AppColors.secondary.withValues(alpha: 0.4),
                radius: 10,
                imagePath: AppImages.loginIcon,
                imageColor: AppColors.secondary,
                imageSize: Size(32, 32),
              ),
              12.horizontalSpace,
              AppText(text: hint, color: AppColors.hintColor),
            ],
          ),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: AppText(text: value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
