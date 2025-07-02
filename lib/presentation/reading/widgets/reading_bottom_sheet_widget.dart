import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:readingapps/constants.dart';
import 'package:readingapps/extensions.dart';

class ReadingBottomSheetWidget extends StatelessWidget {
  ReadingBottomSheetWidget({super.key});

  final List<CountryEnum> countries = [
    CountryEnum.malaysia,
    CountryEnum.english_uk,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 8,
          children: [
            Text(
              context.loc.general_select_language.capitalize!,
              style: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final CountryEnum countryEnum = countries[index];
                    final String languageCode = countryEnum.languageCode;
                    final String country = countryEnum.country;

                    return ListTile(
                      onTap: () => Navigator.pop(context, countryEnum),
                      leading: CountryFlag.fromLanguageCode(
                        languageCode,
                        shape: const Circle(),
                      ),
                      title: Text(country),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                  itemCount: countries.length),
            ),
          ],
        ),
      ),
    );
  }
}
