import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Floataction extends StatefulWidget {
  const Floataction({super.key});

  @override
  State<Floataction> createState() => _FloatactionState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _FloatactionState extends State<Floataction> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              DropdownButton(
                items: list.map<DropdownMenuItem<String>>
                  (
                        (String value)
                    {
                        return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                    );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
              ),

              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating)
                {
                  print(rating); // Handle rating change
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
