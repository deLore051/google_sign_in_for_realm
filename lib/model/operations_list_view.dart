import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import '/model/realm_models.dart';

class OperationsListView extends StatefulWidget {
  const OperationsListView({
    super.key,
    required this.realm,
    required this.operationItems,
  });

  final Realm realm;
  final RealmResults<Operation> operationItems;

  List<Operation> getSelectedItemsList() {
    return selectedItemsList;
  }

  bool selectedItemsListLengthChanged() {
    if (!selectedItemsList.equals(selectedItemsListOld)) {
      selectedItemsListOld = selectedItemsList;
      return true;
    }
    return false;
  }

  @override
  State<OperationsListView> createState() => _OperationsListViewState();
}

late RealmResults<Operation> operations;
List<Operation> selectedItemsList = [];
List<Operation> selectedItemsListOld = [];

class _OperationsListViewState extends State<OperationsListView> {
  @override
  Widget build(BuildContext context) {
    operations = getOperaionItems();
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: StreamBuilder(
          stream: operations.changes,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.blue.shade300,
              ));
            }
            return ListView.separated(
                restorationId: "addPersonBottomSheetOperationsList",
                //padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: getItemBuilder,
                separatorBuilder: getSeparatorBuilder,
                itemCount: operations.length);
          }),
    );
  }

  Widget getItemBuilder(BuildContext context, int index) {
    bool isSelected = selectedItemsList.contains(operations[index]);

    return SizedBox(
      height: 40,
      child: ListTile(
        onTap: () => selectTappedItem(index),
        hoverColor: Colors.transparent,
        selected: isSelected,
        title: Text(
          operations[index].name,
          style: TextStyle(color: isSelected ? Colors.blue : Colors.black87),
        ),
        iconColor: Colors.blue,
        trailing: isSelected ? const Icon(Icons.check) : null,
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

  void selectTappedItem(int index) {
    if (selectedItemsList.contains(operations[index])) {
      setState(() {
        selectedItemsList.remove(operations[index]);
      });
    } else {
      setState(() {
        selectedItemsList.add(operations[index]);
      });
    }
  }
}
