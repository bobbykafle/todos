import 'package:flutter/material.dart';
import 'package:to_do_app/ThemeChange/theme_color.dart';
import 'package:to_do_app/widgets/app_text.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.background(context),
      appBar: AppBar(
        title: const Text('About App'),
        backgroundColor: ThemeColor.background(context),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: ThemeColor.cardBg(context),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'To-Do App',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: ThemeColor.text(context),
              ),
              const SizedBox(height: 10),
              AppText(
                text: 'Version 1.0.0',
                fontSize: 14,
                color: ThemeColor.secondaryText(context),
              ),
              const SizedBox(height: 20),
              AppText(
                text:
                    'To-Do App helps you organize your daily tasks, stay focused, and track your progress.\n\n'
                    'With a clean design, light & dark themes, and simple task management, '
                    'this app is built to make your day more productive.',
                fontSize: 16,
                color: ThemeColor.text(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
