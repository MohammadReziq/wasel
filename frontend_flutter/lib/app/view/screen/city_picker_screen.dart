import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frontend_flutter/app/core/theme/app_colors.dart';
import 'package:frontend_flutter/app/controller/onboarding/onboarding_controller.dart';
import 'package:frontend_flutter/app/data/dataSource/cities_data.dart';

/// City Picker Screen for manual location selection
/// Shows countries with expandable city lists
class CityPickerScreen extends StatefulWidget {
  const CityPickerScreen({super.key});

  @override
  State<CityPickerScreen> createState() => _CityPickerScreenState();
}

class _CityPickerScreenState extends State<CityPickerScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  int? _expandedCountryIndex;

  bool get isArabic =>
      Get.locale?.languageCode == 'ar' ||
      Localizations.localeOf(context).languageCode == 'ar';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.bgLight,
          appBar: _buildAppBar(),
          body: Column(
            children: [
              // Search bar
              _buildSearchBar(),
              // Countries list
              Expanded(
                child: _buildCountriesList(controller),
              ),
            ],
          ),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.whiteCard,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
        onPressed: () => Get.back(),
      ),
      title: Text(
        isArabic ? 'اختر مدينتك' : 'Select Your City',
        style: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildSearchBar() {
    return Container(
      color: AppColors.whiteCard,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.bgLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {
              _searchQuery = value.toLowerCase();
            });
          },
          decoration: InputDecoration(
            hintText: isArabic
                ? 'ابحث عن دولة أو مدينة...'
                : 'Search for a country or city...',
            hintStyle: TextStyle(color: AppColors.textThird),
            prefixIcon: Icon(Icons.search, color: AppColors.textThird),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCountriesList(OnboardingController controller) {
    // Filter countries and cities based on search
    final filteredCountries = _getFilteredCountries();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredCountries.length,
      itemBuilder: (context, index) {
        final country = filteredCountries[index];
        final isExpanded = _expandedCountryIndex == index;

        return _buildCountryCard(country, index, isExpanded, controller);
      },
    );
  }

  List<CountryModel> _getFilteredCountries() {
    if (_searchQuery.isEmpty) {
      return countriesData;
    }

    return countriesData.where((country) {
      // Check country name
      if (country.nameAr.toLowerCase().contains(_searchQuery) ||
          country.nameEn.toLowerCase().contains(_searchQuery)) {
        return true;
      }
      // Check cities
      return country.cities.any((city) =>
          city.nameAr.toLowerCase().contains(_searchQuery) ||
          city.nameEn.toLowerCase().contains(_searchQuery));
    }).toList();
  }

  Widget _buildCountryCard(
    CountryModel country,
    int index,
    bool isExpanded,
    OnboardingController controller,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: AppColors.whiteCard,
      child: Column(
        children: [
          // Country header
          InkWell(
            onTap: () {
              setState(() {
                _expandedCountryIndex = isExpanded ? null : index;
              });
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Flag
                  Text(
                    country.flag,
                    style: const TextStyle(fontSize: 28),
                  ),
                  const SizedBox(width: 16),
                  // Country name
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isArabic ? country.nameAr : country.nameEn,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          isArabic
                              ? '${country.cities.length} مدن'
                              : '${country.cities.length} cities',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textThird,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Expand icon
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Cities list (expanded)
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: _buildCitiesList(country, controller),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }

  Widget _buildCitiesList(
    CountryModel country,
    OnboardingController controller,
  ) {
    return Column(
      children: [
        Divider(color: AppColors.border, height: 1),
        ...country.cities.map((city) => _buildCityTile(city, controller)),
      ],
    );
  }

  Widget _buildCityTile(CityModel city, OnboardingController controller) {
    return InkWell(
      onTap: () {
        final cityName = isArabic ? city.nameAr : city.nameEn;
        final countryName = isArabic ? city.countryAr : city.countryEn;
        controller.saveSelectedCity(cityName, countryName);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            const SizedBox(width: 44), // Align with country name
            Icon(
              Icons.location_city_rounded,
              size: 20,
              color: AppColors.primary500,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                isArabic ? city.nameAr : city.nameEn,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppColors.textThird,
            ),
          ],
        ),
      ),
    );
  }
}
