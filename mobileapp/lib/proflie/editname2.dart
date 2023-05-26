import 'package:flutter/material.dart';
import 'package:mobileapp/proflie/PlayerName.dart';
import 'package:provider/provider.dart';
import '../record/database/PlayerName_db.dart';
import '../user.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 200);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height,
      size.width,
      size.height - 200,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class EditUser extends StatefulWidget {
  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  bool isCircleTransformed = false;
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 174, 242, 252),
        body: Stack(
          children: [
            Positioned(
              top: 150,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(255, 85, 200, 186),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 115, 122, 124),
                        blurRadius: 15,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'สร้างตัวละคร',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(246, 56, 113, 199),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      /*setState(() {
                        isCircleTransformed = !isCircleTransformed;
                        
                      });
                      UserPic.setPic(isCircleTransformed);*/
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(81, 188, 173, 0.965),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 115, 122, 124),
                            blurRadius: 15,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: /*UserPic.getPic()
                            ? 
                              Image.asset(
                            'image/m.png',
                            height: 200,
                          )
                          : */Image.asset(
                                'image/w.png',
                                height: 200,
                              ),
                          ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 250,
                    height: 80,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 115, 122, 124),
                          blurRadius: 15,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'ชื่อ',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'โปรดระบุชื่อผู้เล่นใหม่';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  height: 70,
                  color: Color.fromARGB(255, 85, 200, 186),
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => user()),
                  );
                },
                child: Icon(Icons.close),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              String userName = nameController.text;
              print('ชื่อผู้ใช้: $userName');
              // var playerNameProvider =
              //     Provider.of<PlayerName>(context, listen: false);
              // playerNameProvider.savePlayerName(userName);
              //add name
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => user()),
              );
              //TODO
            }
          },
          child: Icon(Icons.check),
        ),
      ),
    );
  }
}
