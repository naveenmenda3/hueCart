import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/texts/section_heading.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: 'Shopping Address',
          actionButtonTitle: 'Change',
          onPressed: () {},
          showActionButton: true,
        ),
        const Text('Naveen Menda',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.phone,
              color: Colors.grey[800],
              size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('+91 70132995420',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.location_history,
              color: Colors.grey[800],
              size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
              child: Text(
                'Banglore,Karnataka',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                softWrap: true,
              ),
            )
          ],
        )
      ],
    );
  }
}
