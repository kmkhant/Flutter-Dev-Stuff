import 'package:complex_structures/list/cubit/list_cubit.dart';
import 'package:complex_structures/list/view/view.dart';
import 'package:complex_structures/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends MaterialApp {
  App()
      : super(
            home: BlocProvider(
          create: (_) => ListCubit(repository: Repository())..fetchList(),
          child: ListPage(),
        ));
}
