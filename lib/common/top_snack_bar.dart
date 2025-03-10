import 'dart:async';
import 'dart:ui';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


typedef ControllerCallback = void Function(AnimationController);

enum DismissType { onTap, onSwipe, none }

OverlayEntry? _previousEntry;

/// The [overlayState] argument is used to add specific overlay state.
/// If you are sure that there is a overlay state in your [BuildContext],
/// You can get it [Overlay.of(BuildContext)]
/// Displays a widget that will be passed to [child] parameter above the current
/// contents of the app, with transition animation
///
/// The [child] argument is used to pass widget that you want to show
///
/// The [animationDuration] argument is used to specify duration of
/// enter transition
///
/// The [reverseAnimationDuration] argument is used to specify duration of
/// exit transition
///
/// The [displayDuration] argument is used to specify duration displaying
///
/// The [onTap] callback of [_TopSnackBar]
///
/// The [persistent] argument is used to make snack bar persistent, so
/// [displayDuration] will be ignored. Default is false.
///
/// The [onAnimationControllerInit] callback is called on internal
/// [AnimationController] has been initialized.
///
/// The [padding] argument is used to specify amount of outer padding
///
/// [curve] and [reverseCurve] arguments are used to specify curves
/// for in and out animations respectively
///
/// The [safeAreaValues] argument is used to specify the arguments of the
/// [SafeArea] widget that wrap the snackbar.
///
/// The [dismissType] argument specify which action to trigger to
/// dismiss the snackbar. Defaults to `TopSnackBarDismissType.onTap`
///
/// The [dismissDirection] argument specify in which direction the snackbar
/// can be dismissed. This argument is only used when [dismissType] is equal
/// to `DismissType.onSwipe`. Defaults to `[DismissDirection.up]`
void showTopSnackBar(
  OverlayState overlayState,
  Widget child, {
  Duration animationDuration = const Duration(milliseconds: 1000),
  Duration reverseAnimationDuration = const Duration(milliseconds: 550),
  Duration displayDuration = const Duration(milliseconds: 1500),
  VoidCallback? onTap,
  bool persistent = false,
  ControllerCallback? onAnimationControllerInit,
  EdgeInsets padding = const EdgeInsets.all(16),
  Curve curve = Curves.elasticOut,
  Curve reverseCurve = Curves.linearToEaseOut,
  SafeAreaValues safeAreaValues = const SafeAreaValues(),
  DismissType dismissType = DismissType.onTap,
  List<DismissDirection> dismissDirection = const [DismissDirection.up],
}) {
  late OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (_) {
      return _TopSnackBar(
          onDismissed: () {
            overlayEntry.remove();
            _previousEntry = null;
          },
          animationDuration: animationDuration,
          reverseAnimationDuration: reverseAnimationDuration,
          displayDuration: displayDuration,
          onTap: onTap,
          persistent: persistent,
          onAnimationControllerInit: onAnimationControllerInit,
          padding: padding,
          curve: curve,
          reverseCurve: reverseCurve,
          safeAreaValues: safeAreaValues,
          dismissType: dismissType,
          dismissDirections: dismissDirection,
          child: child);
    },
  );

  if (_previousEntry != null && _previousEntry!.mounted) {
    _previousEntry?.remove();
  }

  overlayState.insert(overlayEntry);
  _previousEntry = overlayEntry;
}

/// Widget that controls all animations
class _TopSnackBar extends StatefulWidget {
  const _TopSnackBar({
    required this.child,
    required this.onDismissed,
    required this.animationDuration,
    required this.reverseAnimationDuration,
    required this.displayDuration,
    required this.padding,
    required this.curve,
    required this.reverseCurve,
    required this.safeAreaValues,
    required this.dismissDirections,
    this.onTap,
    this.persistent = false,
    this.onAnimationControllerInit,
    this.dismissType = DismissType.onTap,
  });

  final Widget child;
  final VoidCallback onDismissed;
  final Duration animationDuration;
  final Duration reverseAnimationDuration;
  final Duration displayDuration;
  final VoidCallback? onTap;
  final ControllerCallback? onAnimationControllerInit;
  final bool persistent;
  final EdgeInsets padding;
  final Curve curve;
  final Curve reverseCurve;
  final SafeAreaValues safeAreaValues;
  final DismissType dismissType;
  final List<DismissDirection> dismissDirections;

  @override
  _TopSnackBarState createState() => _TopSnackBarState();
}

