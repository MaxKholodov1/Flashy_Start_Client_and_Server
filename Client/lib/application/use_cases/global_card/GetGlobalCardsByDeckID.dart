import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/global_card/GetGlobalCardsResult.dart';

import '../../../domain/failures/failures.dart';
import '../../../domain/repositories/GlobalCardRepository.dart';
import '../../../domain/repositories/UserRepository.dart';
import '../../../infrastructure/storage/SecureStorageService.dart';
import '../GrpcCallerWithRetry.dart';

class GetGlobalCardsByDeckID{
  final GlobalCardRepository repository;
  final UserRepository userRepository;
  final SecureStorageService storage;
  late final GrpcCallerWithRetry grpcHelper;

  GetGlobalCardsByDeckID(this.repository, this.storage, this.userRepository) {
    grpcHelper = GrpcCallerWithRetry(userRepository, storage);
  }
  Future<GetGlobalCardsResult> get({required int deckID}) async{
    String? accessToken = await storage.read("access_token");
    accessToken ??= "";
    try {
      final result = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => repository.getGlobalCardsByDeckID(
            accessToken: token,
            deckID: deckID
        ),
      );
      return result;
    } catch (e) {
      if (e is GrpcError) {
        if (e.code == StatusCode.unavailable) {
          return GetGlobalCardsResult(failure: NetworkFailure());
        } else if (e.code == StatusCode.internal) {
          return GetGlobalCardsResult(failure: UnknownFailure());
        }else if (e.code == StatusCode.unauthenticated){
          return GetGlobalCardsResult(failure: AuthFailure(e.message!));
        }
        return GetGlobalCardsResult(failure: UnknownFailure());
      } else if (e is Failure) {
        return GetGlobalCardsResult(failure: e);
      }
      return GetGlobalCardsResult(failure: UnknownFailure());
    }
  }
}