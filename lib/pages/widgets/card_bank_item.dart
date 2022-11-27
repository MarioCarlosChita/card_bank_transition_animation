

import 'package:animation_sequence/pages/models/card_bank.dart';
import 'package:flutter/material.dart';

class CardBankItem extends StatelessWidget {

  final int  index;
  final CardBank cardBank;
  const CardBankItem({
    required this.index,
    required this.cardBank
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const  EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.primaries[index],
      ),
      child:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
           const Text("Mario Carlos Chita" ,style: TextStyle(
             color: Colors.white,
             fontWeight: FontWeight.w300,
             fontSize: 20
           ),) ,
           const SizedBox(height:10,),
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               _dottedPointCode(quantity: 4) ,
               const SizedBox(width:10,),
               _dottedPointCode(quantity: 4) ,
               const SizedBox(width:10,),
               _dottedPointCode(quantity: 4) ,
               const SizedBox(width:10,),
               _sequenceNumberDotted(value: "1234") ,

             ],
           ) ,

          Container(
             height: 60,
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: const [
                     Text("Saldo" ,style: TextStyle(
                         color: Colors.white,
                         fontSize: 14
                     ),) ,
                     Text("10.000.00Kz" ,style: TextStyle(
                         color: Colors.white,
                         fontSize: 16,
                         fontWeight: FontWeight.bold
                     ),) ,

                   ],
                 ) ,
                 Expanded(
                     child: Container(
                   height:60,
                   alignment: Alignment.centerRight,
                   child:Container(
                     width: 120,
                     height:30,
                     padding: const EdgeInsets.only(
                        top: 08
                     ),
                     decoration: BoxDecoration(
                         color: Colors.primaries[index],
                         borderRadius: BorderRadius.circular(50),
                         border: Border.all(
                             color: Colors.grey.shade200,
                             width: 1
                         )
                     ),
                     child: const Text("ECB Banck",style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                     ),
                      textAlign: TextAlign.center,
                     ),
                   ),
                 )
                 )
               ],
             ),
          )

        ],
      ),
    );
  }


  Widget _sequenceNumberDotted({required String value}) {
    return Text(value,style: const TextStyle(
      color:Colors.white,
    ),);
  }

  Widget _dottedPointCode({required int quantity}){
    List<Widget> items = [];
    for (int index = 0 ;  index <quantity ;  ++index) {
          items.add(dottedPoint());
    }
    return Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.start,
       children: items,
    );
  }

  Widget dottedPoint(){
    return Container(
      width: 6,
      height: 6,
      margin: const EdgeInsets.only(
        right: 2,
        left:2
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
