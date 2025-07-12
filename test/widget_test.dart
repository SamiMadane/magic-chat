import 'package:flutter_test/flutter_test.dart';

import 'package:magicchat/app.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const MagicChat());
    expect(find.byType(MagicChat), findsOneWidget);
  });
}
