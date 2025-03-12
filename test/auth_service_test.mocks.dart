import 'dart:async' as _i4;

import 'package:expense_tracker/auth/auth_service.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:supabase_flutter/supabase_flutter.dart' as _i2;


class _FakeSupabaseClient_0 extends _i1.SmartFake
    implements _i2.SupabaseClient {
  _FakeSupabaseClient_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class MockAuthService extends _i1.Mock implements _i3.AuthService {
  MockAuthService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SupabaseClient get supabase =>
      (super.noSuchMethod(
            Invocation.getter(#supabase),
            returnValue: _FakeSupabaseClient_0(
              this,
              Invocation.getter(#supabase),
            ),
          )
          as _i2.SupabaseClient);

  @override
  _i4.Future<String?> signUp(String? email, String? password) =>
      (super.noSuchMethod(
            Invocation.method(#signUp, [email, password]),
            returnValue: _i4.Future<String?>.value(),
          )
          as _i4.Future<String?>);
}
