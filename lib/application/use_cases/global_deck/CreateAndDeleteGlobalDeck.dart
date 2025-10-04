import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/global_deck/CreateGlobalDeckResult.dart';
import 'package:flashy_start/domain/failures/failures.dart';
import 'package:flashy_start/domain/repositories/GlobalDeckRepository.dart';
import 'package:flashy_start/domain/repositories/UserRepository.dart';
import 'package:flashy_start/infrastructure/storage/SecureStorageService.dart';

import '../../responses/global_deck/DeleteGlobalDeckResult.dart';
import '../GrpcCallerWithRetry.dart';
class CreateAndDeleteGlobalDeck {
  final GlobalDeckRepository _repository;
  final UserRepository userRepository;
  final SecureStorageService storage;
  late final GrpcCallerWithRetry grpcHelper;

  CreateAndDeleteGlobalDeck(this._repository, this.storage, this.userRepository) {
    grpcHelper = GrpcCallerWithRetry(userRepository, storage);
  }

  Future<CreateGlobalDeckResult> create({
    required String title,
    required bool isPublic,
    String? description,
  }) async {
    String? accessToken = await storage.read("access_token");
    accessToken ??= "";
    try {
      final result = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => _repository.createGlobalDeck(
          accessToken: token,
          description: description,
          title: title,
          isPublic: isPublic,
        ),
      );
      return result;
    } catch (e) {
      if (e is GrpcError) {
        if (e.code == StatusCode.unavailable) {
          return CreateGlobalDeckResult(failure: NetworkFailure());
        } else if (e.code == StatusCode.invalidArgument) {
          return CreateGlobalDeckResult(failure: CreateDeckInvalidTitleFailure(e.message ?? ''));
        } else if (e.code == StatusCode.internal) {
          return CreateGlobalDeckResult(failure: UnknownFailure());
        }else if (e.code == StatusCode.unauthenticated){
          return CreateGlobalDeckResult(failure: AuthFailure(e.message!));
        }
        return CreateGlobalDeckResult(failure: UnknownFailure());
      } else if (e is Failure) {
        return CreateGlobalDeckResult(failure: e);
      }
      return CreateGlobalDeckResult(failure: UnknownFailure());
    }
  }
  Future<DeleteGlobalDeckResult> delete({
    required int deckID
  }) async{
    String? accessToken = await storage.read("access_token");
    accessToken ??= "";
    try {
      final result = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => _repository.deleteGlobalDeck(
          accessToken: token,
          deckID: deckID
        ),
      );
      return DeleteGlobalDeckResult(isSuccess: result);
    } catch (e) {
      if (e is GrpcError) {
        if (e.code == StatusCode.unavailable) {
          return DeleteGlobalDeckResult(failure: NetworkFailure());
        }  else if (e.code == StatusCode.internal) {
          return DeleteGlobalDeckResult(failure: UnknownFailure());
        }else if (e.code == StatusCode.unauthenticated){
          return DeleteGlobalDeckResult(failure: AuthFailure(e.message!));
        }else if (e.code == StatusCode.permissionDenied){
          return DeleteGlobalDeckResult(failure: DeckPermissionDenied(e.message!));
        }
        return DeleteGlobalDeckResult(failure: UnknownFailure());
      } else if (e is Failure) {
        return DeleteGlobalDeckResult(failure: e);
      }
      return DeleteGlobalDeckResult(failure: UnknownFailure());
    }
  }
}
