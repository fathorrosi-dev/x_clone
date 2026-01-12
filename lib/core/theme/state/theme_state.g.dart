// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeState _$ThemeStateFromJson(Map<String, dynamic> json) => ThemeState(
  themeMode:
      $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
      ThemeMode.system,
  useDynamicColor: json['useDynamicColor'] as bool? ?? true,
  textScaleFactor:
      (json['textScaleFactor'] as num?)?.toDouble() ??
      ThemeConstants.defaultTextScale,
  useSystemTextScale: json['useSystemTextScale'] as bool? ?? true,
  themeVariant:
      $enumDecodeNullable(_$ThemeVariantEnumMap, json['themeVariant']) ??
      ThemeVariant.material,
);

Map<String, dynamic> _$ThemeStateToJson(ThemeState instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'useDynamicColor': instance.useDynamicColor,
      'textScaleFactor': instance.textScaleFactor,
      'useSystemTextScale': instance.useSystemTextScale,
      'themeVariant': _$ThemeVariantEnumMap[instance.themeVariant]!,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$ThemeVariantEnumMap = {
  ThemeVariant.material: 'material',
  ThemeVariant.brand: 'brand',
};
