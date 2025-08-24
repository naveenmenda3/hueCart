import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huecart/common/widgets/products/cart_item.dart';
import 'package:huecart/common/widgets/texts/product_price_text.dart';
import 'package:huecart/utils/constants/colors.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    required this.showAddRemoveButton,
    required this.cartItems,
    required this.onQuantityChanged,
    required this.onRemoveItem,
  });

  final bool showAddRemoveButton;
  final List<Map<String, dynamic>> cartItems;
  final Function(String, int) onQuantityChanged;
  final Function(String) onRemoveItem;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: cartItems.length,
      itemBuilder: (_, index) {
        final item = cartItems[index];
        return Dismissible(
          key: Key(item['productId']),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) async {
            return await Get.dialog<bool>(
              AlertDialog(
                title: const Text('Remove Item'),
                content: const Text('Are you sure you want to remove this item from your cart?'),
                actions: [
                  TextButton(
                    onPressed: () => Get.back(result: false),
                    child: const Text('Cancel', style: TextStyle(color: AppColors.grey)),
                  ),
                  TextButton(
                    onPressed: () => Get.back(result: true),
                    child: const Text('Remove', style: TextStyle(color: AppColors.error)),
                  ),
                ],
              ),
            ) ?? false;
          },
          onDismissed: (_) {
            onRemoveItem(item['productId']);
            Get.snackbar(
              'Item Removed',
              '${item['productName']} has been removed from your cart',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.error.withOpacity(0.1),
              colorText: AppColors.error,
              duration: const Duration(seconds: 2),
            );
          },
          background: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.error.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.centerRight,
            child: const Icon(Icons.delete_outline, color: AppColors.error),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                CartItem(
                  imageUrl: item['imageUrl'] ?? '',
                  title: item['productName'] ?? '',
                  price: (item['price'] ?? 0.0).toString(),
                  onRemove: () {
                    Get.dialog<bool>(
                      AlertDialog(
                        title: const Text('Remove Item'),
                        content: const Text('Are you sure you want to remove this item from your cart?'),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(result: false),
                            child: const Text('Cancel', style: TextStyle(color: AppColors.grey)),
                          ),
                          TextButton(
                            onPressed: () => Get.back(result: true),
                            child: const Text('Remove', style: TextStyle(color: AppColors.error)),
                          ),
                        ],
                      ),
                    ).then((confirmed) {
                      if (confirmed == true) {
                        onRemoveItem(item['productId']);
                        Get.snackbar(
                          'Item Removed',
                          '${item['productName']} has been removed from your cart',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppColors.error.withOpacity(0.1),
                          colorText: AppColors.error,
                          duration: const Duration(seconds: 2),
                        );
                      }
                    });
                  },
                ),
                if (showAddRemoveButton) const SizedBox(height: 20),
                if (showAddRemoveButton)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 70),
                            _CircularIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                final currentQuantity = item['quantity'] ?? 1;
                                if (currentQuantity > 1) {
                                  onQuantityChanged(
                                    item['productId'],
                                    currentQuantity - 1,
                                  );
                                } else {
                                  Get.dialog<bool>(
                                    AlertDialog(
                                      title: const Text('Remove Item'),
                                      content: const Text('Are you sure you want to remove this item from your cart?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Get.back(result: false),
                                          child: const Text('Cancel', style: TextStyle(color: AppColors.grey)),
                                        ),
                                        TextButton(
                                          onPressed: () => Get.back(result: true),
                                          child: const Text('Remove', style: TextStyle(color: AppColors.error)),
                                        ),
                                      ],
                                    ),
                                  ).then((confirmed) {
                                    if (confirmed == true) {
                                      onRemoveItem(item['productId']);
                                      Get.snackbar(
                                        'Item Removed',
                                        '${item['productName']} has been removed from your cart',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: AppColors.error.withOpacity(0.1),
                                        colorText: AppColors.error,
                                        duration: const Duration(seconds: 2),
                                      );
                                    }
                                  });
                                }
                              },
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${item['quantity'] ?? 1}',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
                            _CircularIconButton(
                              icon: Icons.add,
                              onPressed: () => onQuantityChanged(
                                item['productId'],
                                (item['quantity'] ?? 1) + 1,
                              ),
                            ),
                          ],
                        ),
                        TProductPriceText(
                          price: ((item['price'] ?? 0.0) * (item['quantity'] ?? 1)).toStringAsFixed(2),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _CircularIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: 1.5),
      ),
      child: IconButton(
        icon: Icon(icon, size: 18, color: AppColors.primary),
        onPressed: onPressed,
        splashRadius: 22,
        constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
      ),
    );
  }
}
