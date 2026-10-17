import 'package:flutter_test/flutter_test.dart';
import 'package:turismo_oaxaca/main.dart';

void main() {
  testWidgets('la aplicación muestra la pantalla inicial', (tester) async {
    await tester.pumpWidget(const TurismoOaxacaApp());
    await tester.pump();
    expect(find.text('Descubre Oaxaca'), findsOneWidget);
  });
}
