import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Sin elevación (0.0)'},
  {'elevation': 2.0, 'label': 'Elevación baja (2.0)'},
  {'elevation': 4.0, 'label': 'Elevación media (4.0)'},
  {'elevation': 6.0, 'label': 'Elevación intermedia (6.0)'},
  {'elevation': 8.0, 'label': 'Elevación alta (8.0)'},
  {'elevation': 10.0, 'label': 'Elevación máxima (10.0)'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarjetas Material 3')),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Tarjetas Elevadas
          const _SectionHeader(
            title: 'Tarjetas Elevadas',
            subtitle: 'Usa sombras para simular elevación y profundidad física',
            icon: Icons.layers_outlined,
          ),
          ...cards.map(
            (card) =>
                _CardType1(elevation: card['elevation'], label: card['label']),
          ),

          // 2. Tarjetas con Borde
          const _SectionHeader(
            title: 'Tarjetas con Borde',
            subtitle: 'Diseño plano delimitado por un borde sutil',
            icon: Icons.crop_square_rounded,
          ),
          ...cards.map(
            (card) =>
                _CardType2(elevation: card['elevation'], label: card['label']),
          ),

          // 3. Tarjetas Rellenas
          const _SectionHeader(
            title: 'Tarjetas Rellenas',
            subtitle: 'Color de superficie tonal continuo sin sombra dura',
            icon: Icons.palette_outlined,
          ),
          ...cards.map(
            (card) =>
                _CardType3(elevation: card['elevation'], label: card['label']),
          ),

          // 4. Tarjetas con Imagen
          const _SectionHeader(
            title: 'Tarjetas con Imagen',
            subtitle: 'Contenido multimedia con superposición visual',
            icon: Icons.image_outlined,
          ),
          ...cards.map(
            (card) => _CardType4(
              elevation: card['elevation'],
              label: card['label'],
            ),
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}

/// Encabezado descriptivo para separar las variantes de tarjeta
class _SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _SectionHeader({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12, left: 4, right: 4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: colors.onPrimaryContainer),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: colors.outline),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Tipo 1: Tarjetas tradicionales con elevación / sombra
class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 10, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.layers_outlined,
                        size: 14,
                        color: colors.onPrimaryContainer,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Elevación: ${elevation.toStringAsFixed(1)}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: colors.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert_rounded),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tipo 2: Tarjetas con borde perimetral (Outlined)
class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors.outlineVariant, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 10, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colors.secondaryContainer.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: colors.outline.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.crop_square_rounded,
                        size: 14,
                        color: colors.secondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Borde • ${elevation.toStringAsFixed(1)} dp',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: colors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert_rounded),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tipo 3: Tarjetas rellenas tonales (Filled)
class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: elevation,
      color: colors.surfaceContainerHighest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 10, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.palette_outlined,
                        size: 14,
                        color: colors.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Tonal • ${elevation.toStringAsFixed(1)} dp',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert_rounded),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tipo 4: Tarjetas con contenido de imagen y gradiente
class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final imageIndex = ((elevation * 10).toInt() + 100);

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/$imageIndex/600/280',
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                height: 180,
                color: Colors.black12,
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 180,
                color: Colors.black12,
                child: const Center(
                  child: Icon(Icons.image_not_supported_outlined, size: 40),
                ),
              );
            },
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.3),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.8),
                  ],
                  stops: const [0.0, 0.4, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            bottom: 14,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${elevation.toStringAsFixed(1)} dp',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
