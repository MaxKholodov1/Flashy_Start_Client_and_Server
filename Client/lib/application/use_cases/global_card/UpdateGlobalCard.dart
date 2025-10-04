import 'package:grpc/grpc.dart';
import 'package:flashy_start/domain/failures/failures.dart';
import 'package:flashy_start/domain/repositories/UserRepository.dart';
import 'package:flashy_start/infrastructure/storage/SecureStorageService.dart';

import '../../../domain/repositories/GlobalCardRepository.dart';
import '../../responses/global_card/UpdateGlobalCardResult.dart';
import '../GrpcCallerWithRetry.dart';

class UpdateGlobalCard {
  final GlobalCardRepository cardRepository;
  final UserRepository userRepository;
  final SecureStorageService storage;
  late final GrpcCallerWithRetry grpcHelper;

  UpdateGlobalCard(
      this.cardRepository,
      this.storage,
      this.userRepository,
      ) : grpcHelper = GrpcCallerWithRetry(userRepository, storage);

  Future<UpdateGlobalCardResult> update({
    required String question,
    required String answer,
    required int cardID,
    required int currentVersion,
  }) async {
    String? accessToken = await storage.read("access_token");
    accessToken ??= "";
    try {
      final res = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => cardRepository.updateGlobalCard(
          accessToken: token,
          question: question,
          answer: answer,
          cardID: cardID,
          currentVersion: currentVersion,
        ),
      );
      if (res.failure != null) {
        return UpdateGlobalCardResult(failure: res.failure);
      }
      return res;
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unavailable) {
        return UpdateGlobalCardResult(failure: NetworkFailure());
      } else if (e.code == StatusCode.unauthenticated){
        return UpdateGlobalCardResult(failure: AuthFailure(e.message!));
      }
      else if (e.code == StatusCode.permissionDenied){
        return  UpdateGlobalCardResult(failure: DeckPermissionDenied(e.message!));
      }else if (e.message == StatusCode.notFound){
        return UpdateGlobalCardResult(failure: GlobalCardNotFoundFailure(e.message!));
      }
      else {
        return UpdateGlobalCardResult(failure: UnknownFailure());
      }
    } on AuthFailure catch(e){
      return UpdateGlobalCardResult(failure: e);
    }
    catch (e) {
      return UpdateGlobalCardResult(failure: UnknownFailure());
    }
  }
}