class _TopSnackBarState extends State<_TopSnackBar>
    with SingleTickerProviderStateMixin {
  late final Animation<Offset> _offsetAnimation;
  late final AnimationController _animationController;

  Timer? _timer;

  final _offsetTween = Tween(begin: const Offset(0, -1), end: Offset.zero);

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
      reverseDuration: widget.reverseAnimationDuration,
    );
    _animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed && !widget.persistent) {
          _timer = Timer(widget.displayDuration, () {
            if (mounted) {
              _animationController.reverse();
            }
          });
        }
        if (status == AnimationStatus.dismissed) {
          _timer?.cancel();
          widget.onDismissed.call();
        }
      },
    );

    widget.onAnimationControllerInit?.call(_animationController);

    _offsetAnimation = _offsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: widget.curve,
        reverseCurve: widget.reverseCurve,
      ),
    );
    if (mounted) {
      _animationController.forward();
    }
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: widget.padding.top,
            child: SlideTransition(
              position: _offsetAnimation,
              child: SafeArea(
                top: widget.safeAreaValues.top,
                bottom: widget.safeAreaValues.bottom,
                left: widget.safeAreaValues.left,
                right: widget.safeAreaValues.right,
                minimum: widget.safeAreaValues.minimum,
                maintainBottomViewPadding:
                    widget.safeAreaValues.maintainBottomViewPadding,
                child: _buildDismissibleChild(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build different type of [Widget] depending on [DismissType] value
  Widget _buildDismissibleChild() {
    switch (widget.dismissType) {
      case DismissType.onTap:
        return TapBounceContainer(
          onTap: () {
            widget.onTap?.call();
            if (!widget.persistent && mounted) {
              _animationController.reverse();
            }
          },
          child: widget.child,
        );
      case DismissType.onSwipe:
        var childWidget = widget.child;
        for (final direction in widget.dismissDirections) {
          childWidget = Dismissible(
            direction: direction,
            key: UniqueKey(),
            dismissThresholds: const {DismissDirection.up: 0.2},
            confirmDismiss: (direction) async {
              if (!widget.persistent && mounted) {
                if (direction == DismissDirection.down) {
                  await _animationController.reverse();
                } else {
                  _animationController.reset();
                }
              }
              return false;
            },
            child: childWidget,
          );
        }
        return childWidget;
      case DismissType.none:
        return widget.child;
    }
  }
}

class SafeAreaValues {
  const SafeAreaValues({
    this.left = true,
    this.right = true,
    this.top = true,
    this.bottom = true,
    this.minimum = EdgeInsets.zero,
    this.maintainBottomViewPadding = false,
  });

  final bool left;
  final bool top;
  final bool right;
  final bool bottom;
  final EdgeInsets minimum;
  final bool maintainBottomViewPadding;
}

/// Popup widget that you can use by default to show some information
class CustomSnackBar extends StatefulWidget {
  final String message;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int maxLines;
  final List<BoxShadow> boxShadow;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry messagePadding;
  final double textScaleFactor;
  final TextAlign textAlign;
  final String svgIcon;
  final Color color;

  const CustomSnackBar.success(
      {super.key,
      required this.message,
      this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
      this.textStyle = const TextStyle(color: Color(0xFF33A261), fontSize: 12),
      this.color = const Color(0xFF33A261),
      this.maxLines = 2,
      this.backgroundColor = const Color.fromRGBO(51, 162, 97, 0.1),
      this.boxShadow = kDefaultBoxShadow,
      this.borderRadius = kDefaultBorderRadius,
      this.textScaleFactor = 1.0,
      this.textAlign = TextAlign.center,
      this.svgIcon = "success_tick"});

  const CustomSnackBar.error(
      {super.key,
      required this.message,
      this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
      this.textStyle = const TextStyle(color: Color(0xFFD31948), fontSize: 12),
      this.color = const Color(0xFFD31948),
      this.maxLines = 2,
      this.backgroundColor = const Color.fromRGBO(211, 25, 72, 0.1),
      this.boxShadow = kDefaultBoxShadow,
      this.borderRadius = kDefaultBorderRadius,
      this.textScaleFactor = 1.0,
      this.textAlign = TextAlign.center,
      this.svgIcon = "error"});

  @override
  CustomSnackBarState createState() => CustomSnackBarState();
}

class CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/${widget.svgIcon}.svg",
              width: sizeX18 * Utils.getScalingFactor(context),
              height: sizeX18 * Utils.getScalingFactor(context),
              colorFilter: ColorFilter.mode(widget.color, BlendMode.srcIn),
            ),
            SizedBox(width: sizeX8 * Utils.getScalingFactor(context)),
            Text(
              widget.message,
              style: widget.textStyle,
              textAlign: widget.textAlign,
              // textScaleFactor: widget.textScaleFactor,
              textScaler: TextScaler.linear(widget.textScaleFactor),
            ),
          ],
        ),
      ),
    );
  }
}

const kDefaultBoxShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 8),
    spreadRadius: 1,
    blurRadius: 30,
  ),
];

const kDefaultBorderRadius = BorderRadius.all(Radius.circular(8.0));

/// Widget for nice tap effect. It decrease widget scale while tapping
class TapBounceContainer extends StatefulWidget {
  const TapBounceContainer({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;

  @override
  TapBounceContainerState createState() => TapBounceContainerState();
}

class TapBounceContainerState extends State<TapBounceContainer>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  final animationDuration = const Duration(milliseconds: 200);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: animationDuration,
      upperBound: 0.04,
    )..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onPanEnd: _onPanEnd,
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    if (mounted) {
      _controller.forward();
    }
  }

  Future<void> _onTapUp(TapUpDetails details) async {
    await _closeSnackBar();
  }

  Future<void> _onPanEnd(DragEndDetails details) async {
    await _closeSnackBar();
  }

  Future<void> _closeSnackBar() async {
    if (mounted) {
      unawaited(_controller.reverse());
      await Future.delayed(animationDuration);
      widget.onTap?.call();
    }
  }
}
