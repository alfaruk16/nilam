import 'package:flutter/material.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/features/data/data_sources/local_keys.dart';
import 'package:nilam/features/domain/entities/profile.dart';
import 'package:nilam/features/domain/entities/token_response.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/login/view/login_screen.dart';
import 'package:nilam/features/presentation/otp/view/otp_screen.dart';

class LocalData {
  static final localStorageRepo = getIt<LocalStorageRepo>();

  static String? getToken() {
    final token = localStorageRepo.read(key: tokenDB);
    return token;
  }

  static Future<bool> isLoggedIn() async {
    final token =
        await localStorageRepo.readModel<TokenResponse>(key: clientDB);
    if (token != null && token.user != null && token.user!.isNotEmpty) {
      return true;
    }
    return false;
  }

  static Future<Profile?> getProfile() async {
    final profile = await localStorageRepo.readModel<Profile>(key: profileDB);
    if (profile != null) {
      return profile;
    }
    return null;
  }

  static Future<String?> getUserDisplayId() async {
    final profile = await localStorageRepo.readModel<Profile>(key: profileDB);
    if (profile != null) {
      return profile.displayId!;
    }
    return null;
  }

  static Future<bool> hasEmail() async {
    final profile = await localStorageRepo.readModel<Profile>(key: profileDB);
    if (profile != null) {
      return profile.email != null && profile.email!.isNotEmpty;
    }
    return false;
  }

  static Future<bool> isVerifiedUser(IFlutterNavigator iFlutterNavigator,
      {required VoidCallback callback}) async {
    final client =
        await localStorageRepo.readModel<TokenResponse>(key: clientDB);
    final profile = await localStorageRepo.readModel<Profile>(key: profileDB);

    if (client != null) {
      if (client.user != null && client.user!.isNotEmpty) {
        if (profile != null) {
          if (profile.mobileVerifiedAt != null) {
            return true;
          } else {
            iFlutterNavigator
                .push(OtpScreen.route(requestOtp: true))
                .then((value) async {
              callback();
            });
          }
        } else {
          iFlutterNavigator.push(LoginScreen.route()).then((value) async {
            callback();
          });
        }
      } else {
        iFlutterNavigator.push(LoginScreen.route()).then((value) async {
          callback();
        });
      }
    }
    return false;
  }
}
