import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/auth/user_login.dart';

void main() {
  testWidgets('Login screen loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: UserLogin()));

    expect(find.byType(TextField), findsNWidgets(2));

    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
