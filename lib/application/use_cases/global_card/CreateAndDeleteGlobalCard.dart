import 'package:grpc/grpc.dart';
import 'package:flashy_start/domain/failures/failures.dart';
import 'package:flashy_start/domain/repositories/UserRepository.dart';
import 'package:flashy_start/infrastructure/storage/SecureStorageService.dart';

import '../../../domain/repositories/GlobalCardRepository.dart';
import '../../responses/global_card/CreateGlobalCardResult.dart';
import '../../responses/global_card/DeleteGlobalCardResult.dart';
import '../GrpcCallerWithRetry.dart';
class CreateAndDeleteGlobalCard {
  final GlobalCardRepository _repository;
  final UserRepository userRepository;
  final SecureStorageService storage;
  late final GrpcCallerWithRetry grpcHelper;

  CreateAndDeleteGlobalCard(this._repository, this.storage, this.userRepository) {
    grpcHelper = GrpcCallerWithRetry(userRepository, storage);
  }

  Future<CreateGlobalCardResult> create({
    required String question,
    required String answer,
    required int deckID,
  }) async {
    String? accessToken = await storage.read("access_token");
    accessToken ??= "";
    try {
      final result = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => _repository.createGlobalCard(
          accessToken: token,
          answer: answer,
          question: question,
          deckID: deckID
        ),
      );
      return result;
    } catch (e) {
      if (e is GrpcError) {
        if (e.code == StatusCode.unavailable) {
          return CreateGlobalCardResult(failure: NetworkFailure());
        } else if (e.code == StatusCode.invalidArgument) {
          return CreateGlobalCardResult(failure: InvalidCardArgument(e.message!));
        } else if (e.code == StatusCode.internal) {
          return CreateGlobalCardResult(failure: UnknownFailure());
        }else if (e.code == StatusCode.unauthenticated){
          return CreateGlobalCardResult(failure: AuthFailure(e.message!));
        }else if (e.code == StatusCode.permissionDenied){
          return CreateGlobalCardResult(failure: DeckPermissionDenied(e.message!));
        }
        return CreateGlobalCardResult(failure: UnknownFailure());
      } else if (e is Failure) {
        return CreateGlobalCardResult(failure: e);
      }
      return CreateGlobalCardResult(failure: UnknownFailure());
    }
  }
  Future<DeleteGlobalCardResult> delete({
    required int cardID,
  }) async {
    String? accessToken = await storage.read("access_token");
    accessToken ??= "";
    try {
      final result = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => _repository.deleteGlobalCard(
            accessToken: token,
          cardID: cardID
        ),
      );
      return result;
    } catch (e) {
      if (e is GrpcError) {
        if (e.code == StatusCode.unavailable) {
          return DeleteGlobalCardResult(failure: NetworkFailure());
        }  else if (e.code == StatusCode.internal) {
          return DeleteGlobalCardResult(failure: UnknownFailure());
        }else if (e.code == StatusCode.unauthenticated){
          return DeleteGlobalCardResult(failure: AuthFailure(e.message!));
        }else if (e.code == StatusCode.permissionDenied){
          return DeleteGlobalCardResult(failure: DeckPermissionDenied(e.message!));
        }
        return DeleteGlobalCardResult(failure: UnknownFailure());
      } else if (e is Failure) {
        return DeleteGlobalCardResult(failure: e);
      }
      return DeleteGlobalCardResult(failure: UnknownFailure());
    }
  }
}
