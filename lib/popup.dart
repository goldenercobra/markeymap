import 'package:flutter/material.dart';
import 'package:markeymap/theme.dart';

void showPopup(
  BuildContext context, {
  @required Widget body,
  String title,
  Color scaffoldColor,
}) =>
    Navigator.of(context).push(
      PopupLayout<void>(
        child: Scaffold(
          backgroundColor: scaffoldColor,
          appBar: AppBar(
            title: Text(title ?? ''),
            leading: Builder(
              builder: (BuildContext context) => IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: body,
        ),
      ),
    );

class PopupPage<T> extends Page<T> {
  const PopupPage({LocalKey key, String name, Object arguments})
      : super(key: key, name: name, arguments: arguments);

  @override
  Route<T> createRoute(BuildContext context) => PopupLayout<T>();
}

class PopupLayout<T> extends PopupRoute<T> {
  PopupLayout({
    this.backgroundColor,
    @required this.child,
    this.top = 30,
    this.bottom = 50,
    this.left = 30,
    this.right = 30,
  });

  final double top;
  final double bottom;
  final double left;
  final double right;
  final Color backgroundColor;
  final Widget child;

  @override
  Duration get transitionDuration => MarkeyMapTheme.animationDuration;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => backgroundColor ?? Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => 'Click to Dismiss';

  @override
  bool get maintainState => false;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) =>
      Container(
        margin: EdgeInsets.only(
          bottom: bottom,
          left: left,
          right: right,
          top: top,
        ),
        child: child,
      );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(
        opacity: animation,
        child: child,
      );
}
