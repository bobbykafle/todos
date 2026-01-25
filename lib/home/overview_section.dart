import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/app_text.dart';

class OverviewSection extends StatelessWidget {
  final int totalTasks;
  final int pendingTasks;
  final int completedTasks;

  const OverviewSection({
    super.key,
    required this.totalTasks,
    required this.pendingTasks,
    required this.completedTasks,
    });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceAround,
        children: [
         Expanded(child: _buildCard('Total', totalTasks, const Color(0xFF1976D2)),),
            const SizedBox(width: 8),
 
        Expanded(child: _buildCard('Pending', pendingTasks, const Color(0xFFFFB74D)),),
            const SizedBox(width: 8),

        Expanded(child: _buildCard('Completed', completedTasks, const Color(0xFFE57373)),), 
             const SizedBox(width: 8),

        ],
    );
  }
  
  //creating the BUILDCARD method 
  _buildCard(String title, int count, Color colors) {
    return Card(
      // ignore: deprecated_member_use
      color: colors.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
         children: [
           AppText(text: count.toString(),
           fontSize: 20,
           color: Colors.white,
           ),
           const SizedBox(height: 4),
           AppText(text: title,
           fontSize: 13,
           fontWeight: FontWeight.bold,
           color: Colors.white,
           ),
         ],
        ),
      ),
    );
  }
}