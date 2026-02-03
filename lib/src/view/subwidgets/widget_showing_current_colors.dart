import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ExampleWidgetShowingCurrentColors extends ConsumerWidget {
  const ExampleWidgetShowingCurrentColors({
    super.key,
    required this.customThemeData,
  });

  final ThemeData customThemeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 50,
        maxHeight: 1000,
        minWidth: 100,
        maxWidth: 1000,
      ),
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: customThemeData.colorScheme.outline,
                width: 2,
              ),
              // color: _customThemeData.colorScheme.surface),
              color: customThemeData.colorScheme.surface,
            ),
            child: Column(
              children: [
                /* ---------------------------------------------------------------- */
                Text("This is an Example Widget for showing current colors"),
                /* ---------------------------------------------------------------- */
                Text("The background-color is surface"),
                Wrap(
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: emptyFunc,
                          child: Text(
                            "primary",
                            style: TextStyle(
                              backgroundColor:
                                  customThemeData.colorScheme.primary,
                              color: customThemeData.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: emptyFunc,
                          child: Text(
                            "secondary",
                            style: TextStyle(
                              backgroundColor:
                                  customThemeData.colorScheme.secondary,
                              color: customThemeData.colorScheme.onSecondary,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: emptyFunc,
                          child: Text(
                            "tertiary",
                            style: TextStyle(
                              backgroundColor:
                                  customThemeData.colorScheme.tertiary,
                              color: customThemeData.colorScheme.onTertiary,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: emptyFunc,
                          child: Text(
                            "primary",
                            style: TextStyle(
                              color: customThemeData.colorScheme.primary,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: emptyFunc,
                          child: Text(
                            "secondary",
                            style: TextStyle(
                              color: customThemeData.colorScheme.secondary,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: emptyFunc,
                          child: Text(
                            "tertiary",
                            style: TextStyle(
                              color: customThemeData.colorScheme.tertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

var emptyFunc = () {};
