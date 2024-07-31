import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../controller/manage_item_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: formKey,
          child: Consumer<ManageItemProvider>(builder: (context, state, child) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TextFormField(
                  key: const Key("nameKey"),
                  controller: state.name,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Invalid field";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter Name",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  key: const Key("descKey"),
                  controller: state.desc,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(400),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Invalid field";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter Description",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                MaterialButton(
                  color: Colors.green,
                  onPressed: () {
                    state.updateId == null
                        ? state.addToItemList()
                        : state.editToItemList(state.updateId);
                  },
                  child: Text(
                    state.updateId != null ? "Update Item" : "Add Item",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  style:
                      const ButtonStyle(visualDensity: VisualDensity.compact),
                  onPressed: state.onClear,
                  child: const Text(
                    "clear",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const Divider(),
                ListView(
                  shrinkWrap: true,
                  children: state.itemData.map((e) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e['name'].toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    e['desc'].toString(),
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                state.onEdit(e['id']);
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                state.deleteItem(e['id']);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                      ],
                    );
                  }).toList(),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
