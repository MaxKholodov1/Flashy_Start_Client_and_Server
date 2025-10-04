
import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/progress_deck/GetProgressDecksResult.dart';
import 'package:flashy_start/domain/entities/UserDeckProgress.dart';
import 'package:flashy_start/domain/repositories/UserDeckProgressRepository.dart';

import '../../../domain/failures/failures.dart';
import '../../../domain/repositories/UserRepository.dart';
import '../../../infrastructure/storage/SecureStorageService.dart';
import '../GrpcCallerWithRetry.dart';

class SelectDecksForReviewToday {
  final UserRepository userRepository;
  final SecureStorageService storage;
  final GrpcCallerWithRetry grpcHelper;
  final UserDeckProgressRepository userDeckProgressRepository;

  SelectDecksForReviewToday(
      this.userDeckProgressRepository,
      this.storage,
      this.userRepository,
      ) : grpcHelper = GrpcCallerWithRetry(userRepository, storage);

  Future<GetProgressDecksResult> select({
    required List<UserDeckProgress> progressDecks
  }) async {
    String? accessToken =  await storage.read("access_token");
    accessToken ??= "";
    try {
      final res = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => userDeckProgressRepository.selectDecksForTodayReview(
          accessToken: token,
          progressDecks: progressDecks
        ),
      );

      if (res.failure != null) {
        return GetProgressDecksResult(failure: res.failure);
      }

      return GetProgressDecksResult(userDeckProgressList: res.userDeckProgressList);
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unavailable) {
        return GetProgressDecksResult(failure: NetworkFailure());
      }else if (e.code == StatusCode.unauthenticated){
        return GetProgressDecksResult(failure: AuthFailure(e.message!));
      }
      else {
        return GetProgressDecksResult(failure: UnknownFailure());
      }
    } on AuthFailure catch(e){
      return GetProgressDecksResult(failure: e);
    }
    catch (e) {
      return GetProgressDecksResult(failure: UnknownFailure());
    }
  }
}
