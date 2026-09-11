import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 1. Controller for State Management
class CounterController extends GetxController
{
  var count = 0.obs; // Observable variable

  void increment()
  {
    count++;
  }
}

// 2. A simple service/class for Dependency Injection
class DataService extends GetxService {
  String fetchData() => "Data from injected service!";
}

class GetXExample extends StatelessWidget {
  const GetXExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Injecting dependencies using Get.put
    // This demonstrates Dependency Injection
    final CounterController controller = Get.put(CounterController());
    final DataService service = Get.put(DataService());

    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX All-in-One Example"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // State Management Demo using Obx
            Obx(() => Text(
                  "Count: ${controller.count}",
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 30),
            
            // Button 1: State Management
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              onPressed: () => controller.increment(),
              label: const Text("1. State Management (Increment)"),
              style: ElevatedButton.styleFrom(minimumSize: const Size(250, 50)),
            ),
            const SizedBox(height: 15),
            
            // Button 2: Dependency Injection
            ElevatedButton.icon(
              icon: const Icon(Icons.storage),
              onPressed: () {
                // Accessing the injected service
                String data = service.fetchData();
                Get.snackbar(
                  "DI Success", 
                  data,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green.withOpacity(0.8),
                  colorText: Colors.white,
                );
              },
              label: const Text("2. Dependency Injection (Fetch)"),
              style: ElevatedButton.styleFrom(minimumSize: const Size(250, 50)),
            ),
            const SizedBox(height: 15),
            
            // Button 3: Navigation
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                // Navigation using Get.to with arguments and transition
                Get.to(
                  () => const DetailsScreen(), 
                  transition: Transition.circularReveal,
                  duration: const Duration(milliseconds: 800),
                  arguments: "Hello from GetX Main Screen!",
                );
              },
              label: const Text("3. Navigation (Go to Details)"),
              style: ElevatedButton.styleFrom(minimumSize: const Size(250, 50)),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing arguments passed during navigation
    final dynamic args = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: const Text("Details Screen")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Passed Argument:\n$args",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              
              // Standard Back Navigation
              ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text("Get.back() - Return Home"),
              ),
              
              const SizedBox(height: 10),
              
              // Replace current screen navigation
              ElevatedButton(
                onPressed: () {
                  Get.off(() => const SuccessScreen());
                },
                child: const Text("Get.off() - Replace Screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const Text("Success!", style: TextStyle(fontSize: 32)),
            const SizedBox(height: 20),
            
            // Clear entire stack and go to home
            ElevatedButton(
              onPressed: () => Get.offAll(() => const GetXExample()),
              child: const Text("Get.offAll() - Reset to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
