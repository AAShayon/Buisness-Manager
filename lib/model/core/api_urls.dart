class ApiUrl{

    static String branchId='';
    static String customerOrSupplierID= '';
    static String customerOrSupplierType= '';
    static String transactionID= '';

    static String baseUrl="https://skill-test.retinasoft.com.bd/api/v1";

  ///Auth
    String registration="/sign-up/store";
    String signUpVerifyOtp="/sign-up/verify-otp-code";
    String login="/login";
    String sendLoginOtp="/send-login-otp";
    String logout="/logout";

  ///business
    String businessType="/get-business-types";


  ///branch
    String branchList="/admin/branches";
    String branchCreate="/admin/branch/create";
   String branchUpdate="/admin/branch/$branchId/update";
   String branchDelete="/admin/branch/$branchId/delete";

  ///Customer supplier
  ///0 form Customer and 1 for supplier

    String customerOrSupplierList="/admin/$branchId/$customerOrSupplierType/customers";
  //  String supplierList="{{BASE_URL}}/admin/$branchId/1/customers";
    String customerOrSupplierCreate="/admin/$branchId/customer/create";
    String customerorSupplierUpdate="/admin/$branchId/customer/$customerOrSupplierID/update";
    String customerOrSupplierDelete="/admin/$branchId/customer/$customerOrSupplierID/delete";

  ///Transaction
   String transactionList="/admin/$branchId/customer/$customerOrSupplierID/transactions";
   String transactionCreate="/admin/$branchId/customer/transaction/create";
   String transactionUpdate="/admin/$branchId/customer/transaction/$transactionID/update";


   String transactionDelete="/admin/$branchId/customer/transaction/$transactionID/delete";

 ///User Profile
  String userProfile="/admin/profile";
  String userProfileUpdate="/admin/profile/update";
  String userAccountDelete="/admin/account-delete";




}