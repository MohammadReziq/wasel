import 'package:flutter/material.dart';

/// نقاط القطع (Breakpoints) لأحجام الشاشات المختلفة
class AppBreakpoints {
  // Mobile (Phones)
  static const double mobile = 600;
  
  // Tablet (iPads, etc.)
  static const double tablet = 900;
  
  // Desktop (Laptops, Desktops)
  static const double desktop = 1200;
  
  // Large Desktop (4K screens)
  static const double largeDesktop = 1800;
  
  /// التحقق من حجم الشاشة
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobile;
  }
  
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= mobile &&
        MediaQuery.of(context).size.width < desktop;
  }
  
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktop;
  }
  
  static bool isLargeDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= largeDesktop;
  }
  
  /// الحصول على نوع الجهاز كـ Enum
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    if (width >= largeDesktop) return DeviceType.largeDesktop;
    if (width >= desktop) return DeviceType.desktop;
    if (width >= tablet) return DeviceType.tablet;
    return DeviceType.mobile;
  }
}

/// أنواع الأجهزة
enum DeviceType {
  mobile,
  tablet,
  desktop,
  largeDesktop,
}
