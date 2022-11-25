import 'package:flutter/material.dart';

class WidgetBindingManager extends StatefulWidget {
  final Widget? child;
  const WidgetBindingManager({Key? key, this.child}) : super(key: key);

  @override
  State<WidgetBindingManager> createState() => _WidgetBindingManagerState();
}

class _WidgetBindingManagerState extends State<WidgetBindingManager>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WidgetBindingManager oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
}
