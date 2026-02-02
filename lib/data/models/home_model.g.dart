// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeModelAdapter extends TypeAdapter<HomeModel> {
  @override
  final int typeId = 0;

  @override
  HomeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeModel(
      homePageConfiguration: (fields[0] as List?)?.cast<String>(),
      iconType: fields[1] as int?,
      homepageProducts: (fields[2] as List?)?.cast<HomepageProduct>(),
      banners: (fields[3] as List?)?.cast<BannerModel>(),
      featuredCategory: (fields[4] as List?)?.cast<BannerModel>(),
      categories: (fields[5] as List?)?.cast<Category>(),
      settings: fields[6] as Settings?,
      count: fields[7] as int?,
      themeSettings: fields[8] as ThemeSettings?,
      cacheId: fields[9] as String?,
      sessionKey: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.homePageConfiguration)
      ..writeByte(1)
      ..write(obj.iconType)
      ..writeByte(2)
      ..write(obj.homepageProducts)
      ..writeByte(3)
      ..write(obj.banners)
      ..writeByte(4)
      ..write(obj.featuredCategory)
      ..writeByte(5)
      ..write(obj.categories)
      ..writeByte(6)
      ..write(obj.settings)
      ..writeByte(7)
      ..write(obj.count)
      ..writeByte(8)
      ..write(obj.themeSettings)
      ..writeByte(9)
      ..write(obj.cacheId)
      ..writeByte(10)
      ..write(obj.sessionKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BannerModelAdapter extends TypeAdapter<BannerModel> {
  @override
  final int typeId = 1;

  @override
  BannerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BannerModel(
      id: fields[0] as int?,
      image: fields[1] as String?,
      dominantColor: fields[2] as String?,
      bannerType: fields[3] as String?,
      name: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BannerModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.dominantColor)
      ..writeByte(3)
      ..write(obj.bannerType)
      ..writeByte(4)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BannerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 2;

  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      id: fields[0] as int?,
      name: fields[1] as String?,
      icon: fields[2] as String?,
      dominantColor: fields[3] as String?,
      children: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.dominantColor)
      ..writeByte(4)
      ..write(obj.children);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HomepageProductAdapter extends TypeAdapter<HomepageProduct> {
  @override
  final int typeId = 3;

  @override
  HomepageProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomepageProduct(
      title: fields[0] as String?,
      name: fields[1] as String?,
      products: (fields[2] as List?)?.cast<Product>(),
    );
  }

  @override
  void write(BinaryWriter writer, HomepageProduct obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomepageProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 4;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as String?,
      name: fields[1] as String?,
      bannerImage: fields[2] as String?,
      dominantColor: fields[3] as String?,
      price: fields[4] as String?,
      regularPrice: fields[5] as String?,
      averageRating: fields[6] as String?,
      shortDescription: fields[7] as String?,
      isPrefix: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.bannerImage)
      ..writeByte(3)
      ..write(obj.dominantColor)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.regularPrice)
      ..writeByte(6)
      ..write(obj.averageRating)
      ..writeByte(7)
      ..write(obj.shortDescription)
      ..writeByte(8)
      ..write(obj.isPrefix);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final int typeId = 5;

  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Settings(
      woocommerceEnableMyaccountRegistration: fields[0] as String?,
      woocommerceRegistrationGenerateUsername: fields[1] as String?,
      woocommerceRegistrationGeneratePassword: fields[2] as String?,
      woocommerceEnableGuestCheckout: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.woocommerceEnableMyaccountRegistration)
      ..writeByte(1)
      ..write(obj.woocommerceRegistrationGenerateUsername)
      ..writeByte(2)
      ..write(obj.woocommerceRegistrationGeneratePassword)
      ..writeByte(3)
      ..write(obj.woocommerceEnableGuestCheckout);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ThemeSettingsAdapter extends TypeAdapter<ThemeSettings> {
  @override
  final int typeId = 6;

  @override
  ThemeSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThemeSettings(
      lightTheme: fields[0] as AppTheme?,
      darkTheme: fields[1] as AppTheme?,
      iconType: fields[2] as int?,
      appIcon: fields[3] as String?,
      splashIcon: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ThemeSettings obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.lightTheme)
      ..writeByte(1)
      ..write(obj.darkTheme)
      ..writeByte(2)
      ..write(obj.iconType)
      ..writeByte(3)
      ..write(obj.appIcon)
      ..writeByte(4)
      ..write(obj.splashIcon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AppThemeAdapter extends TypeAdapter<AppTheme> {
  @override
  final int typeId = 7;

  @override
  AppTheme read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppTheme(
      appButtonColor: fields[0] as String?,
      appThemeColor: fields[1] as String?,
      appThemeTextColor: fields[2] as String?,
      buttonTextColor: fields[3] as String?,
      appLogo: fields[4] as String?,
      splashImage: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AppTheme obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.appButtonColor)
      ..writeByte(1)
      ..write(obj.appThemeColor)
      ..writeByte(2)
      ..write(obj.appThemeTextColor)
      ..writeByte(3)
      ..write(obj.buttonTextColor)
      ..writeByte(4)
      ..write(obj.appLogo)
      ..writeByte(5)
      ..write(obj.splashImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppThemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
