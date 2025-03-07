import 'package:flutter/material.dart';
import 'package:expense_tracker/auth/user_login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://qwfmfylcpohdooqjhwdf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF3Zm1meWxjcG9oZG9vcWpod2RmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg5MjQ1MTcsImV4cCI6MjA1NDUwMDUxN30.vNqqySgMQyz9qp_si4QkOg7RPxurqx2NTnk1oIJ1xFY',
  );
  runApp(const UserLogin());
}
