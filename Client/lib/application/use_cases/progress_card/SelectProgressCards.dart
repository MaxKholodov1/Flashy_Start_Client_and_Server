import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/GetProgressCardsResult.dart';
import 'package:flashy_start/domain/repositories/UserProgressCardRepository.dart';

import '../../../domain/entities/UserCardProgress.dart';
import '../../../domain/failures/failures.dart';
import '../../../domain/repositories/UserRepository.dart';
import '../../../infrastructure/storage/SecureStorageService.dart';
import '../GrpcCallerWithRetry.dart';

class SelectProgressCards {
  final UserRepository userRepository;
  final UserProgressCardRepository progressCardRepository;
  final SecureStorageService storage;
  final GrpcCallerWithRetry grpcHelper;

  SelectProgressCards(
      this.progressCardRepository,
      this.storage,
      this.userRepository,
      ) : grpcHelper = GrpcCallerWithRetry(userRepository, storage);

  Future<GetProgressCardsResult> selectNew({
    required List<UserProgressCard> progressCards,
  }) async {
    String? accessToken = await storage.read("access_token");
    accessToken ??= " ";
    try {
      final res = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => progressCardRepository.selectNewProgressCards(
            accessToken: token,
          progressCards: progressCards
        ),
      );

      if (res.failure != null) {
        return GetProgressCardsResult(failure: res.failure);
      }
      return res;
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unavailable) {
        return GetProgressCardsResult(failure: NetworkFailure());
      } else if (e.code == StatusCode.unauthenticated) {
        return GetProgressCardsResult(failure: AuthFailure(e.message!));
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
  Future<GetProgressCardsResult> selectFamiliar({
    required List<UserProgressCard> progressCards,
  }) async {
    String? accessToken = await storage.read("access_token");
    accessToken ??= " ";
    try {
      final res = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => progressCardRepository.selectFamiliarProgressCards(
            accessToken: token,
            progressCards: progressCards
        ),
      );

      if (res.failure != null) {
        return GetProgressCardsResult(failure: res.failure);
      }
      return res;
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unavailable) {
        return GetProgressCardsResult(failure: NetworkFailure());
      } else if (e.code == StatusCode.unauthenticated) {
        return GetProgressCardsResult(failure: AuthFailure(e.message!));
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