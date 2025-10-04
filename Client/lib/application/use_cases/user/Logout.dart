import 'package:flashy_start/infrastructure/storage/SecureStorageService.dart';


class Logout {
  final SecureStorageService storage;
  Logout(this.storage);
  Future<void> call() async {
    await storage.delete("access_token");
    await storage.delete("refresh_token");
  }
}
