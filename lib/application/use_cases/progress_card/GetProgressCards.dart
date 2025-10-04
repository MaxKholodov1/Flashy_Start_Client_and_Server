import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/GetProgressCardsResult.dart';
import 'package:flashy_start/domain/repositories/UserProgressCardRepository.dart';

import '../../../domain/failures/failures.dart';
import '../../../domain/repositories/UserRepository.dart';
import '../../../infrastructure/storage/SecureStorageService.dart';
import '../GrpcCallerWithRetry.dart';

class GetProgressCardsByDeckID {
  final UserRepository userRepository;
  final UserProgressCardRepository progressCardRepository;
  final SecureStorageService storage;
  final GrpcCallerWithRetry grpcHelper;

  GetProgressCardsByDeckID(
      this.progressCardRepository,
      this.storage,
      this.userRepository,
      ) : grpcHelper = GrpcCallerWithRetry(userRepository, storage);

  Future<GetProgressCardsResult> getAll({
    required int deckID,
  }) async {
    String? accessToken = await storage.read("access_token");
    accessToken ??= " ";
    try {
      final res = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => progressCardRepository.getProgressCardsByDeckID(
            accessToken: token,
            deckID: deckID
        ),
      );

      if (res.failure != null) {
        return GetProgressCardsResult(failure: res.failure);
      }
      return res;
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unavailable) {
        return GetProgressCardsResult(failure: NetworkFailure());
      } else if (e.code == StatusCode.unauthenticated){
        return GetProgressCardsResult(failure: AuthFailure(e.message!));
      }else if (e.code == StatusCode.permissionDenied){
        return GetProgressCardsResult(failure: DeckPermissionDenied(e.message!));
      }
      else {
        return GetProgressCardsResult(failure: UnknownFailure());
      }
    } on AuthFailure catch(e){
      return GetProgressCardsResult(failure: e);
    }
    catch (e) {
      return GetProgressCardsResult(failure: UnknownFailure());
    }
  }

  Future<GetProgressCardsResult> getForReviewToday({
    required int deckID,
  }) async {
    String? accessToken = await storage.read("access_token");
    accessToken ??= " ";
    try {
      final res = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => progressCardRepository.getProgressCardsForTodayReview(
            accessToken: token,
            deckID: deckID
        ),
      );

      if (res.failure != null) {
        return GetProgressCardsResult(failure: res.failure);
      }
      return res;
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unavailable) {
        return GetProgressCardsResult(failure: NetworkFailure());
      } else if (e.code == StatusCode.unauthenticated){
        return GetProgressCardsResult(failure: AuthFailure(e.message!));
      }else if (e.code == StatusCode.permissionDenied){
        return GetProgressCardsResult(failure: DeckPermissionDenied(e.message!));
      }
      else {
        return GetProgressCardsResult(failure: UnknownFailure());
      }
    } on AuthFailure catch(e){
      return GetProgressCardsResult(failure: e);
    }
    catch (e) {
      return GetProgressCardsResult(failure: UnknownFailure());
    }
  }
}