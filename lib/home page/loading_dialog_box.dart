import 'package:flutter/material.dart';

class LoaderDialog extends StatelessWidget {
  const LoaderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: const Color.fromRGBO(24, 56, 131, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 30),
                  child: const Image(
                    image: AssetImage('assets/TVS-Footer.png'),
                    width: 140,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 300,
        ),
        SizedBox(
          width: 140,
          height: 100,
          child: Dialog(
            child: Container(
              color: Colors.white,
              width: 150,
              height: 120,
              child: const CircularProgressIndicator(color: Color.fromRGBO(24, 56, 131, 1),),
            ),
          ),
        )
      ],
    );
  }
}
