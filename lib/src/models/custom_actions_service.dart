import 'package:life_cycle_manager/src/models/lifecycle_service_interface.dart';

class CustomActionsService extends LifecycleServiceInterface {
  final Function() onStart;
  final Function() onStop;

  CustomActionsService({this.onStart, this.onStop});

  @override
  void start() {
    super.start();
    if (onStart != null) {
      onStart();
    }
  }

  @override
  void stop() {
    super.stop();
    if (onStop != null) {
      onStop();
    }
  }
}
