import 'package:flutter/material.dart';
import 'package:nexaya/models/login_model.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key, required this.data});
  final LoginModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff650361),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(children: [
          const SizedBox(
            height: 120,
          ),
          const CircleAvatar(
            radius: 56,
            backgroundColor: Color(0xff47ff29),
            child: Center(
              child: Icon(
                Icons.done,
                size: 80,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          const Text(
            "Login Success",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          const SizedBox(height: 32,),
          Card(
            elevation: 5,
            
            color: Colors.white,
            child: Container( 
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 22),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Name: "),
                      const Spacer(),
                      Text(data.data!.name!)
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(),
                  ),
                  Row(
                    children: [
                      const Text("ID: "),
                      const Spacer(),
                      Text(data.data!.sId!)
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(),
                  ),
                  Row(
                    children: [
                      const Text("Role: "),
                      const Spacer(),
                      Text(data.data!.role!)
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
