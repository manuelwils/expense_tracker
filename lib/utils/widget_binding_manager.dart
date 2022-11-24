import 'package:flutter/material.dart';

class WidgetBindingManager extends StatefulWidget {
  final Widget? child;
  const WidgetBindingManager({Key? key, this.child}) : super(key: key);

  @override
  State<WidgetBindingManager> createState() => _WidgetBindingManagerState();
}

class _WidgetBindingManagerState extends State<WidgetBindingManager> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    print('build running here');
    return widget.child!;
  }

  @override
  void initState() {
    print('init running here');
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WidgetBindingManager oldWidget) {
    print('old widget $oldWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("\n\n\n\t current state is: $state \n\n\n\t");
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    print('dispose running');
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
