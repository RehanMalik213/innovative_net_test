import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:innovative_net_test/core/local_storage/hive/box_keys.dart';
import 'package:innovative_net_test/core/local_storage/hive/models/checkin/checkin_model.dart';
import 'package:innovative_net_test/core/themes/app_colors.dart';
import 'package:innovative_net_test/core/widgets/text/app_text.dart';
import 'package:innovative_net_test/features/dashboard/presentation/controller/dashboard_controller.dart';

class CheckinHistory extends GetView<DashboardController> {
  const CheckinHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
              text: "Sync Data On Server",
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: Hive.box<OfflineCheckIn>(
              HiveBoxes.offlineCheckInBox,
            ).listenable(),
            builder: (context, Box<OfflineCheckIn> box, _) {
              final checkIns = box.values.toList().reversed.toList();

              if (checkIns.isEmpty) {
                return const Center(
                  child: AppText(
                    text: "No offline records found",
                    fontWeight: FontWeight.w700,
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                itemCount: checkIns.length,
                itemBuilder: (context, index) {
                  final item = checkIns[index];
                  return Card(
                    color: AppColors.borderColor,
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      title: AppText(
                        text: "${item.distributorName} (${item.routeName})",
                        color: AppColors.primary,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "Date: ${item.checkin}",
                            color: AppColors.primary,
                          ),
                          AppText(
                            color: AppColors.primary,
                            text:
                                "Dist ID: ${item.distributorId} | Route ID: ${item.routeId}",
                          ),
                        ],
                      ),
                      trailing: item.isSynced
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : IconButton(
                              icon: const Icon(
                                Icons.cloud_upload,
                                color: Colors.blue,
                              ),
                              onPressed: () async {
                                controller.syncData(
                                  checkin: item.checkin,
                                  userId: item.userId,
                                  latitude: item.latitude,
                                  longitude: item.longitude,
                                  distributorId: item.distributorId,
                                  routeId: item.routeId,
                                  uui: item.uuid,
                                );
                              },
                            ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
