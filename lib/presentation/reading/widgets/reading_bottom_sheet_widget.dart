import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:readingapps/constants.dart';

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
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Select Language",
              style: context.textTheme.titleMedium,
            ),
            ...countries.map((country) => ListTile(
                  onTap: () => Navigator.pop(context, country),
                  leading: CountryFlag.fromLanguageCode(
                    country.languageCode,
                    shape: const Circle(),
                  ),
                  title: Text(country.country),
                )),
          ],
        ),
      ),
    );
  }
}
