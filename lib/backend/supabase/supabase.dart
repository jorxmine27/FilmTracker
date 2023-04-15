import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://hvsuuzhyftcyxhqvvjtz.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2c3V1emh5ZnRjeXhocXZ2anR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU3NzU1OTUsImV4cCI6MTk5MTM1MTU5NX0.XXjMArJiuIrGzTmddCtWzMwXLAG4qXfCgIKe0NkB_nc';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
      );
}
