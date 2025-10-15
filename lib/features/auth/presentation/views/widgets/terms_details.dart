import 'package:flutter/material.dart';

class TermsDetails extends StatelessWidget {
  const TermsDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      // --- PLACE YOUR FULL TERMS TEXT HERE ---
      'Welcome to Curely. This agreement outlines the terms and conditions ('
          ''''Terms') governing your use of our mobile application, which provides '''
          'services related to managing patient prescriptions, medical tests, and '
          'related health data.\n\n'
          '1. Data Privacy: Your medical data is highly sensitive. We comply with '
          'all applicable privacy laws. Your data is encrypted and never shared '
          'without your explicit consent, except as required by law.\n\n'
          '2. Medical Disclaimer: Curely is NOT a substitute for professional medical '
          'advice, diagnosis, or treatment. Always seek the advice of your physician '
          'or other qualified health provider with any questions you may have regarding '
          'a medical condition.\n\n'
          '3. Prescription Accuracy: While we strive for accuracy, you are responsible '
          'for verifying all digital prescription details against the original script '
          'issued by your physician.\n\n'
          '4. User Responsibility: You are responsible for maintaining the confidentiality '
          'of your account login information and for all activities that occur under your '
          'account.\n\n'
          'By clicking "I Accept," you acknowledge that you have read and agree to these terms.\n\n'
      // Repeat text to make it long enough to scroll
          '-- Additional Clauses --\n'
          '• Service Availability: Service uptime is guaranteed at 99.9% excluding planned maintenance.\n'
          '• Termination: We reserve the right to terminate access for misuse.\n'
          '• Governing Law: This agreement is governed by the laws of [Your Jurisdiction].\n\n'
          'Thank you for choosing Curely.',
      style: TextStyle(fontSize: 14.0, color: Colors.black87),
    );
  }
}