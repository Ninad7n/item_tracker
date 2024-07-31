import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../view/home_screen.dart';

class ManageItemProvider extends ChangeNotifier {
  int? updateId;
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();

  List<Map<String, dynamic>> itemData = [];

  addToItemList({tName, tDesc}) {
    if (formKey.currentState!.validate()) {
      itemData.addAll([
        {
          "id": DateTime.now().millisecondsSinceEpoch,
          "name": tName ?? name.text,
          "desc": tDesc ?? desc.text,
        },
      ]);
      Fluttertoast.showToast(msg: "Item added");
    }
    onClear();
  }

  onClear() {
    name.clear();
    desc.clear();
    updateId = null;
    notifyListeners();
  }

  onEdit(id) {
    updateId = id;
    name.text =
        itemData.where((element) => element['id'] == id).toList().first['name'];
    desc.text =
        itemData.where((element) => element['id'] == id).toList().first['desc'];
    notifyListeners();
  }

  editToItemList(id) {
    if (formKey.currentState!.validate()) {
      int index = itemData.indexWhere((element) => element['id'] == id);
      itemData[index]['name'] = name.text;
      itemData[index]['desc'] = desc.text;
    }
    onClear();
  }

  deleteItem(id) {
    itemData.removeWhere((element) => element['id'] == id);
    notifyListeners();
  }
}
