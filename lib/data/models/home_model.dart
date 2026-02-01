import 'dart:convert';

HomeModel homeModelFromJson(String str) =>
    HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) =>
    json.encode(data.toJson());

class HomeModel {
  List<String>? homePageConfiguration;
  int? iconType;
  List<HomepageProduct>? homepageProducts;
  List<BannerModel>? banners;
  List<BannerModel>? featuredCategory;
  List<Category>? categories;
  Settings? settings;
  int? count;
  ThemeSettings? themeSettings;
  String? cacheId;
  String? sessionKey;

  HomeModel({
    this.homePageConfiguration,
    this.iconType,
    this.homepageProducts,
    this.banners,
    this.featuredCategory,
    this.categories,
    this.settings,
    this.count,
    this.themeSettings,
    this.cacheId,
    this.sessionKey,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        homePageConfiguration:
            (json['home_page_configuration'] as List?)
                ?.map((e) => e.toString())
                .toList(),

        iconType: json['icon_type'],

        homepageProducts: (json['homepage_products'] as List?)
            ?.map((e) => HomepageProduct.fromJson(
                Map<String, dynamic>.from(e)))
            .toList(),

        banners: (json['banners'] as List?)
            ?.map((e) =>
                BannerModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),

        featuredCategory: (json['featured_category'] as List?)
            ?.map((e) =>
                BannerModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),

        categories: (json['categories'] as List?)
            ?.map((e) =>
                Category.fromJson(Map<String, dynamic>.from(e)))
            .toList(),

        settings: json['settings'] != null
            ? Settings.fromJson(
                Map<String, dynamic>.from(json['settings']))
            : null,

        count: json['count'],

        themeSettings: json['theme_settings'] != null
            ? ThemeSettings.fromJson(
                Map<String, dynamic>.from(json['theme_settings']))
            : null,

        cacheId: json['cache_id'],
        sessionKey: json['session_key'],
      );

  Map<String, dynamic> toJson() => {
        'home_page_configuration': homePageConfiguration,
        'icon_type': iconType,
        'homepage_products':
            homepageProducts?.map((e) => e.toJson()).toList(),
        'banners': banners?.map((e) => e.toJson()).toList(),
        'featured_category':
            featuredCategory?.map((e) => e.toJson()).toList(),
        'categories': categories?.map((e) => e.toJson()).toList(),
        'settings': settings?.toJson(),
        'count': count,
        'theme_settings': themeSettings?.toJson(),
        'cache_id': cacheId,
        'session_key': sessionKey,
      };
}

/* ------------------ BANNER ------------------ */

class BannerModel {
  int? id;
  String? image;
  String? dominantColor;
  String? bannerType;
  String? name;

