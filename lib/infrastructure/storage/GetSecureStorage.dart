import 'dart:io' show Platform;

import 'SecureStorageMobile.dart';
import 'SecureStorageService.dart';
import 'SecureStorageWindows.dart';

SecureStorageService getSecureStorage() {
  if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS || Platform.isLinux) {
    return SecureStorageMobile();
  } else if (Platform.isWindows) {
    return SecureStorageWindows();
  } else {
    throw UnsupportedError("Unsupported platform");
  }
}
