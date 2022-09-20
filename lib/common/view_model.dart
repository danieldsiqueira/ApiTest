import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class _ViewModelProvider extends InheritedWidget {
  final dynamic viewModel;

  const _ViewModelProvider({required child, required this.viewModel, Key? key})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class ViewModel<T extends Object> extends StatefulWidget {
  final T Function(BuildContext context) create;
  final Widget Function(BuildContext context, T controller)? builder;
  final Widget? child;

  const ViewModel({
    Key? key,
    required this.create,
    this.builder,
    this.child,
  })  : assert(child != null || builder != null),
        super(key: key);

  static T of<T extends Object>(BuildContext context) {
    final provider =
        context.getElementForInheritedWidgetOfExactType<_ViewModelProvider>();

    if (provider == null) {
      throw Exception('viewmodel not found');
    }

    return (provider.widget as _ViewModelProvider).viewModel;
  }

  @override
  State<ViewModel<T>> createState() => ViewModelState<T>();
}

class ViewModelState<T extends Object> extends State<ViewModel<T>> {
  late T viewmodel;

  @override
  void initState() {
    super.initState();

    viewmodel = widget.create(context);

    log('${T.toString()} - Create ViewModel => ${viewmodel.hashCode}');
  }

  @override
  Widget build(BuildContext context) {
    return _ViewModelProvider(
      viewModel: viewmodel,
      child: widget.child ??
          Builder(
            builder: (context) {
              return widget.builder!(context, viewmodel);
            },
          ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    log('${T.toString()} - Dispose ViewModel Scope => ${viewmodel.hashCode}');

    if (viewmodel is Disposable) {
      (viewmodel as Disposable).onDispose();
    }
  }
}

abstract class Disposable {
  FutureOr onDispose();
}
