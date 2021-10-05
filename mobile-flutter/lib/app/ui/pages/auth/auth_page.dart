import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../ui.dart';
import '../../../resources/resources.dart';
import 'auth_presenter.dart';

class AuthPage extends StatefulWidget {
  final AuthPresenter presenter;
  const AuthPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    presenter.autoauth();
    super.initState();
  }

  @override
  void dispose() {
    widget.presenter.dispose();
    controllers.forEach((key, value) {
      value.dispose();
    });
    super.dispose();
  }

  AuthPresenter get presenter => widget.presenter;

  final controllers = <String, TextEditingController>{
    'username': TextEditingController(),
    'password': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        title: Text('Auth'),
      ),
      body: Observer(
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Text(R.string.msgUsername),
                TextFormField(
                  controller: controllers['username'],
                ),
                SizedBox(height: 20),
                Text(R.string.msgPassword),
                TextFormField(
                  controller: controllers['password'],
                ),
                SizedBox(height: 100),
                ElevatedButton(
                    onPressed: () async {
                      await presenter
                          .auth(controllers['username']!.text,
                              controllers['password']!.text)
                          .catchError((e) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("$e")));
                      });
                    },
                    child: Text(R.string.msgSingIn)),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await presenter
                          .singup(controllers['username']!.text,
                              controllers['password']!.text)
                          .catchError((e) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("$e")));
                      });
                    },
                    child: Text(R.string.msgSingUp)),
              ],
            ),
          );
        },
      ),
    );
  }
}
