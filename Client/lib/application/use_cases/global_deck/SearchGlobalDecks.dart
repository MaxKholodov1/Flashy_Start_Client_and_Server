
import 'package:grpc/grpc.dart';

import '../../../domain/failures/failures.dart';
import '../../../domain/repositories/GlobalDeckRepository.dart';
import '../../../domain/repositories/UserRepository.dart';
import '../../../infrastructure/storage/SecureStorageService.dart';
import '../../responses/global_deck/SearchGlobalDecksResult.dart';
import '../GrpcCallerWithRetry.dart';

class SearchGlobalDecks {
  final GlobalDeckRepository deckRepository;
  final UserRepository userRepository;
  final SecureStorageService storage;
  final GrpcCallerWithRetry grpcHelper;

  SearchGlobalDecks(
      this.deckRepository,
      this.storage,
      this.userRepository,
      ) : grpcHelper = GrpcCallerWithRetry(userRepository, storage);

  Future<SearchGlobalDecksResult> search({
    required String query,
    required int limit,
    required int offset,
  }) async {
    String? accessToken = await storage.read("access_token");
    accessToken ??= "";
    try {
      final res = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => deckRepository.searchGlobalDecks(
          accessToken: token,
          offset: offset,
          limit: limit,
          query: query
        ),
      );
      if (res.failure != null) {
        return SearchGlobalDecksResult(failure: res.failure);
      }
      return res;
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unavailable) {
        return SearchGlobalDecksResult(failure: NetworkFailure());
      } else if (e.code == StatusCode.unauthenticated){
        return SearchGlobalDecksResult(failure: AuthFailure(e.message!));
      } else {
        return SearchGlobalDecksResult(failure: UnknownFailure());
      }
    } on AuthFailure catch(e){
      return SearchGlobalDecksResult(failure: e);
    }
    catch (e) {
      return SearchGlobalDecksResult(failure: UnknownFailure());
    }
  }
}
