import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'ProgressIndicators',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'SnackBar y Dialogs',
      subTitle: 'Indicadores en pantalla ',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animate container',
      subTitle: 'Stateful widget animate',
      link: '/animated',
      icon: Icons.check_box_outline_blank),
  MenuItem(
      title: 'UI Controls',
      subTitle: 'Una serie de controles de Flutter',
      link: '/ui-controls',
      icon: Icons.car_rental_sharp),
  MenuItem(
      title: 'Introduccion a la aplicacion',
      subTitle: 'Pequeño tutorial de la aplicacion',
      link: '/tutorial',
      icon: Icons.accessible_rounded),
  MenuItem(
      title: 'Infinite Scroll y Pull',
      subTitle: 'Listas infinitas y pull to refresh',
      link: '/infinite-scroll',
      icon: Icons.list_alt_rounded),
  MenuItem(
      title: 'Counter',
      subTitle: 'Pues si, un contador',
      link: '/counter',
      icon: Icons.calculate_outlined),
  MenuItem(
      title: 'Cambiar tema',
      subTitle: 'Cambia el tema de la aplicacion',
      link: '/theme-changer',
      icon: Icons.color_lens_outlined),
];
