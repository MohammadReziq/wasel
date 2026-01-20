import 'package:flutter/material.dart';
import 'package:frontend_flutter/app/core/theme/app_colors.dart';
import 'package:frontend_flutter/app/core/theme/app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      // المعنى: أنت تطلب من Flutter تفعيل نظام تصميم Google الحديث (Material 3).
      useMaterial3: true,
      //       المعنى: التطبيق يعمل في الوضع الفاتح (Light Mode).

      // النتيجة: الخلفيات ستكون فاتحة والنصوص غامقة بشكل افتراضي.
      brightness: Brightness.light,
      //       1. الألوان الأساسية (Primary & OnPrimary)
      // primary: هو "بطل" القصة، اللون الذي يمثل هوية تطبيقك (براندك). يظهر في الأزرار الكبيرة والعناصر التي تريد لفت الانتباه إليها.

      // onPrimary: هو اللون الذي يضمن قراءة النصوص. إذا كان الزر لونه primary (مثلاً كحلي)، فالنص الذي بداخله سيكون onPrimary (مثلاً أبيض).

      // 2. الألوان الثانوية (Secondary & OnSecondary)
      // secondary: لون مكمل يُستخدم للعناصر الأقل أهمية من الأساسية، مثل الفلاتر، الأزرار الجانبية، أو أيقونات التبديل.

      // onSecondary: هو اللون المخصص للنصوص والأيقونات التي تظهر فوق المساحات الملونة باللون الثانوي.

      // 3. ألوان الأسطح (Surface & OnSurface)
      // surface: هذا اللون يغطي "مساحات" التطبيق، مثل خلفية البطاقات (Cards)، القوائم المنسدلة (Menus)، والصفحات.

      // onSurface: هذا هو "ملك النصوص". هو اللون الذي ستستخدمه لكتابة العناوين والمقالات فوق خلفية التطبيق، وعادةً ما يكون أسود أو رمادي غامق جداً في الوضع الفاتح.

      // 4. ألوان الأخطاء (Error & OnError)
      // error: اللون المخصص للتنبيهات والمشاكل، مثل وضع إطار أحمر حول حقل نصي فارغ.

      // onError: اللون الذي يكتب به نص رسالة الخطأ ليكون واضحاً فوق لون الخطأ الأساسي.

      // 5. لمسة الارتفاع (SurfaceTint)
      // surfaceTint: في التصميم الحديث، عندما ترتفع البطاقة عن الخلفية، يضيف النظام "صبغة" خفيفة فوقها. وضعها كـ transparent يعني أنك تريد الحفاظ على لون السطح الأصلي كما هو دون أي صبغة إضافية من النظام.
      colorScheme: ColorScheme.light(
        primary: AppColors.primary500,
        onPrimary: AppColors.white,
        primaryContainer: AppColors.primary100,
        onPrimaryContainer: AppColors.primary900,
        secondary: AppColors.secondary500,
        onSecondary: AppColors.textPrimary,
        secondaryContainer: AppColors.secondary100,
        onSecondaryContainer: AppColors.secondary900,
        error: AppColors.error500,
        onError: AppColors.white,
        errorContainer: AppColors.error100,
        onErrorContainer: AppColors.error900,
        surface: AppColors.whiteCard,
        onSurface: AppColors.textPrimary,
        surfaceContainerHighest: AppColors.bgLight,
        outline: AppColors.border,
        outlineVariant: AppColors.grey200,
      ),
      //       scaffoldBackgroundColor: هو المكان الذي تحدد فيه لون "اللوحة" أو "الخلفية" التي تُبنى عليها كل صفحة.

      // في Flutter، أغلب الصفحات تبدأ بـ Scaffold. هذا السطر يخبر فلاتر: "أي صفحة تبدأ بـ Scaffold اجعل خلفيتها تلقائياً بهذا اللون".

      // لماذا نستخدم AppColors.background؟
      // بدلاً من كتابة Colors.white يدوياً في كل صفحة، أنت تشير إلى متغير مركزي.

      // الفائدة: إذا قررت لاحقاً تغيير خلفية التطبيق من الأبيض الصريح إلى "رمادي فاتح جداً" ليرتاح نظر المستخدم، تغيره في مكان واحد فقط (AppColors) وسيتعدل في كل التطبيق فوراً.
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(),
      cardTheme: CardThemeData(),
      inputDecorationTheme: InputDecorationTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        displaySmall: AppTextStyles.displaySmall,
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineSmall: AppTextStyles.headlineSmall,
        titleLarge: AppTextStyles.titleLarge,
        titleMedium: AppTextStyles.titleMedium,
        titleSmall: AppTextStyles.titleSmall,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primary400,
        onPrimary: AppColors.white,
        primaryContainer: AppColors.primary800,
        onPrimaryContainer: AppColors.primary100,
        secondary: AppColors.secondary400,
        onSecondary: AppColors.textPrimary,
        secondaryContainer: AppColors.secondary800,
        onSecondaryContainer: AppColors.secondary100,
        error: AppColors.error400,
        onError: AppColors.white,
        errorContainer: AppColors.error800,
        onErrorContainer: AppColors.error100,
        surface: AppColors.darkSurface,
        onSurface: AppColors.white,
        surfaceContainerHighest: AppColors.darkCard,
        outline: AppColors.darkBorder,
        outlineVariant: AppColors.grey700,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        displaySmall: AppTextStyles.displaySmall,
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineSmall: AppTextStyles.headlineSmall,
        titleLarge: AppTextStyles.titleLarge,
        titleMedium: AppTextStyles.titleMedium,
        titleSmall: AppTextStyles.titleSmall,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        // labelSmall:
      ),
    );
  }
}
