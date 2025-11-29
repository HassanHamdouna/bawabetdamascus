import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class WaiterAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String waiterName;
  final String waiterImage;
  final int cartCount;
  final int CountAllCart;
  final VoidCallback onCartTap;
  final VoidCallback onShowTables;

  const WaiterAppBar({
    super.key,
    required this.waiterName,
    required this.waiterImage,
    required this.cartCount,
    required this.CountAllCart,
    required this.onCartTap,
    required this.onShowTables,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).viewPadding.top;

    return Container(
      padding: EdgeInsets.fromLTRB(16, topPadding + 6, 16, 8),
      decoration: const BoxDecoration(
        color: AppColors.darkCard,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // صورة النادل
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(waiterImage),
          ),
          const SizedBox(width: 10),

          // الاسم فقط
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "نادل",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                Text(
                  waiterName,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // السلة والعداد
          InkWell(
            onTap: onCartTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.amber.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    "$cartCount",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.shopping_cart_outlined, size: 18),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          InkWell(
            onTap: onShowTables,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.amber.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    "$CountAllCart",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.clear_all_sharp, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
