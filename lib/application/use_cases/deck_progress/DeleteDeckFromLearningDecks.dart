
import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/progress_deck/DeleteDeckFromLearningDecksResult.dart';

import '../../../domain/failures/failures.dart';
import '../../../domain/repositories/UserDeckProgressRepository.dart';
import '../../../domain/repositories/UserRepository.dart';
import '../../../infrastructure/storage/SecureStorageService.dart';
import '../GrpcCallerWithRetry.dart';

class DeleteDeckFromLearningDecks {
  final UserRepository userRepository;
  final SecureStorageService storage;
  final GrpcCallerWithRetry grpcHelper;
  final UserDeckProgressRepository userDeckProgressRepository;

  DeleteDeckFromLearningDecks(
      this.userDeckProgressRepository,
      this.storage,
      this.userRepository,
      ) : grpcHelper = GrpcCallerWithRetry(userRepository, storage);

  Future<DeleteProgressDeckResult> delete({
    required int deckID,
  }) async {
    String? accessToken =  await storage.read("access_token");
    accessToken ??= "";
    try {
      final res = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => userDeckProgressRepository.deleteDeckFromLearningDecks(
          accessToken: token,
          deckID: deckID
        ),
      );

      if (res.failure != null) {
        return DeleteProgressDeckResult(failure: res.failure);
      }

      return DeleteProgressDeckResult(isSuccess: res.isSuccess);
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unavailable) {
        return DeleteProgressDeckResult(failure: NetworkFailure());
      }else if (e.code == StatusCode.unauthenticated){
        return DeleteProgressDeckResult(failure: AuthFailure(e.message!));
      }else if (e.code == StatusCode.permissionDenied){
        return DeleteProgressDeckResult(failure: AuthorCantDeleteProgressDeckFailure(e.message!));
      }
      else {
        return DeleteProgressDeckResult(failure: UnknownFailure());
      }
    } on AuthFailure catch(e){
      return DeleteProgressDeckResult(failure: e);
    }
    catch (e) {
      return DeleteProgressDeckResult(failure: UnknownFailure());
    }
  }
}