  BannerModel({
    this.id,
    this.image,
    this.dominantColor,
    this.bannerType,
    this.name,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json['id'],
        image: json['image'],
        dominantColor: json['dominantColor'],
        bannerType: json['banner_type'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'dominantColor': dominantColor,
        'banner_type': bannerType,
        'name': name,
      };
}

/* ------------------ CATEGORY ------------------ */

class Category {
  int? id;
  String? name;
  String? icon;
  String? dominantColor;
  int? children;

  Category({
    this.id,
    this.name,
    this.icon,
    this.dominantColor,
    this.children,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['ID'],
        name: json['name'],
        icon: json['icon'],
        dominantColor: json['dominantColor'],
        children: json['children'],
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'name': name,
        'icon': icon,
        'dominantColor': dominantColor,
        'children': children,
      };
}

/* ------------------ HOMEPAGE PRODUCT ------------------ */

class HomepageProduct {
  String? title;
  String? name;
  List<Product>? products;

  HomepageProduct({
    this.title,
    this.name,
    this.products,
  });

  factory HomepageProduct.fromJson(Map<String, dynamic> json) =>
      HomepageProduct(
        title: json['title'],
        name: json['name'],
        products: (json['products'] as List?)
            ?.map((e) =>
                Product.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'name': name,
        'products': products?.map((e) => e.toJson()).toList(),
      };
}

/* ------------------ PRODUCT ------------------ */

class Product {
  String? id;
  String? name;
  String? bannerImage;
  String? dominantColor;
  String? price;
  String? regularPrice;
  String? averageRating;
  String? shortDescription;
  String? isPrefix;

  Product({
    this.id,
    this.name,
    this.bannerImage,
    this.dominantColor,
    this.price,
    this.regularPrice,
    this.averageRating,
    this.shortDescription,
    this.isPrefix,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id']?.toString(),
        name: json['name'],
        bannerImage: json['banner_image'],
        dominantColor: json['dominantColor'],
        price: json['price'],
        regularPrice: json['regular_price'],
        averageRating: json['average_rating'],
        shortDescription: json['short_description'],
        isPrefix: json['is_prefix'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'banner_image': bannerImage,
        'dominantColor': dominantColor,
        'price': price,
        'regular_price': regularPrice,
        'average_rating': averageRating,
        'short_description': shortDescription,
        'is_prefix': isPrefix,
      };
}

/* ------------------ SETTINGS ------------------ */

class Settings {
  String? woocommerceEnableMyaccountRegistration;
  String? woocommerceRegistrationGenerateUsername;
  String? woocommerceRegistrationGeneratePassword;
  String? woocommerceEnableGuestCheckout;

  Settings({
    this.woocommerceEnableMyaccountRegistration,
    this.woocommerceRegistrationGenerateUsername,
    this.woocommerceRegistrationGeneratePassword,
    this.woocommerceEnableGuestCheckout,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        woocommerceEnableMyaccountRegistration:
            json['woocommerce_enable_myaccount_registration'],
        woocommerceRegistrationGenerateUsername:
            json['woocommerce_registration_generate_username'],
        woocommerceRegistrationGeneratePassword:
            json['woocommerce_registration_generate_password'],
        woocommerceEnableGuestCheckout:
            json['woocommerce_enable_guest_checkout'],
      );

  Map<String, dynamic> toJson() => {
        'woocommerce_enable_myaccount_registration':
            woocommerceEnableMyaccountRegistration,
        'woocommerce_registration_generate_username':
            woocommerceRegistrationGenerateUsername,
        'woocommerce_registration_generate_password':
            woocommerceRegistrationGeneratePassword,
        'woocommerce_enable_guest_checkout':
            woocommerceEnableGuestCheckout,
      };
}

/* ------------------ THEME SETTINGS ------------------ */

class ThemeSettings {
  AppTheme? lightTheme;
  AppTheme? darkTheme;
  int? iconType;
  String? appIcon;
  String? splashIcon;

  ThemeSettings({
    this.lightTheme,
    this.darkTheme,
    this.iconType,
    this.appIcon,
    this.splashIcon,
  });

  factory ThemeSettings.fromJson(Map<String, dynamic> json) =>
      ThemeSettings(
        lightTheme: json['light_theme'] != null
            ? AppTheme.fromJson(
                Map<String, dynamic>.from(json['light_theme']))
            : null,
        darkTheme: json['dark_theme'] != null
            ? AppTheme.fromJson(
                Map<String, dynamic>.from(json['dark_theme']))
            : null,
        iconType: json['icon_type'],
        appIcon: json['app_icon'],
        splashIcon: json['splash_icon'],
      );

  Map<String, dynamic> toJson() => {
        'light_theme': lightTheme?.toJson(),
        'dark_theme': darkTheme?.toJson(),
        'icon_type': iconType,
        'app_icon': appIcon,
        'splash_icon': splashIcon,
      };
}

/* ------------------ APP THEME ------------------ */

class AppTheme {
  String? appButtonColor;
  String? appThemeColor;
  String? appThemeTextColor;
  String? buttonTextColor;
  String? appLogo;
  String? splashImage;

  AppTheme({
    this.appButtonColor,
    this.appThemeColor,
    this.appThemeTextColor,
    this.buttonTextColor,
    this.appLogo,
    this.splashImage,
  });

  factory AppTheme.fromJson(Map<String, dynamic> json) => AppTheme(
        appButtonColor: json['app_button_color'],
        appThemeColor: json['app_theme_color'],
        appThemeTextColor: json['app_theme_text_color'],
        buttonTextColor: json['button_text_color'],
        appLogo: json['app_logo'],
        splashImage: json['splash_image'],
      );

  Map<String, dynamic> toJson() => {
        'app_button_color': appButtonColor,
        'app_theme_color': appThemeColor,
        'app_theme_text_color': appThemeTextColor,
        'button_text_color': buttonTextColor,
        'app_logo': appLogo,
        'splash_image': splashImage,
      };
}
