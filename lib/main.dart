import 'package:dio/dio.dart';
import 'package:ecommer_app_market/core/routes/app_routes.dart';
import 'package:ecommer_app_market/features/auth/data/datasourece/local_datasource.dart';
import 'package:ecommer_app_market/features/auth/data/datasourece/remote_datasource.dart';
import 'package:ecommer_app_market/features/auth/data/repository/auth_repository.dart';
import 'package:ecommer_app_market/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => AuthBloc(
                authRepo: AuthRepository(
                  authRemote: AuthRemoteDatasource(Dio()),
                  localDatasource: AuthLocalDatasource(),
                ),
              ),
        ),
      ],
      child: MaterialApp.router(routerConfig: AppRoutes.router),
    );
  }
}
