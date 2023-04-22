import 'dart:io';

import 'package:demo_flutter/screens/fa_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuthScreen extends StatefulWidget {
  const LocalAuthScreen({super.key});

  @override
  State<LocalAuthScreen> createState() => _LocalAuthScreenState();
}

class _LocalAuthScreenState extends State<LocalAuthScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> authenticate() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to show account balance',
        options: const AuthenticationOptions(useErrorDialogs: false, biometricOnly: true),
      );
      if (didAuthenticate == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FaMain()));
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        // Add handling of no hardware here.
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
      } else {
        // ...
      }
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.clear_outlined,
                color: Colors.black,
              ),
            ),
            title: Container(
                width: double.infinity,
                margin: EdgeInsets.only(right: (16)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Monedero plus - Farmacias del…',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          textAlign: TextAlign.center),
                      Text('tudiapp.com.mx',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 10),
                          textAlign: TextAlign.center)
                    ])),
            actions: [
              Icon(Icons.more_horiz, color: Colors.black),
              Padding(padding: EdgeInsets.only(right: 16))
            ],
            backgroundColor: Colors.white,
            elevation: 1,
            systemOverlayStyle: SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.white,
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light,
            )),
        backgroundColor: Color(0xffF2F2F2),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(mainAxisSize: MainAxisSize.max, children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              AuthScreenBody(callback: () => authenticate()),
                            ],
                          ),
                        ),
                      ),
                      //Footer
                      AuthScreenFooter()
                    ]),
                  )));
        }));
  }
}

class AuthScreenFooter extends StatelessWidget {
  const AuthScreenFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Ingresar con contraseña',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff2F2F30),
                  fontWeight: FontWeight.w500)),
          Padding(padding: EdgeInsets.only(top: 27)),
          Text('Propiedad de Tu Dinero Digital S.A. de C.V. IFPE',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff919090).withOpacity(0.5),
                  fontWeight: FontWeight.w400)),
          Padding(padding: EdgeInsets.only(bottom: 40))
        ]);
  }
}

class AuthScreenBody extends StatelessWidget {
  final VoidCallback callback;

  const AuthScreenBody({super.key, required this.callback});

    Future<bool> isTouchIdEnable() async {
      final LocalAuthentication auth = LocalAuthentication();
      final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
      return availableBiometrics.contains(BiometricType.fingerprint);
    } 

    Future<bool> isAndroidDeviceSupported() async {
      final LocalAuthentication auth = LocalAuthentication();
      return auth.isDeviceSupported();
    } 


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/monedero_plus_ic.png',
                width: 156, height: 23),
            Padding(
              padding: EdgeInsets.only(top: 54),
              child: Text(
                'Bienvenido',
                style: TextStyle(
                    color: Color(0xff2F2F30),
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 7)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'L*** G******* C****',
                  style: TextStyle(
                      color: Color(0xff2F2F30),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Padding(padding: EdgeInsets.only(right: 10)),
                Icon(Icons.cancel, color: Color.fromARGB(255, 186, 189, 186)),
              ],
            ),
            Text(
              '¿No eres tú?',
              style: TextStyle(
                  color: Color(0xff001588),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              '10 de Marzo, 2023',
              style: TextStyle(
                  color: Color(0xff2F2F30).withOpacity(0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            Padding(padding: EdgeInsets.only(top: 21)),
            Padding(
              padding: EdgeInsets.only(left: 28, right: 28, bottom: 150),
              child: Text(
                'Estimado cliente, verifique que las iniciales sean correctas previo a ingresar a su cuenta.',
                style: TextStyle(
                    color: Color(0xff2F2F30).withOpacity(0.8),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
                onTap: callback,
                child: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(15.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xff26CB8E)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if(Platform.isIOS) ... {
                          BiometricsCard(isTouchIdEnable: isTouchIdEnable())
                        } 
                        else if(Platform.isAndroid) ...{
                          BiometricsCard(isTouchIdEnable: isAndroidDeviceSupported())
                        }
                      
                      ],
                    ))),
            Padding(padding: EdgeInsets.only(top: 40))
          ],
        ));
  }
}


class BiometricsCard extends StatefulWidget {

  Future<bool> isTouchIdEnable;

  BiometricsCard({super.key, required this.isTouchIdEnable});

  @override
  State<BiometricsCard> createState() => _BiometricsCard();
}

class _BiometricsCard extends State<BiometricsCard> {

  LocalAuthentication auth = LocalAuthentication();

  Future<bool> getAvailableBiometric() async {
    final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
    return availableBiometrics.contains(BiometricType.fingerprint);
}


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.data == true){
              return(
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Image.asset('assets/images/ic_fingerprint.png', width: 25, height: 25),
                      Padding(padding: EdgeInsets.only(right: 11)),
                      Text(
                      "Ingresar con touch id".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    )
                    ]
            ));
            }else{
              return(
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Image.asset('assets/images/ic_face_id.png', width: 25, height: 25),
                           Padding(padding: EdgeInsets.only(right: 11)),
                            Text(
                            "Ingresar con face id".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400))
                    
                    ]
            ));
            }
          
        }else{
          return(
            Text('')
          );
        }
      },
      future: widget.isTouchIdEnable
    );
  }
}

