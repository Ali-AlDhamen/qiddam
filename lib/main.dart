import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qiddam/routing/route.dart';
import 'package:qiddam/theme/app_theme.dart';
import 'features/auth/controller/auth_controller.dart';
import 'firebase_options.dart';
// ignore: depend_on_referenced_packages
import 'package:stack_trace/stack_trace.dart' as stack_trace;

import 'models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  void getData(WidgetRef ref, User data) async {
    UserModel? userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModel);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvier);

    ref.watch(authStateChangeProvider).whenData((data) {
      if (data != null) {
        getData(ref, data);
      }
    });

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Qiddam',
      theme: AppTheme.lightModeAppTheme,
      routerConfig: router,
    );
  }
}
