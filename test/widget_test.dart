import 'package:flutter_test/flutter_test.dart';
import 'package:magicchat/core/routes/app_router.dart';

import 'package:magicchat/magic_chat_app.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(MagicChat(appRouter: AppRouter()));
    expect(find.byType(MagicChat), findsOneWidget);
  });
}
