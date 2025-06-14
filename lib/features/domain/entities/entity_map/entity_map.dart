import 'package:nilam/features/domain/entities/add_to_cart_response.dart';
import 'package:nilam/features/domain/entities/address_response.dart';
import 'package:nilam/features/domain/entities/all_blocks_response.dart';
import 'package:nilam/features/domain/entities/banner_response.dart';
import 'package:nilam/features/domain/entities/bargain_response.dart';
import 'package:nilam/features/domain/entities/bargain_info.dart';
import 'package:nilam/features/domain/entities/bid_info_response.dart';
import 'package:nilam/features/domain/entities/brand_response.dart';
import 'package:nilam/features/domain/entities/cancel_bargain_response.dart';
import 'package:nilam/features/domain/entities/cart_response.dart';
import 'package:nilam/features/domain/entities/category_response.dart';
import 'package:nilam/features/domain/entities/default_response.dart';
import 'package:nilam/features/domain/entities/district_response.dart';
import 'package:nilam/features/domain/entities/division_response.dart';
import 'package:nilam/features/domain/entities/my_bargains_response.dart';
import 'package:nilam/features/domain/entities/nilam_response.dart';
import 'package:nilam/features/domain/entities/order_details_response.dart';
import 'package:nilam/features/domain/entities/order_response.dart';
import 'package:nilam/features/domain/entities/place_order_response.dart';
import 'package:nilam/features/domain/entities/high_light_response.dart';
import 'package:nilam/features/domain/entities/hot_button_response.dart';
import 'package:nilam/features/domain/entities/item_group_response.dart';
import 'package:nilam/features/domain/entities/otp_response.dart';
import 'package:nilam/features/domain/entities/product_details_response.dart';
import 'package:nilam/features/domain/entities/product_response.dart';
import 'package:nilam/features/domain/entities/profile.dart';
import 'package:nilam/features/domain/entities/register_response.dart';
import 'package:nilam/features/domain/entities/search_response.dart';
import 'package:nilam/features/domain/entities/site_setting.dart';
import 'package:nilam/features/domain/entities/token_response.dart';
import 'package:nilam/features/domain/entities/user_address.dart';

class EntityMap {
  static T? fromJson<T, K>(dynamic json) {
    switch (T) {
      case DefaultResponse:
        return DefaultResponse.fromJson(json) as T;
      case TokenResponse:
        return TokenResponse.fromJson(json) as T;
      case SiteSettingResponse:
        return SiteSettingResponse.fromJson(json) as T;
      case ItemGroupResponse:
        return ItemGroupResponse.fromJson(json) as T;
      case BlockResponse:
        return BlockResponse.fromJson(json) as T;
      case BannerResponse:
        return BannerResponse.fromJson(json) as T;
      case BrandResponse:
        return BrandResponse.fromJson(json) as T;
      case CategoryResponse:
        return CategoryResponse.fromJson(json) as T;
      case HighlightResponse:
        return HighlightResponse.fromJson(json) as T;
      case HotButtonResponse:
        return HotButtonResponse.fromJson(json) as T;
      case Product:
        return Product.fromJson(json) as T;
      case SearchResponse:
        return SearchResponse.fromJson(json) as T;
      case ProductDetails:
        return ProductDetails.fromJson(json) as T;
      case UserProfileResponse:
        return UserProfileResponse.fromJson(json) as T;
      case Profile:
        return Profile.fromJson(json) as T;
      case OtpResponse:
        return OtpResponse.fromJson(json) as T;
      case AddToCarResponse:
        return AddToCarResponse.fromJson(json) as T;
      case CartResponse:
        return CartResponse.fromJson(json) as T;
      case DivisionResponse:
        return DivisionResponse.fromJson(json) as T;
      case DistrictResponse:
        return DistrictResponse.fromJson(json) as T;
      case AddressResponse:
        return AddressResponse.fromJson(json) as T;
      case UserAddress:
        return UserAddress.fromJson(json) as T;
      case num:
        return json as T;
      case PlaceOrderResponse:
        return PlaceOrderResponse.fromJson(json) as T;
      case BargainInfoResponse:
        return BargainInfoResponse.fromJson(json) as T;
      case BargainResponse:
        return BargainResponse.fromJson(json) as T;
      case CancelBargainResponse:
        return CancelBargainResponse.fromJson(json) as T;
      case NilamResponse:
        return NilamResponse.fromJson(json) as T;
      case String:
        return json as T;
      case OrderResponse:
        return OrderResponse.fromJson(json) as T;
      case OrderDetailsResponse:
        return OrderDetailsResponse.fromJson(json) as T;
      case MyBargainResponse:
        return MyBargainResponse.fromJson(json) as T;
      case BidInfoResponse:
        return BidInfoResponse.fromJson(json) as T;

      default:
        throw Exception('Unknown class');
    }
  }
}
