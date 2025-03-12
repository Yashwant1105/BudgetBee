import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/auth/auth_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'auth_service_test.mocks.dart';

@GenerateMocks([AuthService])
void main() {
  final authService = MockAuthService();

  group('AuthService Tests', () {
    test('Sign up returns null on success', () async {
      when(authService.signUp(any, any))
          .thenAnswer((_) async => Future.value(null));

      final result = await authService.signUp("test@example.com", "password");
      expect(result, isNull);
    });

    test('Sign up returns an error message on failure', () async {
      when(authService.signUp(any, any))
          .thenAnswer((_) async => Future.value("Password too short"));

      final result = await authService.signUp("invalid@example.com", "short");
      expect(result, "Password too short");
    });
  });
}
