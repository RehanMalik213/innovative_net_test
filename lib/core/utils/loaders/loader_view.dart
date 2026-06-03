import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/core/constants/app_strings.dart';
import 'package:innovative_net_test/core/widgets/text/app_text.dart';

class LoaderView extends StatelessWidget {
  const LoaderView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Material(
      color: context.theme.scaffoldBackgroundColor,
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: size.width * 0.8,
            maxHeight: size.height * 0.8,
            minWidth: size.width * 0.5,
          ),
          decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  AppText(
                    text: AppStrings.loading,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
