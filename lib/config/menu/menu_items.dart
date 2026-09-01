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
    title: 'Contador',
    subtitle: 'Incrementar y decrementar',
    link: '/buttons',
    icon: Icons.smart_button,
  ),
];