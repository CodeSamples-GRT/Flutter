abstract class AuthProvider {
  Future<bool> isAuthenticated();

  Future<bool> reAuthenticate(String? originalRequestPath);

  Future<Map<String, dynamic>?> getAuthHeaders({
    Map<String, dynamic>? serviceSettings,
  });

  Future<Map<String, dynamic>?> getAuthBody({
    Map<String, dynamic>? serviceSettings,
  });
}
