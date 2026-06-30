import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';
import 'screens/home_screen.dart';
import 'services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final storageService = StorageService();
  await storageService.init();
  
  runApp(
    MultiProvider(
      providers: [
        Provider<StorageService>.value(value: storageService),
      ],
      child: const ScrappyBirdApp(),
    ),
  );
}

class ScrappyBirdApp extends StatelessWidget {
  const ScrappyBirdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrappy Bird',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      home: const HomeScreen(),
    );
  }
}