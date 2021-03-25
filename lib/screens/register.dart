import 'package:dwm14/constants/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = '';
  String firstname = '';
  String city = '';
  String email = '';
  String password = '';
  String errorValidation = '';

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Register',
            textAlign: TextAlign.center,
          ),
        ),
        body: SafeArea(
            child: Center(
                child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Nom',
                          hintText: 'Entrez votre nom de famille'),
                    ),
                    TextFormField(
                      onSaved: (value) {
                        setState(() {
                          firstname = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Prénom', hintText: 'Entrez votre prénom'),
                    ),
                    TextFormField(
                      onSaved: (value) {
                        setState(() {
                          city = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Ville', hintText: 'Entrez votre ville'),
                    ),
                    TextFormField(
                      onSaved: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Empty';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9-.]+@[a-zA-Z0-9]+\.[a-z]+$")
                            .hasMatch(value)) {
                          return "Email invalide";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Email', hintText: 'Entrez votre email'),
                    ),
                    TextFormField(
                      obscureText: true,
                      onSaved: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Empty';
                        } else if (value.length < 8) {
                          return 'Mot de passe trop court';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          hintText: 'Entrez votre mot de passe'),
                    ),
                    SizedBox(height: 10),
                    Text(errorValidation),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          try {
                            UserCredential userCredential = await firebaseAuth
                                .createUserWithEmailAndPassword(
                                    email: email, password: password);
                            if (userCredential.user != null) {
                              final docReference =
                                  firestore.collection('users');
                              docReference.add({
                                'name': name,
                                'email': userCredential.user.email,
                                'firstname': firstname,
                                'city': city
                              }).catchError((error) {
                                setState(() {
                                  errorValidation =
                                      'Failed to add your credentials';
                                });
                              });
                            }
                            await firebaseAuth.signInWithEmailAndPassword(
                                email: email, password: password);
                            print('Inscription terminée');
                            Navigator.pushReplacementNamed(context, '/home');
                          } on FirebaseAuthException catch (error) {
                            if (error.code == 'weak-password') {
                              setState(() {
                                errorValidation = 'Mot de passe trop faible';
                              });
                            } else if (error.code == 'email-already-in-use') {
                              setState(() {
                                errorValidation = 'Email déjà utilisé';
                              });
                            }
                          } catch (error) {
                            print(error);
                          }
                        }
                      },
                      child: Text('S\'inscrire'),
                    )
                  ],
                ),
              )
            ],
          ),
        ))));
  }
}
