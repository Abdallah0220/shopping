import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        'question': 'How can I track my order?',
        'answer':
            'You can track your order from the "My Orders" section in your profile.',
      },
      {
        'question': 'What payment methods do you accept?',
        'answer':
            'We accept credit cards, debit cards, PayPal, and cash on delivery.',
      },
      {
        'question': 'How can I return a product?',
        'answer':
            'You can request a return within 14 days of delivery from the "My Orders" section.',
      },
      {
        'question': 'Do you offer international shipping?',
        'answer':
            'Yes, we ship to most countries worldwide. Shipping costs vary by destination.',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Help Center')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...faqs.map(
              (faq) => ExpansionTile(
                title: Text(faq['question'] as String),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(faq['answer'] as String),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 18,
                backgroundColor: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('Email Us'),
                      subtitle: const Text('support@shoppingapp.com'),
                      onTap: () {},
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('Call Us'),
                      subtitle: const Text('+20123456789'),
                      onTap: () {},
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.chat),
                      title: const Text('Live Chat'),
                      subtitle: const Text('Available 24/7'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
