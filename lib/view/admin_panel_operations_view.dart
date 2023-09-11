import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import '../model/realm_models.dart';
import '../model/operations_list_view.dart';

class AdminPanelOperationsView extends StatefulWidget {
  const AdminPanelOperationsView(
      {super.key, required this.realm, required this.operationItems});

  final Realm realm;
  final RealmResults<Operation> operationItems;

  @override
  State<AdminPanelOperationsView> createState() =>
      _AdminPanelOperationsViewState();
}

class _AdminPanelOperationsViewState extends State<AdminPanelOperationsView> {
  @override
  Widget build(BuildContext context) {
    operations = getOperaionItems();
    return StreamBuilder(
        stream: operations.changes,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(color: Colors.blue.shade300),
            );
          }
          return ListView.separated(
            restorationId: "operationsViewOperationsList",
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: getItemBuilder,
            separatorBuilder: getSeparatorBuilder,
            itemCount: operations.length,
          );
        });
  }

  Widget getItemBuilder(BuildContext context, int index) {
    bool isSelected = selectedItemsList.contains(operations[index]);

    return SizedBox(
      height: 40,
      child: ListTile(
        onTap: () {
          setState(() {});
        },
        hoverColor: Colors.transparent,
        title: Text(
          operations[index].name,
          style: TextStyle(color: isSelected ? Colors.blue : Colors.black87),
        ),
        trailing: null,
      ),
    );
  }

  Widget getSeparatorBuilder(BuildContext context, int index) {
    return const Divider(
      thickness: 1,
      color: Colors.grey,
    );
  }

  RealmResults<Operation> getOperaionItems() {
    if (widget.operationItems.isEmpty) {
      return widget.realm.all<Operation>();
    }
    return widget.operationItems;
  }
}
