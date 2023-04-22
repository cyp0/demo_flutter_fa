import 'package:flutter/material.dart';
import 'package:demo_flutter/fa_benefits.dart';
import 'package:demo_flutter/fa_actions.dart';
import 'package:flutter/services.dart';

class FaMain extends StatelessWidget {
  const FaMain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
                      Text('Monedero plus - Farmacias del…',
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
        body: SingleChildScrollView(
            child: Column(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffD5D9EE)),
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xffE6F2FE)),
                child: Row(
                  children: [
                    Image.asset('assets/images/arrow_left.png',
                        width: 15, height: 12),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          "Regresar a Farmacias del Ahorro",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff001588),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                )),
            Card(
              child: Column(
                children: [
                  Container(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/fa_card.png"),
                          fit: BoxFit.fill,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 20, left: 25, bottom: 20, right: 25),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                      'assets/images/monedero_plus_ic.png',
                                      width: 156,
                                      height: 23),
                                  Row(
                                    children: [
                                      Image.asset('assets/images/ic_coin.png',
                                          width: 23, height: 23),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          "300.50",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff001588),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  )
                                ]),
                            const Padding(
                              padding: EdgeInsets.only(top: 34, bottom: 10),
                              child: Text(
                                "Carla López",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff001588),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Text('Cuenta clabe'),
                            Text(
                              "2342492341042901294",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff001588),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text("Ver historial",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff001588),
                                  fontWeight: FontWeight.w500))),
                      Container(color: Color(0xffECECEC), height: 53, width: 1),
                      Expanded(
                          child: Text("Ir a Monedero Plus",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff001588),
                                  fontWeight: FontWeight.w500))),
                    ],
                  )
                ],
              ),
            ),
            FaActions(
                title: 'DEPOSITA EN TIENDAS',
                description:
                    'Crea un código QR para ingresar dinero a tu cuenta Tudi.'),
            FaActions(
                title: 'CREA UN CÓDIGO QR DE PAGO',
                description:
                    'Crea un código QR para pagar en algún comercio afiliado a Tudi.'),
            Container(
                color: Colors.white,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                child: Text('BENEFICIOS')),
            FaBenefits(),
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Text('Desasociar mi cuenta Monedero Plus',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff001588),
                              fontWeight: FontWeight.w400))),
                  Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Text('Último acceso: 11/03/2023 11:35',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff919090).withOpacity(0.5),
                              fontWeight: FontWeight.w400))),
                  Text('Propiedad de Tu Dinero Digital S.A. de C.V. IFPE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff919090).withOpacity(0.5),
                          fontWeight: FontWeight.w400))
                ])),
          ],
        )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
