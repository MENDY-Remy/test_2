// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:a_dashboard_staring/responsive/responsive.dart';
import 'package:a_dashboard_staring/screens/dashbord/dashboard_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controllers/MenuController.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuControlller>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          //---
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //--
            if (Responsive.isDesktop(context))
              const Expanded(
                //---flex par defaut = 1
                //-- prend 1/6 de l'&cran
                child: SideMenu(),
              ),
            //--5/6 de l'écran
            const Expanded(
              flex: 5, //--5/6 de l'écran
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListeWidget extends StatelessWidget {
  //
  final String title, svgSrc;
  final VoidCallback press;

  //
  const DrawerListeWidget({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        //
        press;
      },
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
