import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/app_routes.dart';
import 'features/auth/data/datasourece/local_datasource.dart';
import 'features/auth/data/datasourece/remote_datasource.dart';
import 'features/auth/data/repository/auth_repository.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/home/presentation/cubits/counter_page_cubit/counter_page_cubit.dart';
import 'features/home/presentation/cubits/home_cubit/cubit_product.dart';
import 'features/home/presentation/cubits/users_cubit/users_cubit.dart';

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
              (context) => AuthCubit(
                authRepo: AuthRepository(
                  authRemote: AuthRemoteDatasource(Dio()),
                  localDatasource: AuthLocalDatasource(),
                ),
              ),
        ),
        BlocProvider(create: (_) => CounterPageCubit()),
        BlocProvider(create: (_) => UsersCubit()),
        BlocProvider(create: (_) => CubitProduct()),
      ],
      child: MaterialApp.router(routerConfig: AppRoutes.router),
    );
  }
}
