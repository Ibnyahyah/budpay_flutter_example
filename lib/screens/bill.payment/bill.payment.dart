import 'package:example/widgets/custom_template.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'components/airtime/airtimeProvider.dart';
import 'components/airtime/airtime_top_form.dart';
import 'components/electricity/recahrgeElectricity.dart';
import 'components/electricity/validateElectricty.dart';
import 'components/internet/getDataPlan.dart';
import 'components/tv/getTvs.dart';
import 'components/tv/getTvsPackages.dart';
import 'components/internet/internetProvider.dart';
import 'components/internet/internet_top_form.dart';
import 'components/tv/validateTv.dart';
import 'components/electricity/electricityProvider.dart';

class BillPaymentScreen extends StatelessWidget {
  BillPaymentScreen({super.key});
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    return CustomTemplate(
      navTitle: "Bill Payment",
      children: [
        AirtimeProvider(),
        const SizedBox(height: 20),
        AirtimeTopForm(),
        const SizedBox(height: 20),
        GetInternetProvider(),
        const SizedBox(height: 20),
        GetAllDataPlan(),
        const SizedBox(height: 20),
        InternetTopForm(),
        const SizedBox(height: 20),
        GetTVs(),
        const SizedBox(height: 20),
        GetTvsPackages(),
        const SizedBox(height: 20),
        ValidateTv(),
        const SizedBox(height: 20),
        getElectricityProvider(),
        const SizedBox(height: 20),
        ValidateElectricity(),
        const SizedBox(height: 20),
        RechargeElectricity(),
        const SizedBox(height: 20),
      ],
    );
  }
}
