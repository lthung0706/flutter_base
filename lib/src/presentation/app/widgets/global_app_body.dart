import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:report_person/src/presentation/app/bloc/global_app_bloc.dart';
import 'package:report_person/src/routes/routes.dart';

class GlobalAppBody extends StatelessWidget {
  const GlobalAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GlobalAppBloc, GlobalAppState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == GlobalAppStatus.isFirstLaunch) {
          context.go(Routes.onBoarding);
        }
        if (state.status == GlobalAppStatus.isNotFirstLaunch) {
          context.go(Routes.authentication);
        }
      },
      child: RepaintBoundary(
        child: Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
