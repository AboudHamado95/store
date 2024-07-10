class StoreConstants {
  static final StoreConstants _instanceKey = StoreConstants._internalKey();

  factory StoreConstants() => _instanceKey;

  StoreConstants._internalKey();

  static const kAppLanguage = 'en';
  static const kApplicationName = 'Store app';
  static const int appDefaultTheme = 1;
}
