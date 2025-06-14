import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/core/utils/utilities.dart';
import 'package:nilam/features/data/data_sources/config.dart';
import 'package:nilam/features/data/data_sources/local_keys.dart';
import 'package:nilam/features/data/data_sources/remote_constants.dart';
import 'package:nilam/features/domain/entities/all_blocks_response.dart';
import 'package:nilam/features/domain/entities/banner_response.dart';
import 'package:nilam/features/domain/entities/brand_response.dart';
import 'package:nilam/features/domain/entities/cart_response.dart';
import 'package:nilam/features/domain/entities/category_response.dart';
import 'package:nilam/features/domain/entities/high_light_response.dart';
import 'package:nilam/features/domain/entities/hot_button_response.dart';
import 'package:nilam/features/domain/entities/item_group_response.dart';
import 'package:nilam/features/domain/entities/product_response.dart';
import 'package:nilam/features/domain/entities/site_setting.dart';
import 'package:nilam/features/domain/entities/token_response.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/domain/usecases/local_data.dart';
import 'package:nilam/features/presentation/cart/view/cart_screen.dart';
import 'package:nilam/features/presentation/product_details/view/product_details_screen.dart';
import 'package:nilam/features/presentation/products/view/products_screen.dart';

import '../../../domain/entities/profile.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._apiRepo, this._localStorageRepo, this._iFlutterNavigator)
      : super(HomeInitial()) {
    on<GetToken>(_getToken);
    on<GetData>(_getData);
    on<GetSiteSetting>(_getSiteSetting);
    on<GetItemGroup>(_getItemGroup);
    on<GetAllBlocks>(_getAllBlocks);
    on<GetBanner>(_getBanner);
    on<GetSingleBanner>(_getSingleBanner);
    on<GetHotButton>(_getHotButton);
    on<GetHighlight>(_getHighlight);
    on<GetBrand>(_getBrand);
    on<GetCategory>(_getCategory);
    on<GetProduct>(_getProduct);
    on<CheckLocal>(_checkLocal);
    on<GoToSearch>(_goToSearch);
    on<GoToDetails>(_goToDetails);
    on<GetCart>(_getCart);
    on<GotoCart>(_goToCart);
    on<GetUser>(_getUser);

    add(GetToken());
    add(CheckLocal());
    add(GetCart());
    add(GetUser());
  }

  final ApiRepo _apiRepo;
  final LocalStorageRepo _localStorageRepo;
  final IFlutterNavigator _iFlutterNavigator;

  Future<FutureOr<void>> _getToken(
      GetToken event, Emitter<HomeState> emit) async {
    if (_localStorageRepo.read(key: tokenDB) == null) {
      final client = await _apiRepo.postUrlEncode<TokenResponse>(
          endpoint: getToken,
          body:
              "grant_type=$clientCredentials&client_id=$masterClient&client_secret=$clientSecret&offset=${DateTime.now().timeZoneOffset.inMinutes}");
      if (client != null) {
        await _localStorageRepo.write(key: tokenDB, value: client.accessToken!);
        await _localStorageRepo.writeModel(key: clientDB, value: client);
      }
    }
    add(GetUser());
    add(GetData());
  }

  Future<FutureOr<void>> _getData(
      GetData event, Emitter<HomeState> emit) async {
    //add(GetSiteSetting());
    add(GetAllBlocks());
    //add(GetItemGroup());

    // final auctions = await _apiRepo.post(endpoint: getMyParticipatedAuction);
    // print(auctions);
  }

  Future<FutureOr<void>> _getSiteSetting(
      GetSiteSetting event, Emitter<HomeState> emit) async {
    final site =
        await _apiRepo.post<SiteSettingResponse>(endpoint: siteSettings);

    emit(state.copyWith(siteSetting: site));
    _localStorageRepo.writeModel(key: siteSettingDB, value: site);
  }

  Future<FutureOr<void>> _getItemGroup(
      GetItemGroup event, Emitter<HomeState> emit) async {
    final itemGroup =
        await _apiRepo.postForList<List<ItemGroupResponse>, ItemGroupResponse>(
            endpoint: getItemGroups);

    if (itemGroup != null) {
      emit(state.copyWith(itemGroupList: itemGroup));
    }
  }

  Future<FutureOr<void>> _getAllBlocks(
      GetAllBlocks event, Emitter<HomeState> emit) async {
    final allBlocks =
        await _apiRepo.postForList<List<BlockResponse>, BlockResponse>(
            endpoint: getAllBlockApis);
    if (allBlocks != null) {
      if (allBlocks.length != state.blockDetailsList.length) {
        List<BlockItem> blocks = [];
        for (int i = 0; i < allBlocks.length; i++) {
          blocks.add(BlockItem(block: allBlocks[i], blockDetails: null));
        }
        emit(state.copyWith(allBlockList: allBlocks, blockDetailsList: blocks));
      }
      bool hasCategory = false;
      for (int i = 0; i < allBlocks.length; i++) {
        final sectionType = allBlocks[i].sectionType;
        if (sectionType == SectionType.Banners.name) {
          add(GetBanner(blockResponse: allBlocks[i], index: i));
        } else if (sectionType == SectionType.HotButtons.name) {
          add(GetHotButton(allBlockResponse: allBlocks[i], index: i));
        } else if (sectionType == SectionType.Highlights.name) {
          add(GetHighlight(allBlockResponse: allBlocks[i], index: i));
        } else if (sectionType == SectionType.Brands.name) {
          add(GetBrand(allBlockResponse: allBlocks[i], index: i));
        } else if (sectionType == SectionType.Categories.name) {
          add(GetCategory(allBlockResponse: allBlocks[i], index: i));
          hasCategory = true;
        } else if (sectionType == SectionType.Products.name) {
          add(GetProduct(allBlockResponse: allBlocks[i], index: i));
        }
      }
      if(!hasCategory){
        await _localStorageRepo.remove(key: categoryLocalKeyDB);
      }
      await _localStorageRepo.writeModel(key: blockDB, value: allBlocks);
    }
  }

  Future<FutureOr<void>> _getBanner(
      GetBanner event, Emitter<HomeState> emit) async {
    if (isEndsWithNumeric(event.blockResponse.apiLink!)) {
      add(GetSingleBanner(
          blockResponse: event.blockResponse, index: event.index));
    } else {
      final banner =
          await _apiRepo.postForList<List<BannerResponse>, BannerResponse>(
              endpoint: baseUrl + event.blockResponse.apiLink!);

      if (banner != null) {
        emit(state.copyWith(
            blockDetailsList: List.from(state.blockDetailsList)
              ..removeAt(event.index)
              ..insert(
                  event.index,
                  BlockItem(
                      block: event.blockResponse, blockDetails: banner))));
        await _localStorageRepo.writeModel(
            key: bannerDB(event.index), value: banner);
      }
    }
  }

  Future<FutureOr<void>> _getSingleBanner(
      GetSingleBanner event, Emitter<HomeState> emit) async {
    final banner = await _apiRepo.post<BannerResponse>(
        endpoint: baseUrl + event.blockResponse.apiLink!);

    if (banner != null) {
      emit(state.copyWith(
          blockDetailsList: List.from(state.blockDetailsList)
            ..removeAt(event.index)
            ..insert(event.index,
                BlockItem(block: event.blockResponse, blockDetails: banner))));
      await _localStorageRepo.writeModel(
          key: bannerDB(event.index), value: banner);
    }
  }

  Future<FutureOr<void>> _getHotButton(
      GetHotButton event, Emitter<HomeState> emit) async {
    final hotButton =
        await _apiRepo.postForList<List<HotButtonResponse>, HotButtonResponse>(
            endpoint: baseUrl + event.allBlockResponse.apiLink!);

    if (hotButton != null) {
      emit(state.copyWith(
          blockDetailsList: List.from(state.blockDetailsList)
            ..removeAt(event.index)
            ..insert(
                event.index,
                BlockItem(
                    block: event.allBlockResponse, blockDetails: hotButton))));
      await _localStorageRepo.writeModel(
          key: hotButtonDB(event.index), value: hotButton);
    }
  }

  Future<FutureOr<void>> _getHighlight(
      GetHighlight event, Emitter<HomeState> emit) async {
    final highlight =
        await _apiRepo.postForList<List<HighlightResponse>, HighlightResponse>(
            endpoint: baseUrl + event.allBlockResponse.apiLink!);

    if (highlight != null) {
      emit(state.copyWith(
          blockDetailsList: List.from(state.blockDetailsList)
            ..removeAt(event.index)
            ..insert(
                event.index,
                BlockItem(
                    block: event.allBlockResponse, blockDetails: highlight))));
      await _localStorageRepo.writeModel(
          key: highlightsDB(event.index), value: highlight);
    }
  }

  Future<FutureOr<void>> _getBrand(
      GetBrand event, Emitter<HomeState> emit) async {
    final brand =
        await _apiRepo.postForList<List<BrandResponse>, BrandResponse>(
            endpoint: baseUrl + event.allBlockResponse.apiLink!);

    if (brand != null) {
      emit(state.copyWith(
          blockDetailsList: List.from(state.blockDetailsList)
            ..removeAt(event.index)
            ..insert(
                event.index,
                BlockItem(
                    block: event.allBlockResponse, blockDetails: brand))));
      await _localStorageRepo.writeModel(
          key: brandsDB(event.index), value: brand);
    }
  }

  Future<FutureOr<void>> _getCategory(
      GetCategory event, Emitter<HomeState> emit) async {
    final category =
        await _apiRepo.postForList<List<CategoryResponse>, CategoryResponse>(
            endpoint: baseUrl + event.allBlockResponse.apiLink!);

    if (category != null) {
      emit(state.copyWith(
          blockDetailsList: List.from(state.blockDetailsList)
            ..removeAt(event.index)
            ..insert(
                event.index,
                BlockItem(
                    block: event.allBlockResponse, blockDetails: category))));
      await _localStorageRepo.write(
          key: categoryLocalKeyDB, value: categoriesDB(event.index));
      await _localStorageRepo.writeModel(
          key: categoriesDB(event.index), value: category);
    }
  }

  Future<FutureOr<void>> _getProduct(
      GetProduct event, Emitter<HomeState> emit) async {
    final product = await _apiRepo.postForList<List<Product>, Product>(
        endpoint: baseUrl + event.allBlockResponse.apiLink!);

    if (product != null) {
      emit(state.copyWith(
          blockDetailsList: List.from(state.blockDetailsList)
            ..removeAt(event.index)
            ..insert(
                event.index,
                BlockItem(
                    block: event.allBlockResponse, blockDetails: product))));

      await _localStorageRepo.writeModel(
          key: productsDB(event.index), value: product);
    }
  }

  Future<FutureOr<void>> _checkLocal(
      CheckLocal event, Emitter<HomeState> emit) async {
    final allBlocks = await _localStorageRepo
        .readModelForList<List<BlockResponse>, BlockResponse>(key: blockDB);

    if (allBlocks != null) {
      List<BlockItem> blocks = [];
      for (int i = 0; i < allBlocks.length; i++) {
        blocks.add(BlockItem(block: allBlocks[i], blockDetails: null));
      }
      emit(state.copyWith(allBlockList: allBlocks, blockDetailsList: blocks));
      for (int i = 0; i < allBlocks.length; i++) {
        final sectionType = allBlocks[i].sectionType;
        if (sectionType == SectionType.Banners.name) {
          final banner = isEndsWithNumeric(allBlocks[i].apiLink!)
              ? await _localStorageRepo.readModel<BannerResponse>(
                  key: bannerDB(i))
              : await _localStorageRepo
                  .readModelForList<List<BannerResponse>, BannerResponse>(
                      key: bannerDB(i));
          emit(state.copyWith(
              blockDetailsList: List.from(state.blockDetailsList)
                ..removeAt(i)
                ..insert(
                    i, BlockItem(block: allBlocks[i], blockDetails: banner))));
        } else if (sectionType == SectionType.HotButtons.name) {
          final hotButton = await _localStorageRepo
              .readModelForList<List<HotButtonResponse>, HotButtonResponse>(
                  key: hotButtonDB(i));
          emit(state.copyWith(
              blockDetailsList: List.from(state.blockDetailsList)
                ..removeAt(i)
                ..insert(i,
                    BlockItem(block: allBlocks[i], blockDetails: hotButton))));
        } else if (sectionType == SectionType.Highlights.name) {
          final highlights = await _localStorageRepo
              .readModelForList<List<HighlightResponse>, HighlightResponse>(
                  key: highlightsDB(i));
          emit(state.copyWith(
              blockDetailsList: List.from(state.blockDetailsList)
                ..removeAt(i)
                ..insert(i,
                    BlockItem(block: allBlocks[i], blockDetails: highlights))));
        } else if (sectionType == SectionType.Brands.name) {
          final brands = await _localStorageRepo
              .readModelForList<List<BrandResponse>, BrandResponse>(
                  key: brandsDB(i));
          emit(state.copyWith(
              blockDetailsList: List.from(state.blockDetailsList)
                ..removeAt(i)
                ..insert(
                    i, BlockItem(block: allBlocks[i], blockDetails: brands))));
        } else if (sectionType == SectionType.Categories.name) {
          final categories = await _localStorageRepo
              .readModelForList<List<CategoryResponse>, CategoryResponse>(
                  key: categoriesDB(i));
          emit(state.copyWith(
              blockDetailsList: List.from(state.blockDetailsList)
                ..removeAt(i)
                ..insert(i,
                    BlockItem(block: allBlocks[i], blockDetails: categories))));
        } else if (sectionType == SectionType.Products.name) {
          final products = await _localStorageRepo
              .readModelForList<List<Product>, Product>(key: productsDB(i));
          emit(state.copyWith(
              blockDetailsList: List.from(state.blockDetailsList)
                ..removeAt(i)
                ..insert(i,
                    BlockItem(block: allBlocks[i], blockDetails: products))));
        }
      }
    }
  }

  FutureOr<void> _goToSearch(GoToSearch event, Emitter<HomeState> emit) {
    _iFlutterNavigator
        .push(ProductsScreen.route(link: event.link))
        .then((value) => add(GetCart()));
  }

  FutureOr<void> _goToDetails(GoToDetails event, Emitter<HomeState> emit) {
    _iFlutterNavigator
        .push(ProductDetailsScreen.route(product: event.product))
        .then((value) => GetCart());
  }

  Future<FutureOr<void>> _getCart(
      GetCart event, Emitter<HomeState> emit) async {
    if (await LocalData.isLoggedIn()) {
      final cart = await _apiRepo.post<CartResponse>(endpoint: getAllCarts);
      if (cart != null) {
        emit(state.copyWith(cartResponse: cart));
        await _localStorageRepo.writeModel(key: cartDB, value: cart);
      }
    }
  }

  Future<FutureOr<void>> _goToCart(
      GotoCart event, Emitter<HomeState> emit) async {
    if (await LocalData.isVerifiedUser(_iFlutterNavigator, callback: () {
      add(GetUser());
      add(GetCart());
    })) {
      _iFlutterNavigator
          .push(CartScreen.route(isEmi: false))
          .then((value) => add(GetCart()));
    }
  }

  Future<FutureOr<void>> _getUser(
      GetUser event, Emitter<HomeState> emit) async {
    if (await LocalData.isLoggedIn()) {
      final profile = await _apiRepo.post<Profile>(endpoint: getUserProfile);
      if (profile != null) {
        _localStorageRepo.writeModel(key: profileDB, value: profile);
      }
    }
  }
}
