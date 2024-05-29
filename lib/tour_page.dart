import 'package:flutter/material.dart';

class TourPage extends StatefulWidget {
  final String campusName;
  final String description;
  final String imagePath;

  const TourPage({
    Key? key,
    required this.campusName,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  _TourPageState createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isTermsChecked = false;

  void _showBookingConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Booking Telah DiConfirm!"),
          content: const Text("Selamat Tour Telah diBooking"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Go back to explore menu
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour ${widget.campusName}'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Summary of your tour to Campus ${widget.campusName}!',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  widget.imagePath,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Apa anda memerlukan tour guide?',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Switch(
                  value: isSwitched1,
                  onChanged: (value) {
                    setState(() {
                      isSwitched1 = value;
                      // Add your logic here when the switch is toggled
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Kirimkan bukti receipts booking',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Switch(
                  value: isSwitched2,
                  onChanged: (value) {
                    setState(() {
                      isSwitched2 = value;
                      // Add your logic here when the switch is toggled
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: isTermsChecked,
                  onChanged: (value) {
                    setState(() {
                      isTermsChecked = value!;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    'I agree to the terms and conditions',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Adjust the spacing as needed
            Center(
              child: ElevatedButton(
                onPressed: isTermsChecked
                    ? () {
                        _showBookingConfirmationDialog();
                      }
                    : null, // Disable the button if terms are not checked
                style: ElevatedButton.styleFrom(
                  backgroundColor: isTermsChecked
                      ? const Color.fromARGB(255, 182, 134, 209)
                      : Colors.grey, // Change button color based on state
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                ),
                child: const Text(
                  'Confirm Booking',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
