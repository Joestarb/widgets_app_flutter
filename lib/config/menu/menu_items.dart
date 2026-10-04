import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

final List<MenuItem> appMenuItems = [
  MenuItem(
    title: 'Botones',
    subtitle: 'Varios Botones',
    link: '/buttons',
    icon: Icons.smart_button,
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'ProgressIndicators',
    subtitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.star_border,
  ),
  MenuItem(
    title: 'SnackBar y dialogs',
    subtitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.info,
  ),
  MenuItem(
    title: 'Animated Container',
    subtitle: 'animacion de contenedores flutter',
    link: '/animated',
    icon: Icons.animation,
  ),
  MenuItem(
    title: 'UI Controls + Tiles',
    subtitle: 'Controles y listados',
    link: '/ui-controls',
    icon: Icons.list,
  ),
];
