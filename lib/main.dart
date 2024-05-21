import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:transjo/core/services/services_locater.dart';
import 'package:transjo/core/utils/cash_helper.dart';
import 'package:transjo/core/utils/dio_helper.dart';

import 'app.dart';
import 'core/utils/app_constanse.dart';
import 'core/utils/bloc_observer.dart';

Future<void> main() async {
  DioHelper.init();
  WidgetsFlutterBinding
      .ensureInitialized(); //عشان ما يعمل رن الا لما يتأكد انو كلشي معملوه initlaies
  await CashHelper.init();
  Bloc.observer = MyBlocObserver();
  ServicesLocater().init();
  /* email = await CashHelper.getData(key: "email") ??"";
  password = await CashHelper.getData(key: "password") ??"";*/
  token = await CashHelper.getData(key: "token") ?? "";
  runApp(const App());
}
