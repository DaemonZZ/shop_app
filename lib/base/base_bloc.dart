import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shop_app_example/base/base_event.dart';

abstract class BaseBloc{
  StreamController<BaseEvent> _eventStreamController = StreamController<BaseEvent>();
  Sink<BaseEvent> get event => _eventStreamController.sink;

  BaseBloc(){
    _eventStreamController.stream.listen((event) {
        event is! BaseEvent ?  throw Exception("invalid event")
          : dispatchEvent(event);
    });
  }

  dispatchEvent(BaseEvent event);

  @mustCallSuper
  dispose(){
    _eventStreamController.close();
  }
}