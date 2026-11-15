import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:atelier_01_responsive/main.dart';

void main() {
  testWidgets('Server status app smoke test', (WidgetTester tester) async {
    // Construisez votre application et déclenchez une frame.
    await tester.pumpWidget(const MyApp());

    // Vérifiez que le texte 'Server' (présent dans votre ServerStatusCard) s'affiche bien.
    expect(find.text('Server'), findsOneWidget);

    // Vérifiez que le bouton de redémarrage (Restart) est bien présent.
    expect(find.text('Restart'), findsOneWidget);
  });
}