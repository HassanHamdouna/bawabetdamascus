import 'package:bawabetdamascus/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:bawabetdamascus/gen_l10n/app_localization.dart';

import '../../widgets/auth/role_card.dart';

class SystemManagerScreen extends StatefulWidget {
  const SystemManagerScreen({super.key});

  @override
  State<SystemManagerScreen> createState() => _SystemManagerScreenState();
}

class _SystemManagerScreenState extends State<SystemManagerScreen> {
  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.system_manager),
      ),
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  RoleCard(
                    title: lang.manage_employees,
                    icon: Icons.perm_contact_cal_outlined,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.userManagementScreen);
                    },
                  ),
                  RoleCard(
                    title: lang.manage_menu,
                    icon: Icons.food_bank,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.menuManagementScreen);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
