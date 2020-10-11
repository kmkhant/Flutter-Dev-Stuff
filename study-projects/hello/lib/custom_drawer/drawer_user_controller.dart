import 'package:flutter/material.dart';
import 'package:hello/app_theme.dart';
import 'package:hello/custom_drawer/home_drawer.dart';

class DrawerUserController extends StatefulWidget {
  final double drawerWidth;
  final Function(DrawerIndex) onDrawerCall;
  final Widget screenView;
  final Function(bool) drawerIsOpen;
  final AnimatedIconData animatedIconData;
  final Widget menuView;
  final DrawerIndex screenIndex;

  const DrawerUserController(
      {Key key,
      this.drawerWidth,
      this.onDrawerCall,
      this.screenView,
      this.drawerIsOpen,
      this.animatedIconData,
      this.menuView,
      this.screenIndex})
      : super(key: key);

  @override
  _DrawerUserControllerState createState() => _DrawerUserControllerState();
}

class _DrawerUserControllerState extends State<DrawerUserController>
    with TickerProviderStateMixin {
  ScrollController scrollController;
  AnimationController iconAnimationController;
  AnimationController animationController;

  double scrolloffset = 0.8;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    iconAnimationController = AnimationController(
        duration: const Duration(milliseconds: 0), vsync: this);
    iconAnimationController.animateTo(1.0,
        duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);
    scrollController =
        ScrollController(initialScrollOffset: widget.drawerWidth);
    scrollController
      ..addListener(() {
        if (scrollController.offset <= 0) {
          if (scrolloffset != 1.0) {
            setState(() {
              scrolloffset = 1.0;
              try {
                widget.drawerIsOpen(true);
              } catch (_) {}
            });
            iconAnimationController.animateTo(0.0,
                duration: const Duration(milliseconds: 0),
                curve: Curves.fastOutSlowIn);
          } else if (scrollController.offset > 0 &&
              scrollController.offset < widget.drawerWidth.floor()) {
            iconAnimationController.animateTo(
                (scrollController.offset * 100 / (widget.drawerWidth)) / 100);
          } else {
            if (scrolloffset != 0.0) {
              setState(() {
                scrolloffset = 0.0;
                try {
                  widget.drawerIsOpen(false);
                } catch (_) {}
              });
            }
            iconAnimationController.animateTo(1.0,
                duration: const Duration(milliseconds: 0),
                curve: Curves.fastOutSlowIn);
          }
        }
      });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => getInitState());
    super.initState();
  }

  Future<bool> getInitState() async {
    scrollController.jumpTo(
      widget.drawerWidth,
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
