import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/src/provider/theme_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';


class ExampleWidgetForChosenColors extends ConsumerWidget{
  const ExampleWidgetForChosenColors({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  ThemeData themeData = ref.watch(themeStateProvider).themeData;

  return ConstrainedBox(
    constraints: BoxConstraints(maxHeight: 800, maxWidth: 600),
    child: Wrap(
      children: [
        Column(
          children: [
            SizedBox(
              // height: 40,
              width: 400,
              // height: 400,
              child: Container( 
                decoration: BoxDecoration(
                  border: WidgetDeco.borderStd,
                  color: themeData.primaryColor,
                ),
                // color: themeData.primaryColor,
                child: Column(
                  children: [
                    Text("ExampleWidget for PrimaryColor:"),
                    Text("BackgroundColor: primaryColor"),
                    Text("Text has color: default"),
                    Text(
                      style: TextStyle(color: themeData.primaryColorLight),
                      "Text has color: primaryColorLight",
                    ),
                    Text(
                      style: TextStyle(color: themeData.primaryColorDark),
                      "Text has color: primaryColorDark",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              // height: 40,
              width: 400,
              child: Container(
                color: themeData.primaryColorLight,
                child: Column(
                  children: [
                    Text("BackgroundColor: primaryColorLight"),
                    Text("Text has color: default"),
                    Text(
                      style: TextStyle(color: themeData.primaryColor),
                      "Text has color: primaryColor",
                    ),
                    Text(
                      style: TextStyle(color: themeData.primaryColorDark),
                      "Text has color: primaryColorDark",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              // height: 40,
              width: 400,
              child: Container(
                color: themeData.primaryColorDark,
                child: Column(
                  children: [
                    Text("BackgroundColor: primaryColorDark"),
                    Text("Text has color: default"),
                    Text(
                      style: TextStyle(color: themeData.primaryColor),
                      "Text has color: primaryColor",
                    ),
                    Text(
                      style: TextStyle(color: themeData.primaryColorLight),
                      "Text has color: primaryColorLight",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  }

}