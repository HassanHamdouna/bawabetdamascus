import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final int inTime;
  final int outTime;
  final double price;
  final String? existingNote; // ملاحظة موجودة مسبقاً إذا فيه
  final Function(String? note) onAdd; // يرسل الملاحظة مع الإضافة
  final VoidCallback? onTap; // عند الضغط على كامل البطاقة

  const MealItem({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.inTime,
    required this.outTime,
    required this.price,
    required this.onAdd,
    this.onTap,
    this.existingNote,
  });

  void _handleAdd(BuildContext context) {
    if (existingNote != null && existingNote!.isNotEmpty) {
      // إذا فيه ملاحظة موجودة مسبقًا، نعرض BottomSheet لتعديل/تأكيد
      TextEditingController noteController =
      TextEditingController(text: existingNote);
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (context) => Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom, top: 20, left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("ملاحظة للوجبة", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextField(
                controller: noteController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "أدخل ملاحظة (اختياري)",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  onAdd(noteController.text.isEmpty ? null : noteController.text);
                  Navigator.pop(context);
                },
                child: const Text("إضافة للسلة"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    } else {
      // إذا ما فيه ملاحظة مسبقة، نضيف مباشرة
      onAdd(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.grey.shade900,
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset(image, height: 120, width: 120, fit: BoxFit.cover),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 8),
                    Text(description,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        )),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.timer_outlined,
                            size: 18, color: Colors.amber),
                        Text(" $inTime - $outTime دقيقة",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            )),
                        const SizedBox(width: 12),
                        const Icon(Icons.monetization_on,
                            size: 18, color: Colors.amber),
                        Text(" $price دت",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            )),
                        const Spacer(),
                        InkWell(
                          onTap: () => _handleAdd(context),
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            height: 38,
                            width: 38,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
