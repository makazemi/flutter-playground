import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_flutter_web_app/viewModel/base_viewmodel.dart';


class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;
  final T model;

  BaseView({this.builder, this.onModelReady,this.model});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(widget.model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (context) => widget.model,
        child: Consumer<T>(builder: widget.builder));
  }
}