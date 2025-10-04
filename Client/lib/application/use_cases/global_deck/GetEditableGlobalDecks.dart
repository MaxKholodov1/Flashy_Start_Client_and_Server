import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/global_deck/GetGlobalDecksResult.dart';
import 'package:flashy_start/domain/entities/GlobalDeck.dart';
import 'package:flashy_start/domain/failures/failures.dart';
import 'package:flashy_start/domain/repositories/GlobalDeckRepository.dart';
import 'package:flashy_start/domain/repositories/UserRepository.dart';
import 'package:flashy_start/infrastructure/storage/SecureStorageService.dart';

import '../GrpcCallerWithRetry.dart';

class GetEditableGlobalDecks {
  final GlobalDeckRepository deckRepository;
  final UserRepository userRepository;
  final SecureStorageService storage;
  final GrpcCallerWithRetry grpcHelper;

  GetEditableGlobalDecks(
      this.deckRepository,
      this.storage,
      this.userRepository,
      ) : grpcHelper = GrpcCallerWithRetry(userRepository, storage);

  Future<GetGlobalDecksResult> get() async {
    String? accessToken = await storage.read("access_token");
    accessToken ??= "";
    try {
      final res = await grpcHelper.callWithTokenRetry(
        accessToken: accessToken,
        call: (token) => deckRepository.getEditableGlobalDecks(
          accessToken: token,
        ),
      );

      if (res.failure != null) {
        return GetGlobalDecksResult(failure: res.failure);
      }

      return GetGlobalDecksResult(globalDecks: res.globalDecks);
    } on GrpcError catch (e) {
      if (e.code == StatusCode.unavailable) {
        return GetGlobalDecksResult(failure: NetworkFailure());
      }else if (e.code == StatusCode.unauthenticated){
        return GetGlobalDecksResult(failure: AuthFailure(e.message!));
      }
      else {
        return GetGlobalDecksResult(failure: UnknownFailure());
      }
    } on AuthFailure catch(e){
      return GetGlobalDecksResult(failure: e);
    }
    catch (e) {
      return GetGlobalDecksResult(failure: UnknownFailure());
    }
  }

  List<searchResultDeck>? getCache() {
    return deckRepository.getEditableGlobalDecksCache();
  }
}
