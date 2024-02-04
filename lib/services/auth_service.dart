import 'package:employee_attendance/services/db_service.dart';
import 'package:employee_attendance/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends ChangeNotifier {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  final DbService _dbService = DbService();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> registerEmployee(
      String email, String password, BuildContext context) async {
    try {
      setIsLoading = true;
      if (email.isEmpty || password.isEmpty) {
        throw Exception("Email and password cannot be empty");
      }
      final AuthResponse response =
          await _supabaseClient.auth.signUp(email: email, password: password);
      if (context.mounted) {
        _dbService.insertNewUser(email, response.user!.id);

        Utils.showSnackBar("Registration successful", context,
            color: Colors.green);
        await loginEmployee(email, password, context);
        if (context.mounted) {
          Navigator.pop(context);
        }
      }
    } catch (e) {
      setIsLoading = false;
      if (context.mounted) {
        Utils.showSnackBar(e.toString(), context, color: Colors.red);
      }
    }
  }

  Future loginEmployee(
      String email, String password, BuildContext context) async {
    try {
      setIsLoading = true;
      if (email.isEmpty || password.isEmpty) {
        throw Exception("Email and password cannot be empty");
      }

      await _supabaseClient.auth
          .signInWithPassword(email: email, password: password);
      setIsLoading = false;
    } catch (e) {
      setIsLoading = false;
      if (context.mounted) {
        Utils.showSnackBar(e.toString(), context, color: Colors.red);
      }
    }
  }

  Future signOut() async {
    await _supabaseClient.auth.signOut();
    notifyListeners();
  }

  User? get currentUser => _supabaseClient.auth.currentUser;
}
