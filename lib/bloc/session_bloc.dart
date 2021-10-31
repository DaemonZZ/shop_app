import 'dart:async';

import 'package:shop_app_example/base/base_bloc.dart';
import 'package:shop_app_example/base/base_event.dart';
import 'package:shop_app_example/datasource/db/session_table.dart';
import 'package:shop_app_example/event/session_event/change_session_event.dart';
import 'package:shop_app_example/models/session.dart';

class SessionBloc extends BaseBloc{
  StreamController<Session> _streamController = StreamController<Session>();
  SessionTable _table = SessionTable();
  Stream<Session> get stream => _streamController.stream;
   Future getSession()async{
    Session.user = await _table.select();
    _streamController.sink.add(Session());
  }

  @override
  dispatchEvent(BaseEvent event) {
    if(event is ChangeSessionEvent){
      getSession();
    } else {
      throw Exception("Invalid");
    }
  }
  @override
  dispose() {
    return super.dispose();
    _streamController.close();
  }

}