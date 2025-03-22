import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ReadingDialogInfoWidget extends StatelessWidget {
  const ReadingDialogInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.theme.dialogTheme.backgroundColor,
      title: Text("Cara Menggunakan Aplikasi",
          style: context.theme.textTheme.titleLarge),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("1. Taipkan suku kata di ruang teks."),
          Text(
              "2. Tekan 'Seterusnya' untuk menaipkan suku kata yang seterusnya."),
          Text(
              "3. Tekan 'Mainkan sebutan perkataan' untuk mendengar sebutan perkataan yang dihasilkan."),
          Text(
              "4. Tekan 'Padam' untuk memadam suku kata atau perkataan yang dibentuk."),
          Text(
              "5. Tekan suku kata yang dipaparkan di papan hitam untuk mendengar sebutan suku kata tersebut."),
        ],
      ),
      actions: [
        FilledButton(
            onPressed: () => Navigator.pop(context), child: const Text("Tutup")),
      ],
    );
  }
}
