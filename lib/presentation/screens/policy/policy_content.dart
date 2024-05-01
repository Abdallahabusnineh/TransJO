import 'package:flutter/material.dart';

class PolicyContent extends StatelessWidget {
  const PolicyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      children: [
        Row(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(10, 80, 0, 0),
            child: Text('Policy',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'Montserrat'),))
      ],
        ),
        SizedBox(height: 5),
        Container(
        padding: EdgeInsets.fromLTRB(10, 0, 0,0),
        child: Text('Our bus tracking application TranJo is committed to ensuring the privacy and security of our users data. This policy outlines how we collect, use, and protect personal information within the App.',style: TextStyle(fontSize: 20),)),
        SizedBox(height: 10),
        Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            'Information Collected ',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        ),
      ],
        ),
        Divider(),
        Padding(
      padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
      child: Text('\User Information:\ The App may collect personal information such as name, email address, and phone number during the registration process.',),
        ),
        Padding(
      padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
      child: Text(' User Information: The App may collect personal information such as name, email address, and phone number during the registration process.',),
        ),
        SizedBox(height: 10,),
        Padding(
      padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
      child: Text('Location Data: The App tracks the location of users devices to provide real-time bus tracking services. This information is used solely for the purpose of enhancing the user experience and is not shared with third parties without explicit consent.',),
        ),
        SizedBox(height: 10,),
        Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            'Use of Information',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        ),
      ],
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
          child: Text('Service Improvement: Collected data, including location information, is used to improve the functionality and efficiency of the bus tracking service.',),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
          child: Text(' Communication: User information may be used to communicate important updates, service changes, or promotional offers related to the App.',),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                'Data Security',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ),
          ],
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
          child: Text('Encryption: User data is encrypted to prevent unauthorized access or disclosure.',),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
          child: Text('Access Control: Access to user data is restricted to authorized personnel only.',),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                'Data Sharing',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ),
          ],
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
          child: Text('Third Parties: User data is not shared with third parties unless explicitly authorized by the user or required by law.',),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
          child: Text('Anonymization: Aggregate and anonymized data may be shared with partners or used for statistical analysis.',),
        ),
SizedBox(height: 80,)

      ],
      ),
    );
  }
}
