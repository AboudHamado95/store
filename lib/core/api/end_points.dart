class EndPoints {
  static const String url = 'https://event-reg.app/flutter_test';
  static const String baseUrl = '$url/api';
  //****************************** */
  //? Auth
  static const String login = '$baseUrl/login';
  static const String register = '$baseUrl/register';
  //******************************** */

  //? Products
  static const String getAllProducts = '$baseUrl/products';
  static const String getProductById = '$baseUrl/products';
  static const String filterByRating = '$baseUrl/filter-products';

  //? Orders
  static const String getAllOrders = '$baseUrl/orders';
}  

//   //******************************** */
//   static const String requestRepair = '$baseUrl/complaint/requestRepair';
//   static const String determinePrice = '$baseUrl/complaint/determinePrice';
//   static const String complaintVisit = '$baseUrl/complaintVisit/store';

//   //******************************** */
//   static const String getUserComplaints = '$baseUrl/complaint/userComplaints';

//   //************************** */
//   static const String addresses = '$baseUrl/addresses';
//   static const String getTenantApartment = '$baseUrl/apartments/user';
//   static const String getNonTenantApartment = '$baseUrl/addresses/user';
//   static const String storeNewAddress = '$baseUrl/addresses';

//   //************************** */
//   static const String getUserDataByToken = '$baseUrl/info';
//   static const String logout = '$baseUrl/logout';
//   static const String deleteUser = '$baseUrl/users/delete';
//   //*************************** */
//   static const String getComplaintMessage = '$baseUrl/complaintMessage/show';
//   static const String showComplaint = '$baseUrl/complaint/show';
//   static const String storeComplaintMessage = '$baseUrl/complaintMessage';
//   static const String getChatsForUser =
//       '$baseUrl/complaintMessage/getChatsforUser';
//   static const String updateComplaint =
//       '$baseUrl/complaint/completeComplaintInfo';
//   static const String updateComplaintRate =
//       '$baseUrl/complaint/updateComplaint';
//   static const String updateFcmToken = '$baseUrl/updateFcmToken';
//   //
//   static const String contactInfo = '$baseUrl/getContactInfo';
// }
