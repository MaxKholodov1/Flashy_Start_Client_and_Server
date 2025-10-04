
import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/global_deck/AddEditorToGlobalDeck.dart';
import 'package:flashy_start/application/responses/global_deck/DemoteEditorToLearnerResult.dart';

import '../../../domain/failures/failures.dart';
import '../../../domain/repositories/GlobalDeckRepository.dart';
import '../../../domain/repositories/UserRepository.dart';
import '../../../infrastructure/storage/SecureStorageService.dart';
import '../GrpcCallerWithRetry.dart';
class EditorUseCases {
  final GlobalDeckRepository deckRepository;
  final UserRepository userRepository;
  final SecureStorageService storage;
  final GrpcCallerWithRetry grpcHelper;

  EditorUseCases(
      this.deckRepository,
      this.storage,
      this.userRepository,
      ) : grpcHelper = GrpcCallerWithRetry(userRepository, storage);

  Future<AddEditorToGlobalDeckResult> add({
    required int deckID,
    required String userName
  }) async {
    try {
      String? accessToken = await storage.read("access_token");
      accessToken ??= "";
      final res = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => deckRepository.addEditorToGlobalDeck(
            accessToken: token,
            deckID: deckID,
          userName: userName
        ),
      );
      if (res.failure != null) {
        return AddEditorToGlobalDeckResult(failure: res.failure);
      }
      return res;
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unavailable) {
        return AddEditorToGlobalDeckResult(failure: NetworkFailure());
      } else if (e.code == StatusCode.unauthenticated){
        return AddEditorToGlobalDeckResult(failure: AuthFailure(e.message!));
      }else if (e.code == StatusCode.alreadyExists){
        return AddEditorToGlobalDeckResult(failure: SuchPermissionAlreadyExistsFailure(e.message!));
      }
      else if (e.code == StatusCode.permissionDenied){
        return  AddEditorToGlobalDeckResult(failure: DeckPermissionDenied(e.message!));
      }else if (e.code == StatusCode.notFound){
        return AddEditorToGlobalDeckResult(failure: UserNotFoundFailure(e.message!));
      }
      else {
        return AddEditorToGlobalDeckResult(failure: UnknownFailure());
      }
    } on AuthFailure catch(e){
      return AddEditorToGlobalDeckResult(failure: e);
    }
    catch (e) {
      return AddEditorToGlobalDeckResult(failure: UnknownFailure());
    }
  }


  Future<DemoteEditorToLearnerResult> demoteToLearner({
    required int deckID,
    required String userName
  }) async {
    try {
      String? accessToken = await storage.read("access_token");
      accessToken ??= "";
      final res = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => deckRepository.demoteEditorToLearner(
            accessToken: token,
            deckID: deckID,
            userName: userName
        ),
      );
      if (res.failure != null) {
        return DemoteEditorToLearnerResult(failure: res.failure);
      }
      return res;
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unavailable) {
        return DemoteEditorToLearnerResult(failure: NetworkFailure());
      } else if (e.code == StatusCode.unauthenticated){
        return DemoteEditorToLearnerResult(failure: AuthFailure(e.message!));
      }else if (e.code == StatusCode.alreadyExists){
        return DemoteEditorToLearnerResult(failure: SuchPermissionAlreadyExistsFailure(e.message!));
      }
      else if (e.code == StatusCode.permissionDenied){
        return  DemoteEditorToLearnerResult(failure: DeckPermissionDenied(e.message!));
      }else if (e.code == StatusCode.notFound){
        return DemoteEditorToLearnerResult(failure: UserNotFoundFailure(e.message!));
      }
      else {
        return DemoteEditorToLearnerResult(failure: UnknownFailure());
      }
    } on AuthFailure catch(e){
      return DemoteEditorToLearnerResult(failure: e);
    }
    catch (e) {
      return DemoteEditorToLearnerResult(failure: UnknownFailure());
    }
  }
}
