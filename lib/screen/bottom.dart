import 'package:coffeshop/widgets/botnav.dart';
import 'package:coffeshop/controllers/main_provider.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return FloatingNavbar(
          selectedBackgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          // elevation: 8,
          width: 308,
          // unselectedItemColor: Colors.transparent,
          backgroundColor: const Color.fromARGB(255, 97, 62, 49),
          borderRadius: 16,
          currentIndex: mainScreenNotifier.pageIndex,
          onTap: (val) {
            mainScreenNotifier.pageIndex = val;
            print(mainScreenNotifier.pageIndex);
          },
          items: [
            FloatingNavbarItem(
                // onTap: () {
                //   mainScreenNotifier.pageIndex = 0;
                // },
                icon: mainScreenNotifier.pageIndex == 0
                    ? Icons.home
                    : Icons.home_outlined),
            FloatingNavbarItem(
                // onTap: () {
                //   mainScreenNotifier.pageIndex = 0;
                // },
                icon: mainScreenNotifier.pageIndex == 1
                    ? Icons.favorite
                    : Icons.favorite_border),
            FloatingNavbarItem(
                // onTap: () {
                //   mainScreenNotifier.pageIndex = 0;
                // },
                icon: mainScreenNotifier.pageIndex == 2
                    ? Icons.person
                    : Icons.person_outlined),
          ],
        );
      },
    );
  }
}
