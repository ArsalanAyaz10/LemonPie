import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    user?.displayName ?? 'No Name',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    user?.email ?? 'No Email',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 5),
                const Text(
                  'Profile Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Full Name'),
                  subtitle: Text(user?.displayName ?? 'No Name'),
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text('Email'),
                  subtitle: Text(user?.email ?? 'No Email'),
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('Phone Number'),
                  subtitle: Text(user?.phoneNumber ?? 'No Phone Number'),
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('Creation Time'),
                  subtitle: Text(user?.metadata.creationTime?.toString() ?? 'Unknown'),
                ),
                ListTile(
                  leading: const Icon(Icons.update),
                  title: const Text('Last Sign-in Time'),
                  subtitle: Text(user?.metadata.lastSignInTime?.toString() ?? 'Unknown'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}