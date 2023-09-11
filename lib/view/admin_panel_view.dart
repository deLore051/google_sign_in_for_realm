import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import '../model/add_person_modal_bottom_sheet.dart';
import '../model/operation_modal_bottom_sheet.dart';
import '../model/operations_list_view.dart';
import '../view/admin_panel_operations_view.dart';
import '../view/admin_panel_people_view.dart';

import '../../model/realm_models.dart';

class AdminPanelView extends StatefulWidget {
  const AdminPanelView({
    super.key,
    required this.realm,
    required this.workerItems,
    required this.operationItems,
  });

  final Realm realm;
  final RealmResults<Worker> workerItems;
  final RealmResults<Operation> operationItems;

  @override
  State<AdminPanelView> createState() => _AdminPanelViewState();
}

class _AdminPanelViewState extends State<AdminPanelView> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late final List<Widget> _pages = [
    AdminPanelPeopleView(realm: widget.realm, workerItems: widget.workerItems),
    AdminPanelOperationsView(
      operationItems: widget.operationItems,
      realm: widget.realm,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(),
        title: _selectedIndex == 0
            ? const Text("People")
            : const Text("Operations"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => showModalBottomSheet<dynamic>(
                isDismissible: true,
                isScrollControlled: true,
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                )),
                builder: (context) => Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: _selectedIndex == 0
                      ? AddPersonModalBottomSheet(
                          realm: widget.realm,
                          scaffoldKey: _scafoldKey,
                          heightToUse: MediaQuery.of(context).size.height * 0.8,
                          operationItems: widget.operationItems,
                        )
                      : OperationModalBottomSheet(
                          realm: widget.realm,
                          heightToUse: MediaQuery.of(context).size.height * 0.8,
                          operationItems: widget.operationItems),
                ),
              ).whenComplete(() {
                setState(() {
                  selectedRole = "";
                  selectedItemsList = [];
                });
              }),
            ),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "People",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box_outlined),
              label: "Operations",
            ),
          ]),
    );
  }
}
