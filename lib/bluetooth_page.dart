import 'package:flutter/material.dart';


class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  // Simulated connection variable (should be assigned in real usage)
  bool isConnected = false; // <-- Change to true only when device connects

  void handleRelayPress(int relayNumber) {
    if (!isConnected) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Not Connected"),
          content: Text("Please connect to the device before using Relay $relayNumber."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            )
          ],
        ),
      );
    } else {
      // If connected, send command to ESP32
      // connection.output.add(Uint8List.fromList("RELAY$relayNumber\n".codeUnits));
      print("Relay $relayNumber triggered");
    }
  }

  Widget buildRelayButton(int relayNumber) {
    return ElevatedButton(
      onPressed: () => handleRelayPress(relayNumber),
      child: Text("Relay $relayNumber"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bluetooth Control")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(6, (i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: buildRelayButton(i + 1),
          )),
        ),
      ),
    );
  }
}
