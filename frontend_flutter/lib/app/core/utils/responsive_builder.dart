import 'package:flutter/material.dart';
import 'package:frontend_flutter/app/core/values/app_breakpoints.dart';

/// Widget Builder للعرض المتجاوب
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context)? mobile;
  final Widget Function(BuildContext context)? tablet;
  final Widget Function(BuildContext context)? desktop;

  const ResponsiveBuilder({super.key, this.mobile, this.tablet, this.desktop});

  @override
  Widget build(BuildContext context) {
    final deviceType = AppBreakpoints.getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        return mobile?.call(context) ??
            tablet?.call(context) ??
            desktop?.call(context) ??
            const SizedBox.shrink();

      case DeviceType.tablet:
        return tablet?.call(context) ??
            desktop?.call(context) ??
            mobile?.call(context) ??
            const SizedBox.shrink();

      case DeviceType.desktop:
      case DeviceType.largeDesktop:
        return desktop?.call(context) ??
            tablet?.call(context) ??
            mobile?.call(context) ??
            const SizedBox.shrink();
    }
  }
}

/// Widget للقيمة المتجاوبة (Value)
class ResponsiveValue<T> {
  final T mobile;
  final T? tablet;
  final T? desktop;

  const ResponsiveValue({required this.mobile, this.tablet, this.desktop});

  T getValue(BuildContext context) {
    final deviceType = AppBreakpoints.getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.desktop:
      case DeviceType.largeDesktop:
        return desktop ?? tablet ?? mobile;
    }
  }
}
