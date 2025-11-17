import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WaiterTablesListScreen extends StatefulWidget {
  final String waiterId; // النادل الحالي

  const WaiterTablesListScreen({
    super.key,
    required this.waiterId,
  });

  @override
  State<WaiterTablesListScreen> createState() => _WaiterTablesListScreenState();
}

class _WaiterTablesListScreenState extends State<WaiterTablesListScreen> {
  /// هذه قائمة الطاولات (مؤقتة)
  /// لاحقًا تستبدلها ببياناتك من API أو Database
  List<Map<String, dynamic>> allTables = [
    {
      "tableNumber": 1,
      "waiterId": "W01",
      "waiterName": "حسن",
      "ordersCount": 4,
      "startTime": DateTime.now().subtract(const Duration(minutes: 35)),
    },
    {
      "tableNumber": 4,
      "waiterId": "W99",
      "waiterName": "فاطمة",
      "ordersCount": 2,
      "startTime": DateTime.now().subtract(const Duration(hours: 1)),
    },
  ];

  /// يتم جلب فقط الطاولات الخاصة بالنادل
  List<Map<String, dynamic>> get waiterTables {
    return allTables
        .where((t) => t["waiterId"] == widget.waiterId)
        .toList();
  }

  /// حساب المدة منذ فتح الطاولة
  String formatTimeSince(DateTime start) {
    Duration diff = DateTime.now().difference(start);
    return "${diff.inHours}h ${diff.inMinutes % 60}m";
  }

  /// شاشة الخيارات
  void showTableActions(Map tableData) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              Text(
                "طاولة رقم ${tableData['tableNumber']}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              ListTile(
                leading: const Icon(Icons.print),
                title: const Text("إضافة ملاحظة وطباعة الفاتورة"),
                onTap: () {
                  Navigator.pop(context);
                  showAddNoteDialog(tableData);
                },
              ),

              ListTile(
                leading: const Icon(Icons.add),
                title: const Text("إضافة عنصر جديد"),
                onTap: () {
                  Navigator.pop(context);
                  // افتح شاشة إضافة العناصر
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// نافذة إضافة الملاحظة
  void showAddNoteDialog(Map tableData) {
    TextEditingController noteController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("ملاحظة للطباعة"),
        content: TextField(
          controller: noteController,
          maxLines: 5,
          decoration: const InputDecoration(
            hintText: "اكتب الملاحظة هنا...",
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            child: const Text("إلغاء"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text("طباعة"),
            onPressed: () {
              Navigator.pop(context);
              printNote(
                tableNumber: tableData["tableNumber"],
                waiterName: tableData["waiterName"],
                note: noteController.text.trim(),
              );
            },
          ),
        ],
      ),
    );
  }

  /// هنا تربط الطابعة حسب نوع الطابعة (Sunmi – Bluetooth – POS)
  void printNote({
    required int tableNumber,
    required String waiterName,
    required String note,
  }) {
    // TODO: اكتب كود الطابعة تبعك هنا
    // مثال فقط:
    // PrinterService.print(note);

    debugPrint("---- PRINTING ----");
    debugPrint("Table: $tableNumber");
    debugPrint("Waiter: $waiterName");
    debugPrint("Note: $note");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("طاولاتي"),
        centerTitle: true,
      ),
      body: waiterTables.isEmpty
          ? const Center(
        child: Text("لا يوجد طاولات مرتبطة بك حالياً"),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: waiterTables.length,
        itemBuilder: (context, index) {
          final table = waiterTables[index];

          return GestureDetector(
            onTap: () => showTableActions(table),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    child: Text("${table['tableNumber']}"),
                  ),
                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "النادل: ${table['waiterName']}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text("عدد الطلبات: ${table['ordersCount']}"),
                        const SizedBox(height: 4),
                        Text(
                          "منذ: ${formatTimeSince(table['startTime'])}",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
