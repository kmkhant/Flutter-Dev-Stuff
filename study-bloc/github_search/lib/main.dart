import 'package:flutter/material.dart';
import 'package:github_search/github_client/github_client.dart';
import 'package:github_search/models/models.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/views/search_form.dart';

import 'bloc/github_bloc.dart';

void main() {
  final GithubRepository _githubRepository = GithubRepository(
    GithubCache(),
    GithubClient(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GithubRepository githubRepository;

  const MyApp({Key key, @required this.githubRepository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Search',
      home: Scaffold(
        appBar: AppBar(title: Text('Github Search')),
        body: BlocProvider(
          create: (context) =>
              GithubSearchBloc(githubRepository: githubRepository),
          child: SearchForm(),
        ),
      ),
    );
  }
}
