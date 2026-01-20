import 'package:flutter/material.dart';
import 'package:frontend_flutter/app/core/values/app_breakpoints.dart';

/// نظام الأحجام المتجاوب (Responsive Sizing System)
class ResponsiveSize {
  final BuildContext context;

  ResponsiveSize(this.context);

  /// عرض الشاشة
  double get width => MediaQuery.of(context).size.width;

  /// ارتفاع الشاشة
  double get height => MediaQuery.of(context).size.height;

  /// نسبة العرض (responsive width)
  /// استخدام: width(50) = 50% من عرض الشاشة
  double widthPercent(double percent) => width * (percent / 100);

  /// نسبة الارتفاع (responsive height)
  /// استخدام: height(50) = 50% من ارتفاع الشاشة
  double heightPercent(double percent) => height * (percent / 100);

  /// حجم بناءً على أصغر بُعد (responsive based on smallest dimension)
  double responsive(double size) {
    final smallest = width < height ? width : height;
    return smallest * (size / 100);
  }

  /// حجم الخط المتجاوب
  double fontSize(double baseSize) {
    final deviceType = AppBreakpoints.getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        return baseSize;
      case DeviceType.tablet:
        return baseSize * 1.2;
      case DeviceType.desktop:
        return baseSize * 1.4;
      case DeviceType.largeDesktop:
        return baseSize * 1.6;
    }
  }

  /// حجم الأيقونة المتجاوب
  double iconSize(double baseSize) {
    final deviceType = AppBreakpoints.getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        return baseSize;
      case DeviceType.tablet:
        return baseSize * 1.3;
      case DeviceType.desktop:
        return baseSize * 1.5;
      case DeviceType.largeDesktop:
        return baseSize * 1.8;
    }
  }

  /// Padding متجاوب
  double padding(double basePadding) {
    final deviceType = AppBreakpoints.getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        return basePadding;
      case DeviceType.tablet:
        return basePadding * 1.5;
      case DeviceType.desktop:
        return basePadding * 2;
      case DeviceType.largeDesktop:
        return basePadding * 2.5;
    }
  }

  /// عرض الـ Container بحد أقصى (للتابلت والديسكتوب)
  double get maxContentWidth {
    final deviceType = AppBreakpoints.getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        return width;
      case DeviceType.tablet:
        return 700;
      case DeviceType.desktop:
        return 900;
      case DeviceType.largeDesktop:
        return 1200;
    }
  }

  /// عدد الأعمدة في Grid حسب حجم الشاشة
  int gridColumns({int mobile = 1, int tablet = 2, int desktop = 3}) {
    final deviceType = AppBreakpoints.getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet;
      case DeviceType.desktop:
      case DeviceType.largeDesktop:
        return desktop;
    }
  }
}

/// Extension لتسهيل الاستخدام
extension ResponsiveContext on BuildContext {
  ResponsiveSize get responsive => ResponsiveSize(this);

  bool get isMobile => AppBreakpoints.isMobile(this);
  bool get isTablet => AppBreakpoints.isTablet(this);
  bool get isDesktop => AppBreakpoints.isDesktop(this);
}
