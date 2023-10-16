import 'package:flutter/material.dart';

import '../const/style.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color? textColor;
  final Color? borderColor;
  final bool loading;
  final bool enabled;
  final bool withShadow;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Function action;
  final Widget? leading;
  final Widget? trailing;
  final double? customWidth;
  final double? trailingWidth;
  final double hMargin;
  final double vMargin;

  const AppButton({
    Key? key,
    required this.text,
    required this.color,
    required this.action,
    this.textColor,
    this.borderColor,
    this.enabled = true,
    this.disabledColor,
    this.disabledTextColor,
    this.loading = false,
    this.leading,
    this.trailing,
    this.customWidth,
    this.trailingWidth,
    this.hMargin = 16,
    this.vMargin = 0,
    this.withShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!loading && enabled) {
          action();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        width: loading ? 120 : customWidth ?? MediaQuery.of(context).size.width,
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: hMargin,vertical: vMargin),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(15),
            color: enabled ? color : disabledColor,
            boxShadow: [
              BoxShadow(
                color: enabled && withShadow
                    ? Colors.black.withOpacity(0.4)
                    : Colors.transparent,
                offset: const Offset(0, 5),
                blurRadius: 15,
              ),
            ]),
        child: AnimatedSwitcher(
          duration: const Duration(
            milliseconds: 300,
          ),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: loading
              ? const CircularProgressIndicator()
              : Text(
                  text,
                  style: TextStyle(
                    color: enabled
                        ? textColor ?? AppStyle.whiteColor
                        : disabledTextColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                  maxLines: 1,
                ),
        ),
      ),
    );
  }
}
