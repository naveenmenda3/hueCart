import 'package:flutter/material.dart';
import 'package:huecart/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:huecart/utils/constants/colors.dart';
import 'package:huecart/utils/helpers/helpers_functions.dart';

class ChoiceChipWidget extends StatelessWidget {
  const ChoiceChipWidget({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = NHelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? AppColors.white : null),
      avatar: isColor
          ? CircularContainer(
              width: 50,
              height: 50,
              backgroundColor: NHelperFunctions.getColor(text)!,
            )
          : null,
      shape: isColor ? const CircleBorder() : null,
      backgroundColor: isColor ? NHelperFunctions.getColor(text)! : null,
      labelPadding: isColor ? const EdgeInsets.all(0) : null,
      padding: isColor ? const EdgeInsets.all(0) : null,
      selectedColor: Colors.green,
    );
  }
}
