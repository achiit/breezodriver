import 'package:breezodriver/core/utils%20copy/size_config.dart';
import 'package:breezodriver/features/auth/viewmodels/business_viewmodel.dart';
import 'package:breezodriver/features/auth/viewmodels/location_viewmodel.dart';
import 'package:breezodriver/features/auth/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_routes.dart';
import 'features/auth/viewmodels/auth_viewmodel.dart';
import 'features/home/viewmodels/home_viewmodel.dart';
import 'features/trips/viewmodels/trip_details_viewmodel.dart';
import 'features/auth/viewmodels/otp_viewmodel.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize service locator
  await setupServiceLocator();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<AuthViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<HomeViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<LocationViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<BusinessViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<TripDetailsViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<OtpViewModel>()),
        
      ],
      child: MaterialApp(
        title: 'Breezo Driver',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
         home: Builder(
          builder: (context) {
            SizeConfig().init(context);
            // return MainNavigationScreen();
            return SplashScreen();
          },
        ),
      ),
    );
  }
}
