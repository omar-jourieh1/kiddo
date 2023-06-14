import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final TextEditingController _editingController = TextEditingController();

  BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32), topLeft: Radius.circular(32)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Container(
                height: 2,
                width: 30,
                color: Colors.black,
              ),
              const SizedBox(height: 16),
              _inputWidget(context),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFFF5BE)),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "ابحث",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                onPressed: () {
                  final query = _editingController.text.toString();
                  if (query.isNotEmpty) {
                    Navigator.pop(context, query);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      child: TextField(
        controller: _editingController,
        onSubmitted: (value) {
          final query = _editingController.text.toString();
          if (query.isNotEmpty) {
            Navigator.pop(context, query);
          }
        },
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          hintText: "أطفال",
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            decoration: TextDecoration.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 1),
          ),
          contentPadding:
              const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 14),
        ),
      ),
    );
  }
}
