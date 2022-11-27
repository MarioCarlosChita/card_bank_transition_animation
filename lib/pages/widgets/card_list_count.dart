import 'package:animation_sequence/pages/models/card_bank.dart';
import 'package:flutter/material.dart';

class CardListCount extends StatelessWidget {

  List<Movimentation> lista;
  Color color;
  CardListCount({
    required this.color ,
    required this.lista
  }) ;

  @override
  Widget build(BuildContext context) {
    Size media =MediaQuery.of(context).size;
    return Container(
      width: media.width,
      height: 500,
      child: ListView.separated(
          itemCount: lista.length,
          separatorBuilder: (context ,index)=>Divider(color: Colors.grey.shade300,),
          itemBuilder: (context , index){
            return Container(
               width: media.width,
               padding: const EdgeInsets.all(10),
               height: 60,
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   _circuleCoinPoint(),
                   _detailPointValues(movimentation: lista[index]) ,
                    Expanded(child:  _detailValueAmount(movimentation: lista[index]))
                 ],
               ),
            );
          }
      ),
    );
  }



  Widget _circuleCoinPoint(){
    return AnimatedContainer(
      width: 40,
      height:40,
      curve: Curves.bounceIn,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
      duration: const Duration(seconds: 1),
    );
  }

  Widget _detailPointValues({required Movimentation  movimentation}){
    return  Container(
      padding: const EdgeInsets.only(top: 03, left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(movimentation.bankName,style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14
          ),) ,
          const  SizedBox(height:5,),
          Text(movimentation.data.toString(),style: const TextStyle(
              color: Colors.grey ,
              fontSize: 10
          ),)
        ],
      ),
    ) ;
  }

  Widget _detailValueAmount({required Movimentation movimentation}){
    return Container(
      height: 60,
      padding:const EdgeInsets.only(
         right: 10
      ),
      alignment: Alignment.centerRight,
      child: Text(movimentation.discount.toString(),style: TextStyle(
        color:  Colors.black,
        fontWeight: FontWeight.bold
      ),),
    );
  }

}
