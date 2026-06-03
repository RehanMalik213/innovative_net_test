import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovative_net_test/core/constants/app_strings.dart';
import 'package:innovative_net_test/core/extensions/widget_ext/widget_extensions.dart';
import 'package:innovative_net_test/core/themes/app_colors.dart';
import 'package:innovative_net_test/core/widgets/text/app_text.dart';

class BackNavigateButton extends StatelessWidget {
  final Function()? onBack;
  const BackNavigateButton({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(Icons.arrow_back_rounded, color: primaryColor),
          3.horizontalSpace,
          AppText(text: AppStrings.back),
        ],
      ).onViewClick(() => onBack?.call()),
    );
  }
}
