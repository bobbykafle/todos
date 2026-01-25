import 'package:flutter/material.dart';

class DueTimePage extends StatefulWidget {
   

  const DueTimePage({super.key});

  @override
  State<DueTimePage> createState() => _PickDueTimePageState();
}

class _PickDueTimePageState extends State<DueTimePage> {
  DateTime? selectedDateTime;

  Future<void> pickDateTime() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate == null) return;

    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime == null) return;

    setState(() {
      selectedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick Due Time')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedDateTime == null
                  ? 'No time selected'
                  : 'Selected: ${selectedDateTime.toString()}',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickDateTime,
              child: Text('Pick Date & Time'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedDateTime == null
                  ? null
                  : () {
                      // Return selected date back to previous page
                      Navigator.pop(context, selectedDateTime);
                    },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
