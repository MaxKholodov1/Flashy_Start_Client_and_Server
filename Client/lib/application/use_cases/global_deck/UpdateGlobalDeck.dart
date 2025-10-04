import 'package:grpc/grpc.dart';
import 'package:flashy_start/domain/entities/GlobalDeck.dart';
import 'package:flashy_start/domain/failures/failures.dart';
import 'package:flashy_start/domain/repositories/GlobalDeckRepository.dart';
import 'package:flashy_start/domain/repositories/UserRepository.dart';
import 'package:flashy_start/infrastructure/storage/SecureStorageService.dart';

import '../../responses/global_deck/UpdateGlobalDeckResult.dart';
import '../GrpcCallerWithRetry.dart';

class UpdateGlobalDeck {
  final GlobalDeckRepository deckRepository;
  final UserRepository userRepository;
  final SecureStorageService storage;
  final GrpcCallerWithRetry grpcHelper;

  UpdateGlobalDeck(
      this.deckRepository,
      this.storage,
      this.userRepository,
      ) : grpcHelper = GrpcCallerWithRetry(userRepository, storage);

  Future<UpdateGlobalDeckResult> update({
    required searchResultDeck globalDeck,
  }) async {
    String? accessToken = await storage.read("access_token");
    accessToken ??= "";
    try {
      final res = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => deckRepository.updateGlobalDeck(
          accessToken: token,
          globalDeck: globalDeck,
        ),
      );
      if (res.failure != null) {
        return UpdateGlobalDeckResult(failure: res.failure);
      }
      return res;
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unavailable) {
        return UpdateGlobalDeckResult(failure: NetworkFailure());
      } else if (e.code == StatusCode.unauthenticated){
        return UpdateGlobalDeckResult(failure: AuthFailure(e.message!));
      }
      else if (e.code == StatusCode.permissionDenied){
        return  UpdateGlobalDeckResult(failure: DeckPermissionDenied(e.message!));
      }else if (e.code == StatusCode.invalidArgument){
        return UpdateGlobalDeckResult(failure: CreateDeckInvalidTitleFailure(e.message!));
      }
      else {
        return UpdateGlobalDeckResult(failure: UnknownFailure());
      }
    } on AuthFailure catch(e){
      return UpdateGlobalDeckResult(failure: e);
    }
    catch (e) {
      return UpdateGlobalDeckResult(failure: UnknownFailure());
    }
  }
}
