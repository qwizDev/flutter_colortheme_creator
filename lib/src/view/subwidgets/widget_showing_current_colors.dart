import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExampleWidgetShowingCurrentColors extends ConsumerWidget {
  const ExampleWidgetShowingCurrentColors({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color backgroundCol = colorScheme.surface;

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
              border: Border.all(color: colorScheme.outline, width: 2),
              // color: _colorScheme.surface),
              color: backgroundCol,
            ),
            child: Column(
              children: [
                /* ---------------------------------------------------------------- */
                Text(
                  "This is an Example Widget for showing current CUSTOM(!!!) colors",
                ),
                Text("(not the app-wide used theme!)"),
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
                              backgroundColor: colorScheme.primary,
                              color: colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: emptyFunc,
                          child: Text(
                            "secondary",
                            style: TextStyle(
                              backgroundColor: colorScheme.secondary,
                              color: colorScheme.onSecondary,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: emptyFunc,
                          child: Text(
                            "tertiary",
                            style: TextStyle(
                              backgroundColor: colorScheme.tertiary,
                              color: colorScheme.onTertiary,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: emptyFunc,
                          child: Text(
                            "primary",
                            style: TextStyle(color: colorScheme.primary),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: emptyFunc,
                          child: Text(
                            "secondary",
                            style: TextStyle(color: colorScheme.secondary),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: emptyFunc,
                          child: Text(
                            "tertiary",
                            style: TextStyle(color: colorScheme.tertiary),
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
