/// Cities Data for Manual Selection
/// Organized by country with Arabic/English names

class CityModel {
  final String nameAr;
  final String nameEn;
  final String countryAr;
  final String countryEn;
  final double latitude;
  final double longitude;

  const CityModel({
    required this.nameAr,
    required this.nameEn,
    required this.countryAr,
    required this.countryEn,
    required this.latitude,
    required this.longitude,
  });
}

class CountryModel {
  final String nameAr;
  final String nameEn;
  final String flag;
  final List<CityModel> cities;

  const CountryModel({
    required this.nameAr,
    required this.nameEn,
    required this.flag,
    required this.cities,
  });
}

/// List of countries with their cities
final List<CountryModel> countriesData = [
  // فلسطين
  CountryModel(
    nameAr: 'فلسطين',
    nameEn: 'Palestine',
    flag: '🇵🇸',
    cities: [
      CityModel(
        nameAr: 'القدس',
        nameEn: 'Jerusalem',
        countryAr: 'فلسطين',
        countryEn: 'Palestine',
        latitude: 31.7683,
        longitude: 35.2137,
      ),
      CityModel(
        nameAr: 'غزة',
        nameEn: 'Gaza',
        countryAr: 'فلسطين',
        countryEn: 'Palestine',
        latitude: 31.5,
        longitude: 34.4667,
      ),
      CityModel(
        nameAr: 'رام الله',
        nameEn: 'Ramallah',
        countryAr: 'فلسطين',
        countryEn: 'Palestine',
        latitude: 31.9038,
        longitude: 35.2034,
      ),
      CityModel(
        nameAr: 'نابلس',
        nameEn: 'Nablus',
        countryAr: 'فلسطين',
        countryEn: 'Palestine',
        latitude: 32.2211,
        longitude: 35.2544,
      ),
      CityModel(
        nameAr: 'الخليل',
        nameEn: 'Hebron',
        countryAr: 'فلسطين',
        countryEn: 'Palestine',
        latitude: 31.5326,
        longitude: 35.0998,
      ),
      CityModel(
        nameAr: 'بيت لحم',
        nameEn: 'Bethlehem',
        countryAr: 'فلسطين',
        countryEn: 'Palestine',
        latitude: 31.7054,
        longitude: 35.2024,
      ),
      CityModel(
        nameAr: 'جنين',
        nameEn: 'Jenin',
        countryAr: 'فلسطين',
        countryEn: 'Palestine',
        latitude: 32.4607,
        longitude: 35.3003,
      ),
      CityModel(
        nameAr: 'طولكرم',
        nameEn: 'Tulkarm',
        countryAr: 'فلسطين',
        countryEn: 'Palestine',
        latitude: 32.3104,
        longitude: 35.0286,
      ),
    ],
  ),
  // السعودية
  CountryModel(
    nameAr: 'السعودية',
    nameEn: 'Saudi Arabia',
    flag: '🇸🇦',
    cities: [
      CityModel(
        nameAr: 'مكة المكرمة',
        nameEn: 'Mecca',
        countryAr: 'السعودية',
        countryEn: 'Saudi Arabia',
        latitude: 21.4225,
        longitude: 39.8262,
      ),
      CityModel(
        nameAr: 'المدينة المنورة',
        nameEn: 'Medina',
        countryAr: 'السعودية',
        countryEn: 'Saudi Arabia',
        latitude: 24.4672,
        longitude: 39.6024,
      ),
      CityModel(
        nameAr: 'الرياض',
        nameEn: 'Riyadh',
        countryAr: 'السعودية',
        countryEn: 'Saudi Arabia',
        latitude: 24.7136,
        longitude: 46.6753,
      ),
      CityModel(
        nameAr: 'جدة',
        nameEn: 'Jeddah',
        countryAr: 'السعودية',
        countryEn: 'Saudi Arabia',
        latitude: 21.4858,
        longitude: 39.1925,
      ),
      CityModel(
        nameAr: 'الدمام',
        nameEn: 'Dammam',
        countryAr: 'السعودية',
        countryEn: 'Saudi Arabia',
        latitude: 26.3927,
        longitude: 49.9777,
      ),
    ],
  ),
  // مصر
  CountryModel(
    nameAr: 'مصر',
    nameEn: 'Egypt',
    flag: '🇪🇬',
    cities: [
      CityModel(
        nameAr: 'القاهرة',
        nameEn: 'Cairo',
        countryAr: 'مصر',
        countryEn: 'Egypt',
        latitude: 30.0444,
        longitude: 31.2357,
      ),
      CityModel(
        nameAr: 'الإسكندرية',
        nameEn: 'Alexandria',
        countryAr: 'مصر',
        countryEn: 'Egypt',
        latitude: 31.2001,
        longitude: 29.9187,
      ),
      CityModel(
        nameAr: 'الجيزة',
        nameEn: 'Giza',
        countryAr: 'مصر',
        countryEn: 'Egypt',
        latitude: 30.0131,
        longitude: 31.2089,
      ),
      CityModel(
        nameAr: 'أسوان',
        nameEn: 'Aswan',
        countryAr: 'مصر',
        countryEn: 'Egypt',
        latitude: 24.0889,
        longitude: 32.8998,
      ),
    ],
  ),
  // الأردن
  CountryModel(
    nameAr: 'الأردن',
    nameEn: 'Jordan',
    flag: '🇯🇴',
    cities: [
      CityModel(
        nameAr: 'عمان',
        nameEn: 'Amman',
        countryAr: 'الأردن',
        countryEn: 'Jordan',
        latitude: 31.9454,
        longitude: 35.9284,
      ),
      CityModel(
        nameAr: 'إربد',
        nameEn: 'Irbid',
        countryAr: 'الأردن',
        countryEn: 'Jordan',
        latitude: 32.5568,
        longitude: 35.8469,
      ),
      CityModel(
        nameAr: 'الزرقاء',
        nameEn: 'Zarqa',
        countryAr: 'الأردن',
        countryEn: 'Jordan',
        latitude: 32.0728,
        longitude: 36.0880,
      ),
      CityModel(
        nameAr: 'العقبة',
        nameEn: 'Aqaba',
        countryAr: 'الأردن',
        countryEn: 'Jordan',
        latitude: 29.5267,
        longitude: 35.0078,
      ),
    ],
  ),
  // الإمارات
  CountryModel(
    nameAr: 'الإمارات',
    nameEn: 'UAE',
    flag: '🇦🇪',
    cities: [
      CityModel(
        nameAr: 'دبي',
        nameEn: 'Dubai',
        countryAr: 'الإمارات',
        countryEn: 'UAE',
        latitude: 25.2048,
        longitude: 55.2708,
      ),
      CityModel(
        nameAr: 'أبوظبي',
        nameEn: 'Abu Dhabi',
        countryAr: 'الإمارات',
        countryEn: 'UAE',
        latitude: 24.4539,
        longitude: 54.3773,
      ),
      CityModel(
        nameAr: 'الشارقة',
        nameEn: 'Sharjah',
        countryAr: 'الإمارات',
        countryEn: 'UAE',
        latitude: 25.3463,
        longitude: 55.4209,
      ),
    ],
  ),
  // الكويت
  CountryModel(
    nameAr: 'الكويت',
    nameEn: 'Kuwait',
    flag: '🇰🇼',
    cities: [
      CityModel(
        nameAr: 'مدينة الكويت',
        nameEn: 'Kuwait City',
        countryAr: 'الكويت',
        countryEn: 'Kuwait',
        latitude: 29.3759,
        longitude: 47.9774,
      ),
    ],
  ),
  // قطر
  CountryModel(
    nameAr: 'قطر',
    nameEn: 'Qatar',
    flag: '🇶🇦',
    cities: [
      CityModel(
        nameAr: 'الدوحة',
        nameEn: 'Doha',
        countryAr: 'قطر',
        countryEn: 'Qatar',
        latitude: 25.2854,
        longitude: 51.5310,
      ),
    ],
  ),
  // لبنان
  CountryModel(
    nameAr: 'لبنان',
    nameEn: 'Lebanon',
    flag: '🇱🇧',
    cities: [
      CityModel(
        nameAr: 'بيروت',
        nameEn: 'Beirut',
        countryAr: 'لبنان',
        countryEn: 'Lebanon',
        latitude: 33.8938,
        longitude: 35.5018,
      ),
      CityModel(
        nameAr: 'طرابلس',
        nameEn: 'Tripoli',
        countryAr: 'لبنان',
        countryEn: 'Lebanon',
        latitude: 34.4332,
        longitude: 35.8497,
      ),
    ],
  ),
  // سوريا
  CountryModel(
    nameAr: 'سوريا',
    nameEn: 'Syria',
    flag: '🇸🇾',
    cities: [
      CityModel(
        nameAr: 'دمشق',
        nameEn: 'Damascus',
        countryAr: 'سوريا',
        countryEn: 'Syria',
        latitude: 33.5138,
        longitude: 36.2765,
      ),
      CityModel(
        nameAr: 'حلب',
        nameEn: 'Aleppo',
        countryAr: 'سوريا',
        countryEn: 'Syria',
        latitude: 36.2021,
        longitude: 37.1343,
      ),
    ],
  ),
  // العراق
  CountryModel(
    nameAr: 'العراق',
    nameEn: 'Iraq',
    flag: '🇮🇶',
    cities: [
      CityModel(
        nameAr: 'بغداد',
        nameEn: 'Baghdad',
        countryAr: 'العراق',
        countryEn: 'Iraq',
        latitude: 33.3152,
        longitude: 44.3661,
      ),
      CityModel(
        nameAr: 'البصرة',
        nameEn: 'Basra',
        countryAr: 'العراق',
        countryEn: 'Iraq',
        latitude: 30.5085,
        longitude: 47.7804,
      ),
      CityModel(
        nameAr: 'أربيل',
        nameEn: 'Erbil',
        countryAr: 'العراق',
        countryEn: 'Iraq',
        latitude: 36.1901,
        longitude: 44.0089,
      ),
    ],
  ),
  // تركيا
  CountryModel(
    nameAr: 'تركيا',
    nameEn: 'Turkey',
    flag: '🇹🇷',
    cities: [
      CityModel(
        nameAr: 'إسطنبول',
        nameEn: 'Istanbul',
        countryAr: 'تركيا',
        countryEn: 'Turkey',
        latitude: 41.0082,
        longitude: 28.9784,
      ),
      CityModel(
        nameAr: 'أنقرة',
        nameEn: 'Ankara',
        countryAr: 'تركيا',
        countryEn: 'Turkey',
        latitude: 39.9334,
        longitude: 32.8597,
      ),
      CityModel(
        nameAr: 'إزمير',
        nameEn: 'Izmir',
        countryAr: 'تركيا',
        countryEn: 'Turkey',
        latitude: 38.4237,
        longitude: 27.1428,
      ),
    ],
  ),
];
