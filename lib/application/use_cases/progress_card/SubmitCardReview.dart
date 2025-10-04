import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/SubmitCardReviewResult.dart';
import 'package:flashy_start/domain/entities/UserCardProgress.dart';
import 'package:flashy_start/domain/repositories/UserProgressCardRepository.dart';

import '../../../domain/entities/RecallQualityEnum.dart';
import '../../../domain/failures/failures.dart';
import '../../../domain/repositories/UserRepository.dart';
import '../../../infrastructure/storage/SecureStorageService.dart';
import '../GrpcCallerWithRetry.dart';

class SubmitCardReview{
  final UserRepository userRepository;
  final UserProgressCardRepository progressCardRepository;
  final SecureStorageService storage;
  final GrpcCallerWithRetry grpcHelper;

  SubmitCardReview(
      this.progressCardRepository,
      this.storage,
      this.userRepository,
      ) : grpcHelper = GrpcCallerWithRetry(userRepository, storage);

  Future<SubmitCardReviewResult> execute({
    required List<UserProgressCard> progressCards,
    required RecallQuality quality
  }) async {
    String? accessToken = await storage.read("access_token");
    accessToken ??= " ";
    try {
      final res = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => progressCardRepository.submitCardReview(
            accessToken: token,
            recallQuality: quality,
            progressCards: progressCards
        ),
      );

      if (res.failure != null) {
        return SubmitCardReviewResult(failure: res.failure);
      }
      return res;
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unavailable) {
        return SubmitCardReviewResult(failure: NetworkFailure());
      } else if (e.code == StatusCode.unauthenticated){
        return SubmitCardReviewResult(failure: AuthFailure(e.message!));
      }
      else {
        return SubmitCardReviewResult(failure: UnknownFailure());
      }
    } on AuthFailure catch(e){
      return SubmitCardReviewResult(failure: e);
    }
    catch (e) {
      return SubmitCardReviewResult(failure: UnknownFailure());
    }
  }
}