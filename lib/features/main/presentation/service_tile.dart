import 'package:flutter/material.dart';

class ServiceTile extends StatelessWidget {
  ServiceTile({
    this.iconPath,
    this.title,
    this.subtitle,
    this.onTap,
  });

  final String? iconPath, title, subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: AlignmentDirectional.center,
        child: ListTile(
          leading: Container(
            width: 36,
            child: Center(
              child: Icon(Icons.delivery_dining),
            ),
          ),
          title: Text(title!),
          subtitle: Text(subtitle!),
          onTap: onTap,
        ),
      ),
    );
  }
}
