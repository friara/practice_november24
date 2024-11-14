import 'package:demo_state_manage/app_data.dart';
import 'package:demo_state_manage/app_data_provider.dart';
import 'package:demo_state_manage/bloc/color_bloc.dart';
import 'package:demo_state_manage/bloc_page.dart';
import 'package:demo_state_manage/cubit_page.dart';
import 'package:demo_state_manage/inhireted_page.dart';
import 'package:demo_state_manage/provider_page.dart';
import 'package:demo_state_manage/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final colorBloc = ColorBloc();

void main() {
  // runApp(AppDataProvider(
  //   appData: AppData(backgroundColor: Util.randomColor()),
  //   child: MaterialApp(
  //     routes: {
  //       '/': (context) => const InhiretedPage(),
  //       '/second': (context) => const InhiretedPage()
  //     }
  // )));

  // runApp(ChangeNotifierProvider(
    
  //   create: (BuildContext context) => AppData1(backgroundColor: Util.randomColor()),
  //   child: MaterialApp(
  //     routes: {
  //       '/': (context) => const ProviderPage(),
  //       '/second': (context) => const ProviderPage()
  //     }
  // )));

  // runApp(MaterialApp(
  //     routes: {
  //       '/': (context) => const BlocPage(),
  //       '/second': (context) => const BlocPage()
  //     }
  // ));
  runApp(MaterialApp(
      routes: {
        '/': (context) => const CubitPage(),
        '/second': (context) => const CubitPage()
      }
  ));
}

