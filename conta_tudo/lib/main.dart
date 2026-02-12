import 'package:conta_tudo/firebase_options.dart';
import 'package:conta_tudo/screen/auth/auth_check.dart';
import 'package:conta_tudo/services/auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  /// Garante que o flutter esteja pronto antes de iniciar o firebase
  WidgetsFlutterBinding.ensureInitialized();

  /// Conecta o meu app com o projeto Firebase e esse options usa a config correta para cada plataforma
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthServices())],
      child: MaterialApp(home: AuthCheck()),
    ),
  );
}
