import 'package:flutter/cupertino.dart';
import 'package:life_cycle_manager/src/models/custom_actions_service.dart';
import 'package:life_cycle_manager/src/models/lifecycle_service_interface.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget child;
  final Function onStart;
  final Function onStop;

  const LifeCycleManager({Key key, this.child, this.onStart, this.onStop})
      : super(key: key);
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  List<LifecycleServiceInterface> services;

  @override
  void initState() {
    services = [
      CustomActionsService(
        onStart: widget.onStart,
        onStop: widget.onStop,
      ),
    ];
    
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    services.forEach((service) {
      if (state == AppLifecycleState.resumed) {
        service.start();
      } else {
        service.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}
