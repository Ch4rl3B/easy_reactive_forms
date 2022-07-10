// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:easy_reactive_forms/flutter_form_example.dart';
import 'package:easy_reactive_forms/main.dart';
import 'package:easy_reactive_forms/my_home_page.dart';
import 'package:easy_reactive_forms/reactive_form_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'test_app.dart';

void main() {
  group('On App start', () {
    testWidgets('home view is loaded', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      expect(find.byType(MyHomePage), findsOneWidget);
      expect(find.text(title), findsOneWidget);
    });
    testWidgets('MyHomeView widgets are present', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byKey(const Key('flutter_example')), findsOneWidget);
      expect(find.byKey(const Key('reactive_example')), findsOneWidget);
      expect(find.text('Flutter Form example'), findsOneWidget);
      expect(find.text('Reactive Form example'), findsOneWidget);
    });
  });
  group('On Home Page', () {
    testWidgets(
        'when flutter example button is pressed '
        'then navigate to FlutterFormExample', (WidgetTester tester) async {
      // Having
      await tester.pumpWidget(const MyApp());

      // Then
      expect(find.byType(MyHomePage), findsOneWidget);
      expect(find.byKey(const Key('flutter_example')), findsOneWidget);

      // When
      await tester.tap(find.byKey(const Key('flutter_example')));
      await tester.pumpAndSettle();

      //Then
      expect(find.byType(FlutterFormExample), findsOneWidget);
    });
    testWidgets(
        'when reactive example button is pressed '
        'then navigate to ReactiveFormExample', (WidgetTester tester) async {
      // Having
      await tester.pumpWidget(const MyApp());

      // Then
      expect(find.byType(MyHomePage), findsOneWidget);
      expect(find.byKey(const Key('flutter_example')), findsOneWidget);

      // When
      await tester.tap(find.byKey(const Key('reactive_example')));
      await tester.pumpAndSettle();

      //Then
      expect(find.byType(ReactiveFormExample), findsOneWidget);
    });
  });
  group('On FlutterFormExample Page', () {
    testWidgets('all widgets are present', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: FlutterFormExample()));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
    });
    testWidgets('when text field has value a validation error is not shown',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: FlutterFormExample()));

      //When
      await tester.enterText(find.byType(TextFormField), 'hello');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //Then
      expect(find.text('Please enter some text'), findsNothing);
    });
    testWidgets('when text field is cleared a validation error is shown',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: FlutterFormExample()));

      //When
      await tester.enterText(find.byType(TextFormField), 'hello');
      await tester.enterText(find.byType(TextFormField), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //Then
      expect(find.text('Please enter some text'), findsOneWidget);
    });
  });
  group('On ReactiveFormExample Page', () {
    testWidgets('all widgets are present', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: ReactiveFormExample()));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(ReactiveForm), findsOneWidget);
      expect(find.byType(ReactiveTextField<String>), findsOneWidget);
    });
    testWidgets('when text field has value a validation error is not shown',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: ReactiveFormExample()));

      //When
      await tester.enterText(find.byType(ReactiveTextField<String>), 'hello');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      //Then
      expect(find.text('Please enter some text'), findsNothing);
    });
    testWidgets('when text field is cleared a validation error is shown',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const TestApp(child: ReactiveFormExample()));

      //When
      await tester.enterText(find.byType(ReactiveTextField<String>), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      //Then
      expect(find.text('Please enter some text'), findsOneWidget);
    });
  });
}
