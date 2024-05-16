class ApiUrl{

  static String branchId='';

  static const String baseUrl="https://skill-test.retinasoft.com.bd/api/v1";

  ///Auth
  static const String registration="/sign-up/store";
  static const String signUpVerifyOtp="/sign-up/verify-otp-code";
  static const String login="/login";
  static const String sendLoginOtp="/send-login-otp";
  static const String logout="/logout";

  ///business
  static const String businessType="/get-business-types";


  ///branch
  static const String branchList="/admin/branches";
  static const String branchCreate="/admin/branch/create";
  static String branchUpdate="/admin/branch/${branchId}/update";
  static String branchDelete="/admin/branch/${branchId}/delete";

  ///Customer supplier

  static const String customerOrSupplierList="/admin/15/customer/4/transactions";
  static const String customerOrSupplierCreate="/admin/15/customer/create";
  static const String customerOrSupplierUpdate="/admin/15/customer/4/update";
  static const String customerOrSupplierDelete="/admin/2/customer/1/delete";

  ///Transaction
 static const String transactionList="/admin/15/customer/4/transactions";
 static const String transactionCreate="/admin/15/customer/transaction/create";
 static const String transactionUpdate="/admin/15/customer/transaction/3/update";
 static const String transactionDelete="/admin/2/customer/transaction/1/delete";

 ///User Profile
static const String userProfile="/admin/profile";
static const String userProfileUpdate="/admin/profile/update";
static const String userAccountDelete="/admin/account-delete";




}