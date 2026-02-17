import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/src/view/subwidgets/widget_showing_current_colors.dart';
import 'package:flutter_colortheme_creator/src/view/util/helpers.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../flutter_colortheme_creator.dart';
import '../../provider/custom_color_scheme_data_provider.dart';
import '../../provider/theme_state_provider.dart';

enum ButtonsForColorSchemeCreation {
  useThisColor,
  createAndUseTheme,
  useAsSeedColor,
  useSchemeGlobally,
}

class ButtonPanelForColorSchemeCreation extends ConsumerStatefulWidget {
  const ButtonPanelForColorSchemeCreation({
    super.key,
    required this.themeController,
    this.givenButtonsToUse = const [],
    this.asRow = false,
  });

  final ThemeController themeController;
  final List<ButtonsForColorSchemeCreation> givenButtonsToUse;
  final bool asRow;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ButtonPanelForColorSchemeCreation();
  }
}

class _ButtonPanelForColorSchemeCreation
    extends ConsumerState<ButtonPanelForColorSchemeCreation> {
  late ColorScheme _ownCustomColorScheme;
  late final ThemeController themeController = widget.themeController;
  final List<ButtonsForColorSchemeCreation> stdButtonsToUse =
      ButtonsForColorSchemeCreation.values;
  late List<ButtonsForColorSchemeCreation> buttonsToUse;

  @override
  Widget build(BuildContext context) {
    _ownCustomColorScheme = ref
        .watch(customColorschemeDataProvider(themeController))
        .customColorScheme;

    if (widget.givenButtonsToUse.isEmpty) {
      buttonsToUse = stdButtonsToUse;
    } else {
      buttonsToUse = widget.givenButtonsToUse;
    }

    if (widget.asRow) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [...createAllButtons()],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [...createAllButtons()],
      );
    }
  }

  List<Widget> createAllButtons() {
    return [
      if (buttonsToUse.contains(ButtonsForColorSchemeCreation.useThisColor))
        _ButtonForThis(
          onPressed: () =>
              Helpers.useThisColorAsAColorRole(ref, themeController),
          child: Text("USE THIS COLOR"),
        ),

      // if (buttonsToUse.contains(
      //   ButtonsForColorSchemeCreation.createAndUseTheme,
      // ))
      //   _ButtonForThis(
      //     onPressed: () => nowCreateAndUseTheme(themeController),
      //     child: Text("CREATE AND USE THEME"),
      //   ),
      if (buttonsToUse.contains(ButtonsForColorSchemeCreation.useAsSeedColor))
        _ButtonForThis(
          onPressed: () => useColorAsSeedColor(themeController),
          child: Text("USE AS SEED COLOR"),
        ),

      if (buttonsToUse.contains(
        ButtonsForColorSchemeCreation.useSchemeGlobally,
      ))
        _ButtonForThis(
          onPressed: () {
            setColorSchemeGlobally(themeController);
          },
          child: Text("USE SCHEME GLOBALLY"),
        ),
    ];
  }

  void nowCreateAndUseTheme(ThemeController themeController) {
    ref
        .read(customColorschemeDataProvider(themeController).notifier)
        .setCustomColorScheme(_ownCustomColorScheme);
  }

  void useColorAsSeedColor(ThemeController themeController) {
    _ownCustomColorScheme = ColorScheme.fromSeed(
      seedColor: ref
          .read(customColorschemeDataProvider(themeController))
          .chosenColor,
    );
    ref
        .read(customColorschemeDataProvider(themeController).notifier)
        .setCustomColorScheme(_ownCustomColorScheme);
  }

  void setColorSchemeGlobally(ThemeController themeController) {
    // ref
    //     .read(themeStateProvider.notifier)
    //     .setColorTheme(
    //       ref
    //           .read(customColorschemeDataProvider(themeController))
    //           .customColorScheme,
    //     );

    final String themeName = DateTime.now().toIso8601String();
    themeController.addThemeToList(
      themeName,
      // ref.read(themeStateProvider).colorScheme,
      ref
          .read(customColorschemeDataProvider(themeController))
          .customColorScheme,
      true,
    );
    themeController.applyTheme(themeName);
  }
}

class _ButtonForThis extends StatelessWidget {
  static final buttonSizeMax = WidgetStateProperty.all(const Size(250, 250));
  static final buttonSizeMin = WidgetStateProperty.all(const Size(250, 50));
  static final shape = WidgetStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  );

  final ButtonStyle style = ButtonStyle(
    maximumSize: buttonSizeMax,
    minimumSize: buttonSizeMin,
    shape: shape,
  );

  final Widget child;
  // void Function()? onPressed = () => print("something");
  final Function()? onPressed;

  _ButtonForThis({required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // return Expanded(
    //   child: Column(
    //     mainAxisSize: MainAxisSize.max,
    //     children: [
    //       ElevatedButton(onPressed: onPressed, style: style, child: child),
    //     ],
    //   ),
    // );
    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 300),
        child: ElevatedButton(onPressed: onPressed, style: style, child: child),
      ),
    );
  }
}
