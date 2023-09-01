import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_theme_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ui_helper.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppThemeProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(builder: (_, provider, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        themeMode: provider.isDark ? ThemeMode.dark : ThemeMode.light,
        darkTheme: MyAppTheme.darkTheme(),
        theme: MyAppTheme.lightTheme(),
        home: HomePage(),
      );
    });
  }
}

class HomePage extends StatelessWidget {
  Color bgColor = Colors.white;
  Color secondaryColor = Colors.black;
  Color textSecondaryColor = Colors.white;
  Color textColor = Colors.black;
  String title = "Light";
  late bool isDark;

  @override
  Widget build(BuildContext context) {
    var mqData = MediaQuery.of(context);
    print("Platform : ${mqData.platformBrightness}");

    var themeData = Theme.of(context);
    print("App: ${themeData.brightness}");

    isDark = themeData.brightness == Brightness.dark;
    getThemeColors();

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hey i'm Above this..",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Container(
              width: 200,
              height: 100,
              color: secondaryColor,
              child: Center(
                child: Text(
                  "Hey this is $title",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: textSecondaryColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.all(11),
              child: ElevatedButton(
                  onPressed: () {},
                  style: themeData.elevatedButtonTheme.style,
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(color: textSecondaryColor),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dark Mode'),
                Switch(
                    value: isDark,
                    onChanged: (value) {
                      isDark = value;
                      context.read<AppThemeProvider>().updateTheme(value);
                    })
              ],
            )
          ],
        ),
      ),
    );
  }

  void getThemeColors() {
    if (isDark) {
      //dark
      bgColor = Colors.black;
      secondaryColor = Colors.white;
      textSecondaryColor = Colors.black;
      textColor = Colors.white;
      title = "Dark";
    } else {
      //light
      bgColor = Colors.white;
      secondaryColor = Colors.black;
      textSecondaryColor = Colors.white;
      textColor = Colors.black;
      title = "Light";
    }
  }
}
