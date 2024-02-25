import 'package:flutter/material.dart';
import 'package:flutter_contact_app/app/routes/app_pages.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 65,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () => Navigator.pushNamed(context, Routes.ADD),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
