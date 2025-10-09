import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_chatbot/core/presentations/app_widget.dart';
import 'package:frontend_chatbot/core/bloc/bloc_providers.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: BlocProviders.providers,
      child: const AppWidget(),
    ),
  );
}
