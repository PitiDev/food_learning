import 'package:fluttermvc/features/home/provider/home_provider.dart';
import 'package:fluttermvc/features/login/provider/login_provider.dart';
import 'package:provider/provider.dart';

dynamic providerList = [
  ChangeNotifierProvider(create: (_) => LoginProvider()),
  ChangeNotifierProvider(create: (_) => HomeProvider()),
];
