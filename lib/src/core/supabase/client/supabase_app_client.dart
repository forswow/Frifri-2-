import 'package:supabase_flutter/supabase_flutter.dart';

base mixin class SupaBaseAppClient {
  final supaBaseClient = Supabase.instance.client;
}
