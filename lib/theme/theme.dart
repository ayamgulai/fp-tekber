import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4280771466),
      surfaceTint: Color(4280771466),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4291487487),
      onPrimaryContainer: Color(4278197808),
      secondary: Color(4286011915),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294959005),
      onSecondaryContainer: Color(4280621568),
      tertiary: Color(4280771465),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4291487487),
      onTertiaryContainer: Color(4278197808),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294441471),
      onBackground: Color(4279770144),
      surface: Color(4294310653),
      onSurface: Color(4279704607),
      surfaceVariant: Color(4292731882),
      onSurfaceVariant: Color(4282468173),
      outline: Color(4285692030),
      outlineVariant: Color(4290889678),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086260),
      inverseOnSurface: Color(4293784053),
      inversePrimary: Color(4288073208),
      primaryFixed: Color(4291487487),
      onPrimaryFixed: Color(4278197808),
      primaryFixedDim: Color(4288073208),
      onPrimaryFixedVariant: Color(4278209392),
      secondaryFixed: Color(4294959005),
      onSecondaryFixed: Color(4280621568),
      secondaryFixedDim: Color(4293509484),
      onSecondaryFixedVariant: Color(4284171008),
      tertiaryFixed: Color(4291487487),
      onTertiaryFixed: Color(4278197808),
      tertiaryFixedDim: Color(4288073208),
      onTertiaryFixedVariant: Color(4278209392),
      surfaceDim: Color(4292271070),
      surfaceBright: Color(4294310653),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981431),
      surfaceContainer: Color(4293586674),
      surfaceContainerHigh: Color(4293192172),
      surfaceContainerHighest: Color(4292797414),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278208362),
      surfaceTint: Color(4280771466),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282481313),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283842304),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4287655971),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278208362),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282481313),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294441471),
      onBackground: Color(4279770144),
      surface: Color(4294310653),
      onSurface: Color(4279704607),
      surfaceVariant: Color(4292731882),
      onSurfaceVariant: Color(4282205001),
      outline: Color(4284112998),
      outlineVariant: Color(4285889410),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086260),
      inverseOnSurface: Color(4293784053),
      inversePrimary: Color(4288073208),
      primaryFixed: Color(4282481313),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280574343),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4287655971),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285814536),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282481313),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4280574343),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292271070),
      surfaceBright: Color(4294310653),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981431),
      surfaceContainer: Color(4293586674),
      surfaceContainerHigh: Color(4293192172),
      surfaceContainerHighest: Color(4292797414),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278199609),
      surfaceTint: Color(4280771466),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278208362),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281212928),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283842304),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278199609),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278208362),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294441471),
      onBackground: Color(4279770144),
      surface: Color(4294310653),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292731882),
      onSurfaceVariant: Color(4280231210),
      outline: Color(4282205001),
      outlineVariant: Color(4282205001),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086260),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4292734719),
      primaryFixed: Color(4278208362),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278202441),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283842304),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282067456),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278208362),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278202441),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292271070),
      surfaceBright: Color(4294310653),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981431),
      surfaceContainer: Color(4293586674),
      surfaceContainerHigh: Color(4293192172),
      surfaceContainerHighest: Color(4292797414),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4288073208),
      surfaceTint: Color(4288073208),
      onPrimary: Color(4278203471),
      primaryContainer: Color(4278209392),
      onPrimaryContainer: Color(4291487487),
      secondary: Color(4293509484),
      onSecondary: Color(4282330624),
      secondaryContainer: Color(4284171008),
      onSecondaryContainer: Color(4294959005),
      tertiary: Color(4288073208),
      onTertiary: Color(4278203470),
      tertiaryContainer: Color(4278209392),
      onTertiaryContainer: Color(4291487487),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279243799),
      onBackground: Color(4292928488),
      surface: Color(4279178263),
      onSurface: Color(4292797414),
      surfaceVariant: Color(4282468173),
      onSurfaceVariant: Color(4290889678),
      outline: Color(4287336856),
      outlineVariant: Color(4282468173),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797414),
      inverseOnSurface: Color(4281086260),
      inversePrimary: Color(4280771466),
      primaryFixed: Color(4291487487),
      onPrimaryFixed: Color(4278197808),
      primaryFixedDim: Color(4288073208),
      onPrimaryFixedVariant: Color(4278209392),
      secondaryFixed: Color(4294959005),
      onSecondaryFixed: Color(4280621568),
      secondaryFixedDim: Color(4293509484),
      onSecondaryFixedVariant: Color(4284171008),
      tertiaryFixed: Color(4291487487),
      onTertiaryFixed: Color(4278197808),
      tertiaryFixedDim: Color(4288073208),
      onTertiaryFixedVariant: Color(4278209392),
      surfaceDim: Color(4279178263),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849297),
      surfaceContainerLow: Color(4279704607),
      surfaceContainer: Color(4279967779),
      surfaceContainerHigh: Color(4280625965),
      surfaceContainerHighest: Color(4281349688),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4288336380),
      surfaceTint: Color(4288073208),
      onPrimary: Color(4278196264),
      primaryContainer: Color(4284454591),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293772912),
      onSecondary: Color(4280227072),
      secondaryContainer: Color(4289629245),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4288336380),
      onTertiary: Color(4278196264),
      tertiaryContainer: Color(4284454591),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279243799),
      onBackground: Color(4292928488),
      surface: Color(4279178263),
      onSurface: Color(4294441983),
      surfaceVariant: Color(4282468173),
      onSurfaceVariant: Color(4291152850),
      outline: Color(4288586666),
      outlineVariant: Color(4286481546),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797414),
      inverseOnSurface: Color(4280691501),
      inversePrimary: Color(4278209906),
      primaryFixed: Color(4291487487),
      onPrimaryFixed: Color(4278194976),
      primaryFixedDim: Color(4288073208),
      onPrimaryFixedVariant: Color(4278205015),
      secondaryFixed: Color(4294959005),
      onSecondaryFixed: Color(4279832576),
      secondaryFixedDim: Color(4293509484),
      onSecondaryFixedVariant: Color(4282790656),
      tertiaryFixed: Color(4291487487),
      onTertiaryFixed: Color(4278194976),
      tertiaryFixedDim: Color(4288073208),
      onTertiaryFixedVariant: Color(4278205015),
      surfaceDim: Color(4279178263),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849297),
      surfaceContainerLow: Color(4279704607),
      surfaceContainer: Color(4279967779),
      surfaceContainerHigh: Color(4280625965),
      surfaceContainerHighest: Color(4281349688),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294573055),
      surfaceTint: Color(4288073208),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288336380),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294966007),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4293772912),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294573055),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4288336380),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279243799),
      onBackground: Color(4292928488),
      surface: Color(4279178263),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282468173),
      onSurfaceVariant: Color(4294573055),
      outline: Color(4291152850),
      outlineVariant: Color(4291152850),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797414),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278201669),
      primaryFixed: Color(4292078335),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288336380),
      onPrimaryFixedVariant: Color(4278196264),
      secondaryFixed: Color(4294960303),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4293772912),
      onSecondaryFixedVariant: Color(4280227072),
      tertiaryFixed: Color(4292078335),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4288336380),
      onTertiaryFixedVariant: Color(4278196264),
      surfaceDim: Color(4279178263),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849297),
      surfaceContainerLow: Color(4279704607),
      surfaceContainer: Color(4279967779),
      surfaceContainerHigh: Color(4280625965),
      surfaceContainerHighest: Color(4281349688),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
