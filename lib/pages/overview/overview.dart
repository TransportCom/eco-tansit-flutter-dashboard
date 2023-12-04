import 'package:admin_dashboard/constants/controllers.dart';
import 'package:admin_dashboard/helpers/responsiveness.dart';
import 'package:admin_dashboard/pages/overview/widgets/top_selling_products.dart';
import 'package:admin_dashboard/pages/overview/widgets/cards_large.dart';
import 'package:admin_dashboard/pages/overview/widgets/cards_medium.dart';
import 'package:admin_dashboard/pages/overview/widgets/cards_small.dart';
import 'package:admin_dashboard/pages/overview/widgets/revenue_section_large.dart';
import 'package:admin_dashboard/pages/overview/widgets/revenue_section_small.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                if (ResponsiveWidget.isLargeScreen(context))
                  const OverviewCardsLargeScreen(),
                if (ResponsiveWidget.isCustomScreen(context))
                  const OverviewCardsMediumScreen(),
                if (ResponsiveWidget.isSmallScreen(context) ||
                    ResponsiveWidget.isMediumScreen(context))
                  const OverviewCardsSmallScreen(),
                if (!ResponsiveWidget.isSmallScreen(context))
                  const RevenueSectionLarge(),
                if (ResponsiveWidget.isSmallScreen(context))
                  const RevenueSectionSmall(),
                // const AvailableDriversTable(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
