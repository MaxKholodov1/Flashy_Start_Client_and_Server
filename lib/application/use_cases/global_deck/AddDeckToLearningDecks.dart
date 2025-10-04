
import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/global_deck/AddDeckToLearningDecks.dart';

import '../../../domain/failures/failures.dart';
import '../../../domain/repositories/GlobalDeckRepository.dart';
import '../../../domain/repositories/UserRepository.dart';
import '../../../infrastructure/storage/SecureStorageService.dart';
import '../GrpcCallerWithRetry.dart';

class AddDeckToLearningDecks {
  final GlobalDeckRepository deckRepository;
  final UserRepository userRepository;
  final SecureStorageService storage;
  final GrpcCallerWithRetry grpcHelper;

  AddDeckToLearningDecks(
      this.deckRepository,
      this.storage,
      this.userRepository,
      ) : grpcHelper = GrpcCallerWithRetry(userRepository, storage);

  Future<AddDeckToLearningDecksResult> add({
    required int deckID,
  }) async {
    try {
      String? accessToken = await storage.read("access_token");
      accessToken ??= "";
      final res = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => deckRepository.addDeckToLearningDecks(
          accessToken: token,
          deckID: deckID
        ),
      );
      if (res.failure != null) {
        return AddDeckToLearningDecksResult(failure: res.failure);
      }
      return res;
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unavailable) {
        return AddDeckToLearningDecksResult(failure: NetworkFailure());
      } else if (e.code == StatusCode.unauthenticated){
        return AddDeckToLearningDecksResult(failure: AuthFailure(e.message!));
      }
      else if (e.code == StatusCode.permissionDenied){
        return  AddDeckToLearningDecksResult(failure: DeckPermissionDenied(e.message!));
      }else {
        return AddDeckToLearningDecksResult(failure: UnknownFailure());
      }
    } on AuthFailure catch(e){
      return AddDeckToLearningDecksResult(failure: e);
    }
    catch (e) {
      return AddDeckToLearningDecksResult(failure: UnknownFailure());
    }
  }
}
