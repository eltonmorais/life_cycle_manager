import 'package:flutter/cupertino.dart';

abstract class LifecycleServiceInterface {
  bool _serviceStoped = false;
  bool get serviceStopped => _serviceStoped;
  @mustCallSuper
  void stop() {
    _serviceStoped = true;
  }
  @mustCallSuper
  void start() {
    _serviceStoped = false;
  }
}