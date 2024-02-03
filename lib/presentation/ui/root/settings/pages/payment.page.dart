import 'package:flutter/material.dart';

import '../../../../widgets/app_appbar.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        showAction: true,
      ),
      body: Center(
        child: Text('Payment Page'),
      ),
    );
  }
}
