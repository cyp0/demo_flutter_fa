import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:demo_flutter/models/fa_benefit.dart';

class FaBenefits extends StatelessWidget {
  const FaBenefits({super.key});

  @override
  Widget build(BuildContext context) {
    List<FaBenefit> fabenefits = <FaBenefit>[
      FaBenefit(
          'Bonificaciones en tu Monedero del Ahorro',
          'Te premiamos en cada compra que realices, acumulando puntos en tu Monedero del Ahorro',
          'assets/images/ic_coins.png'),
      FaBenefit(
          'Paga en tienda',
          'Genera un código QR de pago para cualquier tienda afiliada a Tudi',
          'assets/images/ic_qr_code.png'),
      FaBenefit(
          'Pago de servicios',
          'Paga tus servicios desde Tudi y ahórrate tiempo en traslados y filas',
          'assets/images/ic_pay_services.png')
    ];

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: fabenefits.length,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 15),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Image.asset(fabenefits[index].icon,
                          width: 23, height: 23)),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(fabenefits[index].title,
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff3A3C40),
                                fontWeight: FontWeight.w500)),
                        Text(fabenefits[index].description,
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff919090),
                                fontWeight: FontWeight.w400)),
                      ]))
                ],
              ));
        });
  }
}
