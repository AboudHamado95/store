
/// use this class to save all the shared prefernces keys
class SharedPreferncesKeys {
  static final SharedPreferncesKeys _instanceKey = SharedPreferncesKeys._internalKey();

  factory SharedPreferncesKeys() => _instanceKey;

  SharedPreferncesKeys._internalKey();

  static const kTokenKey = 'kTokenKey';

  static const kSelectedCountryKey = 'kSelectedCountryKey';

  static const kSelectedLanguageKey = 'kSelectedLanguageKey';

  static const kUserIsNew = 'kUserIsNew';

  static const kSelectedSectionId = 'kSelectedSectionId';

  static const kWishListProducts = 'kWishListProducts';

  static const kWishList = 'kWishList';
  static const kUserKey = 'kUserKey';
  static const kGuestKey = 'kGuestKey';
  static const kDialCodeKey = 'kDialCodeKey';
  static const kShouldShowUpdateDialogKey = 'kShouldShowUpdateDialogKey';
  static const kLastTimeViewUpdateDialog  = 'kLastTimeViewUpdateDialog';
  static const kSectionName  = 'SectionName';
  static const kNumberOfResendCode='kNumberOfResendCode';
  static const kTimeOfResendCode='kTimeOfResendCode';
  static const attemptNumberOfResendCodeRequest="attemptNumberOfResendCodeRequest";
  static const isResendCodeTimerWorking="isResendCodeTimerWorking";
static const endTimeOfTheRunningTimer="endTimeOfTheRunningTimer";
static const requestResendCodeDateTime="requestResendCodeDateTime";
static const appSectionsSaver="appSectionsSaver";
 
}
