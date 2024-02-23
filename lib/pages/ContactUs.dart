import 'package:flutter/material.dart';
import 'package:zlandsfrontend/db/db_helper.dart';
import 'package:zlandsfrontend/pages/MessageSuccesScreen.dart';
import 'package:zlandsfrontend/pages/MyProfileScreen.dart';

import '../common_widgets/common_widgets.dart';

class ContactUsScreen extends StatefulWidget {
  ContactUsScreen({Key? key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  DB_help DB = DB_help();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyProfileScreen()),
                );
              },
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              hoverColor: Colors.white.withOpacity(0.15),
            ),
            SizedBox(width: 20),
            textArea(
              Label: 'Contact Us',
              FontFamily: 'Karla Light',
              Fontweight: FontWeight.w700,
              fontSize: 36,
            )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: ZColors.screencolor,
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: media.width * 0.75,
                  child: textArea(
                    Label: 'Send us your feedback',
                    FontFamily: 'Karla Light',
                    Fontweight: FontWeight.w200,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            SizedBox(height: 75),
            _buildTextField(
              label: 'Name',
              controller: _nameController,
            ),
            SizedBox(height: 60),
            _buildTextField(
              label: 'Subject',
              controller: _subjectController,
            ),
            SizedBox(height: 60),
            _buildTextField(
              label: 'Message',
              controller: _messageController,
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 120, right: 120),
              child: button(
                Label: 'Send Message',
                function: () {
                  if (_formKey.currentState!.validate()) {
                    _sendMessage();
                  }
                },
                ZColors: ZColors.buttonColorblue,
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textArea(
            Label: label,
            FontFamily: 'Karla',
            Fontweight: FontWeight.w700,
            fontSize: 22,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: TextFormField(
              controller: controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter $label';
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFD9D9D9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(33),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(33),
                ),
                hintText: 'Enter your $label',
                hintStyle: TextStyle(
                  color: Color(0x701E1E1E),
                  fontSize: 22,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String name = _nameController.text.trim();
    String subject = _subjectController.text.trim();
    String message = _messageController.text.trim();

    // You can save the data to Firestore here
    // Example:
   final currentemail= DB.Authen.currentUser?.email.toString();

   DB.FireDB.collection('Contact Us').add({
    'Name':name,
    'Subject':subject,
    'Message':message,
    'UserEmail':currentemail
   }).catchError((errorr, stackTrace) =>(){
    
    showDialog(context: context, builder: (context)=>WarningDialog(DialogQuestion: errorr.toString()));}).then((value) =>   Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MessageSuccessScreen())));

    // Clear the text fields after sending the message
    _nameController.clear();
    _subjectController.clear();
    _messageController.clear();

    // Show a confirmation message to the user
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Message sent successfully!'),
      backgroundColor: Colors.green,
    ));
  }
}
