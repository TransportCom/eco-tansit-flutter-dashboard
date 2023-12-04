import 'package:admin_dashboard/pages/stations/widgets/stations_table.dart';
import 'package:flutter/material.dart';

class StationsPage extends StatelessWidget {
  const StationsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Your commented-out Obx code

        Expanded(
          child: ListView(
            children: [
              Container(
                color: Colors.green, // Set the background color to green
                child: const StationsTable(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
