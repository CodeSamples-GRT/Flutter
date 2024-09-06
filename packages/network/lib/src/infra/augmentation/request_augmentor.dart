mixin RequestAugmentor {
  /// Headers augmentations
  Future<Map<String, String>?> headers({
    Map<String, dynamic>? serviceSettings,
  });

  /// Body augmentations
  Future<Map<String, dynamic>?> body({
    Map<String, dynamic>? serviceSettings,
  });
}
