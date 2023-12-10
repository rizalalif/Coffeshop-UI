import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffeshop/nyar/login_user.dart';
import 'package:coffeshop/nyar/service_user.dart';
// import 'package:firestore/service.dart';
import 'package:flutter/material.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'List Community',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      _auth.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        Icons.logout,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
              // OutlinedButton(onPressed: () {
              //   FirestoreService().getUsers();
              // }, child: Text('Klik',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              StreamBuilder<QuerySnapshot>(
                stream: FirestoreService().getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasError) {
                      print("error");
                      return Text(snapshot.error.toString());
                    } else {
                      List userList = snapshot.data!.docs;
                      print("Stream data : ${userList}");
                      return SizedBox(
                        width: double.infinity,
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: userList.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot documentSnapshot = userList[index];
                            Map<String, dynamic> data =
                                documentSnapshot.data() as Map<String, dynamic>;

                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: Material(
                                color: Color.fromARGB(255, 223, 16, 255),
                                elevation: 2,
                                borderRadius: BorderRadius.circular(5),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(data['email']),
                                      Text(data['fullname']),
                                      Text(data['username']),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
