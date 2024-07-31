import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:item_tracker_pj/main.dart';

void main() {
  testWidgets('test case 1', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    var textField = find.byType(TextFormField);

    var fab = find.byType(MaterialButton);

    expect(fab, findsOneWidget);
    expect(textField, findsNWidgets(2));
  });

  testWidgets('test case 2', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    var name = find.byKey(const Key("nameKey"));
    var desc = find.byKey(const Key("descKey"));
    var submitBtn = find.byType(MaterialButton);

    await tester.enterText(
        name, "The standard Lorem Ipsum passage, used since the 1500s");
    await tester.enterText(desc,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");

    await tester.tap(submitBtn);

    await tester.pump();

    // expect(find.text("Item added"), findsOneWidget);
  });
}
