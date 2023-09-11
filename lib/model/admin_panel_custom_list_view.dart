import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import '/model/realm_models.dart';
import 'employee_list_view_tile.dart';

class AdminPanelCustomListView extends StatelessWidget {
  final Realm realm;
  final RealmResults<Worker> workerItems;
  const AdminPanelCustomListView({
    super.key,
    required this.realm,
    required this.workerItems,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: workerItems.changes,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
              restorationId: "adminPanelListView",
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: getItemBuilder,
              separatorBuilder: getSeparatorBuilder,
              itemCount: workerItems.length);
        });
  }

  Widget getItemBuilder(BuildContext context, int index) {
    var employee = workerItems[index];
    return EmployeeListViewTile(workerItem: employee);
  }

  Widget getSeparatorBuilder(BuildContext context, int index) {
    return const Divider(
      thickness: 1,
      color: Colors.grey,
    );
  }
}
