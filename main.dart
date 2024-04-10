import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Contact {
  final String name;
  final String phoneNumber;
  final String address;
  final String imageUrl;

  Contact({
    required this.name,
    required this.phoneNumber,
    required this.address,
    this.imageUrl = '',
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Loại bỏ dải đỏ ở góc trên cùng bên phải
      home: PhoneBook(),
    );
  }
}

class PhoneBook extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'Bích Trâm', phoneNumber: '099-112-2128', address: 'Nam Từ Liêm, Hà Nội', imageUrl: 'https://kenh14cdn.com/thumb_w/660/203336854389633024/2023/3/22/photo-4-1679457926228622941957.jpg'),
    Contact(name: 'Nguyễn A', phoneNumber: '018-789-0122', address: 'KonTum', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgH_EVdcMyfKP2XEZHJgb2Kr83Q6j4Hyqi6rkVaqZVSw&s'),
    Contact(name: 'Trần B', phoneNumber: '089-212-5221', address: 'Hòa Bình', imageUrl: 'https://daknong.1cdn.vn/2020/07/30/baodaknong.org.vn-database-image-2020-07-31-_3365-vh-5.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(contacts[index].imageUrl),
            ),
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].phoneNumber),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDetail(contact: contacts[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ContactDetail extends StatelessWidget {
  final Contact contact;

  ContactDetail({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (contact.imageUrl.isNotEmpty)
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(contact.imageUrl),
                ),
              ),
            SizedBox(height: 20),
            Text('Phone Number: ${contact.phoneNumber}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Address: ${contact.address}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
