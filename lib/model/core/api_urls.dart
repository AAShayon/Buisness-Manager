class ApiUrl{

  static  String branchId='';
  static const String customerOrSupplierID= '';
  static const String customerOrSupplierType= '';

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
  static String branchUpdate="/admin/branch/$branchId/update";
  static String branchDelete="/admin/branch/$branchId/delete";

  ///Customer supplier
  ///0 form Customer and 1 for supplier

  static  String customerList="{{BASE_URL}}/admin/$branchId/0/customers";
  static String supplierList="{{BASE_URL}}/admin/$branchId/1/customers";
  static  String customerOrSupplierCreate="/admin/$branchId/customer/create";
  static  String customerUpdate="/admin/$branchId/customer/$customerOrSupplierID/update";
  static  String customerOrSupplierDelete="/admin/$branchId/customer/$customerOrSupplierID/delete";

  ///Transaction
 static  String transactionList="/admin/$branchId/customer/$customerOrSupplierID/transactions";
 static  String transactionCreate="/admin/$branchId/customer/transaction/create";
 static  String transactionUpdate="/admin/$branchId/customer/transaction/$customerOrSupplierID/update";
///pronlem in transection delete
 // static const String transactionDelete="/admin/2/customer/transaction/1/delete";

 ///User Profile
static const String userProfile="/admin/profile";
static const String userProfileUpdate="/admin/profile/update";
static const String userAccountDelete="/admin/account-delete";




}