class RefreshTokenResult {
  final String accessToken;
  final String? refreshToken;
  final int? userID;
  final String? errorMessage;

  RefreshTokenResult({
    required this.accessToken,
    this.userID,
    this.refreshToken,
    this.errorMessage,
  });
}
