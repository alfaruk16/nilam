import 'config.dart';

String version1 = "${baseUrl}api/v1/";
String version2 = "${baseUrl}api/v2/";

String hubUrl = "${baseUrl}notificationhub";

String getToken = "${version1}token";

String siteSettings = "${version1}sitesetting/get";
String getItemGroups = "${version1}item-group/getall";
String register = "${version1}register-user";
String sendOtp = "${version1}send-otp";
String sendOtpForChange = "${version1}send-otp-for-change";
String validateOtp = "${version1}validate-otp";
String changedPassword = "${version1}changed-password";

String getAllBlockApis = "${version2}applicationapi/getall";

String getRelatedProducts(int id) => "${version1}item/get-related-products/$id";

String getAllParentCategories =
    "${version1}item-category/get-all-parent-categories";

String getAllCategories = "${version1}item-category/getall";

String toggleFavorite = "${version1}item/favorite/:id";
String getFavoriteProducts = "${version1}item/my-favorite-products";
String getProductDetails(int id, String slug) =>
    "${version1}item/get-details/$id/$slug";
String getProducts = "${version1}item/search-public";
String getProductDetailsForEdit = "${version1}item/details/:id";
String saveProduct = "${version1}item/save";
String productDelete = "${version1}item/delete/:id";
String itemReviewSubmit = "${version1}item-review/add";
String getIemReview = "${version1}item-review/get/:id";
String getIemReviewSummary = "${version1}item-review/get-review-summary/:id";
String getIemSearchView = "${version1}item-review/search-review";
String updateItemSalesPrice = "${version1}item/update-sales-price";
String updateItemQuantity = "${version1}item/update-stock-quantity";
String updateItemDiscount = "${version1}item/update-discount";
String getItemDiscountByItemId = "${version1}item/get-item-discount/:id";

String placeBid = "${version1}bidding/place-bid";
String getAllBid(String id) => "${version1}bidding/getall/$id";
String addAutomaticBid = "${version1}bidding/add-automatic-bid";
String deleteAutomaticBid =
    "${version1}bidding/delete-automatic-bid/:auctionId";

String addAddress = "${version1}address/add";
String getShippingAddress = "${version1}address/getall";
String getByIdAddress = "${version1}address/get/:id";
String updateAddress = "${version1}address/update";
String markAsDefaultAddress(String id) =>
    "${version1}address/mark-as-default/$id";
String deleteAddress = "${version1}address/delete/:id";

String addContact = "${version1}contact-us/add";

String addInquiry = "${version1}contact-us/add-inquiry";

String allFaqCategories = "${version1}faq-category/getall";
String allFaqs = "${version1}faqs/getall";

String getPageInfoById = "${version1}pages/get/:id";

String currentUserUrl = "${version1}getcurrentuser";

String getUserProfile = "${version1}user/profile";
String getUserBalance = "${version1}user/balance";
String updateUserProfile = "${version1}user/update-profile";
String addMedia = "${version1}media/add";
String getMyProducts = "${version1}item/search-my-items";
String getMyProductSummary = "${version1}item/my-items-summary";
String getMyParticipatedAuction =
    "${version1}item/search-my-participated-auction";
String getMyBargainItem = "${version1}bargain/search-my-bargain-items";
String sendBargainPrice = "${version1}bargain/send-proposal";
String getBargainInfoByItemId(String id) =>
    "${version1}bargain/bargain-info/$id";
String getBargainDetailsById = "${version1}bargain/bargain-details/:id";
String cancelBargain(String id) => "${version1}bargain/cancel-bargain/$id";
String acceptBargainAmount = "${version1}bargain/accept-proposal/:id";
String getBargainItemForOrder = "${version1}bargain/get-bargain-item-for-order";

String reAuction = "${version1}item/re-auction/:id";
String sendOrderRequest = "${version1}item/send-order-request/:id";

String getMyOrders = "${version1}order/search-my-orders";
String getMyOrderDetails(String id) => "${version1}order/details/$id";

String orderUpdateStatus = "${version1}order/update-order-status";

String getDivisions = "${version1}division/getall";
String getDistricts = "${version1}district/getall";
String getDistrictsByDivision(String id) =>
    "${version1}district/getall-by-division/$id";

String getMediaImages = "${version1}media/getall/:type/:refId";
String deleteMediaImage = "${version1}media/delete/:id";
String markAsCover = "${version1}media/cover/:id";

String getAuctionPolicy = "${version1}auction-policy/get";
String getMeasurements = "${version1}measurement/getall";

String getPaymentGatewayURL = "${version1}payment/gateway";
String getMyPaymentInfo = "${version1}payment/get/:id";

String placeOrder = "${version1}order/place-order";
String getShippingCost = "${version1}order/get-shipping-cost";

String addToCart = "${version1}cart/add";
String getAllCarts = "${version1}cart/getAll";
String removeFromCart = "${version1}cart/remove";
String addPromoCodeToCart = "${version1}cart/add-promo-code";
String removePromoCode = "${version1}cart/remove-promo-code";
String getAllNotification = "${version1}notification/getall";
String notificaionMarkAllAsRead = "${version1}notification/mark-all-read";

String getCategoryWiseAttribute =
    "${version1}item-category/get-category-attribute/:categoryId/:itemId";

String getMetaTags = "${version1}item/search-meta-keywords/:categoryId";

String categoryGetallById = "${version1}item-category/getall-by-id/:ParentId";

String getMostSellingProducts = "${version1}item/get-mostselling-products";

String updateCartItems = "${version1}cart/update-cart-items";
String getAllBrands = "${version1}brand/getall";
String getMyBrands = "${version1}brand/get-my-brands/:ownerId";
String getBrandInfos = "${version1}brand/get/:brandId";
String getCompanyInfos = "${version1}user/get-user-company-info/:ownerId";
String getPickupPoint = "${version1}address/getall-pickup-point";

String getAllPaymentGateway = '${version2}payment-gateway/getall';
