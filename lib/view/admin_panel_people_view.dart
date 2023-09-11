import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import '../model/realm_models.dart';

import '../../model/admin_panel_custom_list_view.dart';

class AdminPanelPeopleView extends StatelessWidget {
  const AdminPanelPeopleView(
      {super.key, required this.realm, required this.workerItems});

  final Realm realm;
  final RealmResults<Worker> workerItems;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: viewportConstraints.maxHeight,
          minWidth: double.infinity,
        ),
        child: AdminPanelCustomListView(realm: realm, workerItems: workerItems),
      );
    });
  }
}
