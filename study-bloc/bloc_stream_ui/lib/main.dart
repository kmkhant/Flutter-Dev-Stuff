import 'package:bloc_stream_ui/bloc/ticker_bloc.dart';
import 'package:bloc_stream_ui/ticker/ticker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(TickerApp());
}

/// {@template ticker_app}
/// [MaterialApp] which sets the [TickerPage] as the `home`
/// [TickerApp] Also provides an instance of [TickerBloc] to
/// the [TickerPage]
/// {@endtemplate}

class TickerApp extends MaterialApp {
  /// {@macro ticker_app}
  TickerApp({Key key})
      : super(
            key: key,
            home: BlocProvider(
              create: (_) => TickerBloc(Ticker()),
              child: TickerPage(),
            ));
}

class TickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc with Streams'),
      ),
      body: BlocBuilder<TickerBloc, TickerState>(
        builder: (context, state) {
          if (state is TickerTickSuccess) {
            return Center(
              child: Text("Tick #${state.count}"),
            );
          }

          return const Center(
            child: Text("Press the floation button to start"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.bloc<TickerBloc>().add(TickerStarted()),
        tooltip: 'Start',
        child: const Icon(Icons.timer),
      ),
    );
  }
}
