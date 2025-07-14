import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nest_loop_mobile/nest_loop_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize(); //
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: "configurations/config.env");
  runApp(ProviderScope(child: const NestLoopApp()));
}
