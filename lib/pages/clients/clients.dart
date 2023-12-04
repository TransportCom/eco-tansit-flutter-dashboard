import 'package:admin_dashboard/pages/clients/widgets/clients_table.dart';
import 'package:flutter/material.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({Key? key});

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
                child: ClientsTable(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
