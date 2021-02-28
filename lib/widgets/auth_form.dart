import 'package:flutter/material.dart';
import 'package:bill_tracker/constants.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isloading);

  final bool isloading;
  final void Function(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  var _isLogin = true;
  var _useremail;
  var _username;
  var _userpassword;

  void _trysubmit() {
    final isValid = _formkey.currentState.validate();
    print(_userpassword);
    print(_useremail);
    print(_username);

    FocusScope.of(context).unfocus();

    if (isValid == true) {
      if (_isLogin == true) {
        _formkey.currentState.save();
        widget.submitFn(
          _useremail.trim(),
          _userpassword.trim(),
          _username,
          _isLogin,
          context,
        );
      } else {
        _formkey.currentState.save();
        widget.submitFn(
          _useremail.trim(),
          _userpassword.trim(),
          _username.trim(),
          _isLogin,
          context,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.0,
            ),
            Text(
              'BILL TRACKER',
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: kCardColor,
                letterSpacing: 2.0,
              ),
            ),
            Image.asset(
              'images/bill.png',
              color: kCardColor,
              width: 150.0,
            ),
            Card(
              color: kCardColor,
              margin: EdgeInsets.all(20.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return ('Please enter a valid email id');
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF4a4e69),
                          ),
                          labelText: 'Email Id :',
                        ),
                        onSaved: (value) {
                          _useremail = value;
                        },
                      ),
                      if (!_isLogin)
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return ('Please enter a valid store name');
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xFF4a4e69),
                            ),
                            labelText: 'Store Name :',
                          ),
                          onSaved: (value) {
                            _username = value;
                          },
                        ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty || value.length < 7) {
                            return ('Please enter a valid password');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF4a4e69),
                          ),
                          labelText: 'Password :',
                        ),
                        obscureText: true,
                        onSaved: (value) {
                          _userpassword = value;
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      if (widget.isloading == true) CircularProgressIndicator(),
                      if (!widget.isloading)
                        RaisedButton(
                          color: Color(0xFF4a4e69),
                          onPressed: _trysubmit,
                          child: Text(_isLogin ? 'Log In' : 'Sign Up'),
                        ),
                      if (!widget.isloading)
                        FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(_isLogin
                                ? 'Create new account'
                                : 'I already have an account!',style: TextStyle(fontSize: 15.0),)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
