import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_example/bloc/session_bloc.dart';
import 'package:shop_app_example/models/session.dart';
import 'package:shop_app_example/screen/welcome/welcome_screen.dart';

import 'home/home_screen.dart';

class AppBody extends StatefulWidget {
  AppBody({Key? key}) : super(key: key);

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var bloc = Provider.of<SessionBloc>(context);
    bloc.getSession();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<SessionBloc>(
      builder: (ctx,bloc,child) => StreamBuilder(
        stream: bloc.stream,
        builder: (ctx,snap){
          return loadApp(ctx);
        },

      ),
    ));
  }

  Widget loadApp(BuildContext context) {
    if (Session.user == 0) {
      return const WelcomeScreen();
    } else if (Session.user > 0) {
      return Session.currentUser == null ? loading : const HomeScreen();
    } else {
      return loading;
    }
  }

  Widget loading = const Scaffold(
    body: Center(
      child: SizedBox(
        width: 70,
        height: 70,
        child: CircularProgressIndicator(),
      ),
    ),
  );
}
