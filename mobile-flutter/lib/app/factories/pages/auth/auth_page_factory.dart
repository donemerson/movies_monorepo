import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../ui/pages/pages.dart';
import 'auth_presenter_factory.dart';

Widget makeAuthPage() => Provider(
      create: (_) => makeStoreAuthPresenter(),
      child: Builder(
        builder: (context) => AuthPage(
          presenter: Provider.of<AuthPresenter>(context),
        ),
      ),
    );
