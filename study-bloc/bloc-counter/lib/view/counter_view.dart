import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:playable/counter/counter.dart';
import 'package:playable/counter/cubit/counter_cubit.dart';

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text('$state', style: textTheme.headline2);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              onPressed: () => context.bloc<CounterCubit>().increment(),
              child: const Icon(Icons.add),
              key: const Key('counterView_increment_floatingActionButton')),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => context.bloc<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
            key: const Key('counterView_decrement_floatingActionButton'),
          )
        ],
      ),
    );
  }
}
