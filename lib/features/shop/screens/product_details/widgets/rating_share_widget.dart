import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            SizedBox(
              width: 10,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '5.0 ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  )),
              TextSpan(
                  text: '(199)',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
            ])),
          ],
        ),

        /// Share button
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            size: 24,
          ),
        )
      ],
    );
  }
}
