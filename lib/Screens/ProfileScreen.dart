import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lemonpieui/Model/userModel.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<UserModel?> getProfileInfo() async {
    try {
      String? uid = FirebaseAuth.instance.currentUser?.uid;

      if (uid == null) {
        print("No user is logged in.");
        return null;
      }

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (userDoc.exists) {
        return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      } else {
        print("User not found in Firestore.");
        return null;
      }
    } catch (e) {
      print("Error fetching user profile: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: FutureBuilder<UserModel?>(
        future: getProfileInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("Failed to load profile data."));
          }

          UserModel user = snapshot.data!;

          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                child: Stack(
                children: [
                  const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                   child:
                    Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                ],
                    ),),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        user.username ?? 'No Name',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        user.email ?? 'No Email',
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
                      subtitle: Text(user.username ?? 'No Name'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('Email'),
                      subtitle: Text(user.email ?? 'No Email'),
                    ),
                     ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: const Text('Date of Birth'),
                      subtitle: Text(user.dateOfBirth.toString() ?? 'Unknown'),
                    ),
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
