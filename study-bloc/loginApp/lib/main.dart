import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginApp/bloc/bloc.dart';
import 'package:formz/formz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color(0xFFFFBD73),
          scaffoldBackgroundColor: Color(0xFF202020),
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              headline4:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              button: TextStyle(
                color: Color(0xFFFFBD73),
              ),
              headline5:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.white.withOpacity(.2))))),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(create: (_) => LoginAppBloc(), child: LoginPage()),
      ),
    );
  }
}

class Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginAppBloc, AppState>(listener: (context, state) {
      if (state.status.isSubmissionSuccess) {
        Scaffold.of(context).hideCurrentSnackBar();
        showDialog<void>(
          context: context,
          builder: (_) => SuccessDialog(),
        );
      }
    });
  }
}

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(Icons.info),
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Form Submitted Successfully",
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            )
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Hello, there !",
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          EmailInput(),
          SizedBox(
            height: 15,
          ),
          PasswordInput(),
          MaterialButton(
            onPressed: () => {print("clicked signin button")},
            shape: CircleBorder(
                side: BorderSide(color: Theme.of(context).primaryColor)),
            color: Theme.of(context).primaryColor,
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            height: 50,
          )
        ],
      ),
    ));
  }
}

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginAppBloc, AppState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextFormField(
            initialValue: state.email.value,
            decoration: InputDecoration(
                icon: const Icon(Icons.email, color: Color(0xFFFFBD73)),
                labelText: 'Email',
                errorText: state.email.invalid ? 'Invalid' : null),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              context.bloc<LoginAppBloc>().add(EmailChanged(email: value));
            },
          );
        });
  }
}

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginAppBloc, AppState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.password.value,
          decoration: InputDecoration(
            icon: const Icon(
              Icons.lock,
              color: Color(0xFFFFBD73),
            ),
            labelText: 'Password',
            errorText: state.password.invalid ? 'Invalid Password' : null,
          ),
          obscureText: true,
          onChanged: (value) {
            context.bloc<LoginAppBloc>().add(PasswordChanged(password: value));
          },
        );
      },
    );
  }
}
