import 'package:grpc/grpc.dart';
import 'package:flashy_start/domain/failures/failures.dart';
import 'package:flashy_start/domain/repositories/GlobalDeckRepository.dart';
import 'package:flashy_start/domain/repositories/UserRepository.dart';
import 'package:flashy_start/infrastructure/storage/SecureStorageService.dart';

import '../../responses/global_deck/GetGlobalDeckInfoResult.dart';
import '../GrpcCallerWithRetry.dart';

class GetGlobalDeckInfoById {
  final GlobalDeckRepository deckRepository;
  final UserRepository userRepository;
  final SecureStorageService storage;
  final GrpcCallerWithRetry grpcHelper;

  GetGlobalDeckInfoById(
      this.deckRepository,
      this.storage,
      this.userRepository,
      ) : grpcHelper = GrpcCallerWithRetry(userRepository, storage);

  Future<GetGlobalDeckInfoResult> get({
    required int ID,
  }) async {
    String? accessToken = await storage.read("access_token");
    accessToken ??= "";
    try {
      final res = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => deckRepository.getGlobalDeckByID(
          accessToken: token,
          ID: ID
        ),
      );

      if (res.failure != null) {
        return GetGlobalDeckInfoResult(failure: res.failure);
      }
      return res;
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unavailable) {
        return GetGlobalDeckInfoResult(failure: NetworkFailure());
      } else if (e.code == StatusCode.unauthenticated){
        return GetGlobalDeckInfoResult(failure: AuthFailure(e.message!));
      }
      else {
        return GetGlobalDeckInfoResult(failure: UnknownFailure());
      }
    } on AuthFailure catch(e){
      return GetGlobalDeckInfoResult(failure: e);
    }
    catch (e) {
      return GetGlobalDeckInfoResult(failure: UnknownFailure());
    }
  }
}
