import 'package:flutter/material.dart';


class ListItem {
  final String title;
  final String svgUrl;
  final VoidCallback onTap;

  ListItem(this.title, this.svgUrl, this.onTap);
}

