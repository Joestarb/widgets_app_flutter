import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final Slides = <SlideInfo>[
  SlideInfo(
    'Compra con tarjeta',
    'Maga in asec, exea in eu dolor incididunt sit.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Compra con tarjeta',
    'Maga in asec, exea in eu dolor incididunt sit.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Compra con tarjeta',
    'Maga in asec, exea in eu dolor incididunt sit.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: Slides.asMap().entries
                .map(
                  (entry) => _Slide(
                    title: entry.value.title,
                    caption: entry.value.caption,
                    imageUrl: entry.value.imageUrl,
                    isLast: entry.key == Slides.length - 1,
                  ),
                )
                .toList(),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            right: 30,
            child: AnimatedBuilder(
              animation: pageViewController,
              builder: (context, child) {
                final page = pageViewController.hasClients
                    ? (pageViewController.page ?? 0.0)
                    : 0.0;
                final progress = ((page + 1) / Slides.length).clamp(0.0, 1.0);

                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(value: progress, minHeight: 8),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  final bool isLast;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption),
            if (isLast) ...[
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Salir'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
