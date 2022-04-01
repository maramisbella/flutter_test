import 'package:flutter/material.dart';
import 'package:test_app/detail.dart';
import 'package:test_app/services/service_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data;
  @override
  void initState() {
    super.initState();
    UserService.getUser()
        .then((value) => setState(() {
              setState(() {
                data = value;
              });
            }))
        .catchError((e) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("User List")),
        body: Container(
            child: data != null
                ? ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: data["data"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetail(
                                    data: data["data"][index],
                                  ),
                                ));
                          },
                          child: Container(
                            height: 50,
                            color: Colors.blue,
                            child: Center(
                                child: Text(
                              'User : ' +
                                  data["data"][index]["first_name"] +
                                  data["data"][index]["last_name"],
                              style: const TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      );
                    })
                : const Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
