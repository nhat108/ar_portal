import 'package:ar_portal/utils/app_colors.dart';
import 'package:ar_portal/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ActionDialog extends StatelessWidget {
  final String title;
  final Widget child;
  final bool showCloseIcon;
  final bool showDivider;
  final VoidCallback? onPop;

  const ActionDialog({
    Key? key,
    this.showDivider = true,
    this.showCloseIcon = true,
    required this.title,
    required this.child,
    this.onPop,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 24),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: showCloseIcon ? 24 : 0,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: AppStyles.textSize18(),
                      // maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  showCloseIcon
                      ? GestureDetector(
                          onTap: () {
                            if (onPop != null) {
                              onPop!();
                            }
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close))
                      : Container(
                          width: showCloseIcon ? 24 : 0,
                        ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            if (showDivider)
              const Divider(
                height: 1,
                color: AppColors.carnationPink,
              ),
            Flexible(child: child),
          ],
        ),
      ),
    );
  }
}

class InfoDialog extends StatelessWidget {
  final String message;
  final String? title;
  final Function? onClose;
  const InfoDialog({Key? key, this.title, required this.message, this.onClose})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ActionDialog(
      title: title ?? 'Error',
      showCloseIcon: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Text(
              message,
              style: AppStyles.textSize16(),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                if (onClose != null) {
                  onClose!();
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xff5D4CCA),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        "Close",
                        style: AppStyles.textSize16(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  final String message;
  final VoidCallback? onClosePressed;
  final VoidCallback? onConfirmPressed;
  final String? titleConfirm;
  final String? titleClose;
  final String? title;
  final bool showCloseButton;

  const CustomAlertDialog({
    Key? key,
    required this.message,
    this.onClosePressed,
    this.onConfirmPressed,
    this.titleClose,
    this.titleConfirm,
    this.title,
    this.showCloseButton = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ActionDialog(
      title: title ?? 'Error',
      showCloseIcon: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Text(
              message,
              style: AppStyles.textSize16(),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: GestureDetector(
              onTap: () {
                if (onConfirmPressed != null) {
                  onConfirmPressed!();
                } else {
                  Navigator.pop(context);
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: const Color(0xff5D4CCA),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        "Close",
                        style: AppStyles.textSize16(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (showCloseButton)
            const SizedBox(
              height: 16,
            ),
          if (showCloseButton)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: GestureDetector(
                onTap: () {
                  if (onClosePressed != null) {
                    onClosePressed!();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xffF1EFFC),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Text(
                          "Cancel",
                          style: AppStyles.textSize16(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
