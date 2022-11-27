import 'package:animation_sequence/pages/models/animation_maneger.dart';
import 'package:animation_sequence/pages/models/card_bank.dart';
import 'package:animation_sequence/pages/widgets/card_bank_item.dart';
import 'package:animation_sequence/pages/widgets/card_bank_widget.dart';
import 'package:animation_sequence/pages/widgets/card_list_count.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<AnimationManager> listAnimationManagers = [];
  int selectedCard = -1;

  late AnimationController _listController ;
  late Animation<Offset>   _listPosition;
  int  sequenceColor = -1;
  List<CardBank> LIST_ACCOUNT = [
    CardBank(
        titleUser: "Mario Carlos",
        addressUser: "Angola / Luanda/Morro Bento",
        cardMessage: "this is a bank card",
        histories: [
          Movimentation(
              bankName: "Banco Athantico",
              data:     "3pm:30min - 24/11/2022",
              discount: "-6.000.00kz"
          ),
          Movimentation(
              bankName: "Banco Keve",
              data:     "1pm:30min - 12/11/2022",
              discount: "-60.000.00kz"
          ),
          Movimentation(
              bankName: "Banco Athantico",
              data:     "3pm:30min - 24/11/2022",
              discount: "-6.000.00kz"
          ),
          Movimentation(
              bankName: "Banco Keve",
              data:     "1pm:30min - 12/11/2022",
              discount: "-60.000.00kz"
          ),
        ]
    ),
    CardBank(
        titleUser: "Pedro",
        addressUser: "Angola / Luanda/Morro Bento",
        cardMessage: "this is a bank card",
        histories: [
           Movimentation(
               bankName: "Banco Athantico",
               data:     "3pm:30min - 24/11/2022",
               discount: "-6.000.00kz"
           ),
          Movimentation(
              bankName: "Banco Athantico",
              data:     "3pm:30min - 24/11/2022",
              discount: "-6.000.00kz"
          ),
          Movimentation(
              bankName: "Banco Keve",
              data:     "1pm:30min - 12/11/2022",
              discount: "-60.000.00kz"
          ),
        ]
    ),
    CardBank(
        titleUser: "Augustinho",
        addressUser: "Angola / Luanda/Morro Bento",
        cardMessage: "this is a bank card",
        histories: [
          Movimentation(
              bankName: "Banco Athantico",
              data:     "3pm:30min - 24/11/2022",
              discount: "-6.000.00kz"
          ),
          Movimentation(
              bankName: "Banco Keve",
              data:     "1pm:30min - 12/11/2022",
              discount: "-60.000.00kz"
          ),
          Movimentation(
              bankName: "Banco de Fomento",
              data:     "1pm:30min - 12/11/2022",
              discount: "-5.000.00kz"
          ),
          Movimentation(
              bankName: "Banco Athantico",
              data:     "3pm:30min - 24/11/2022",
              discount: "-6.000.00kz"
          ),
          Movimentation(
              bankName: "Banco Keve",
              data:     "1pm:30min - 12/11/2022",
              discount: "-60.000.00kz"
          ),
        ]
    )
  ];

  @override
  void initState() {
    super.initState();
    _listController = AnimationController(vsync: this,duration: const Duration(milliseconds:400));
    _listPosition = Tween<Offset>(begin:const Offset(0,0) , end:  const Offset(0,700)).animate(_listController);
    _onInitLoadAnimation();

    setState((){
      sequenceColor = listAnimationManagers.length-1;
    });
    // animation listen
    _listController.addStatusListener((status) {
       if (status == AnimationStatus.completed){
          _listController.reset();
       }
    });
  }

  void dispose() {
    for (int index = 0; index < listAnimationManagers.length; ++index) {
      listAnimationManagers[index].animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
      child: Container(
        width: media.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _topMenuUser(),
             Stack(
                 children: [
                   _topDashBoard()
                 ],
             ),
             Padding(
               padding: const EdgeInsets.only(
                 left:10
               ),
               child: Row(
                 crossAxisAlignment:CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Text(
                     "Transações Recentes",
                     style: TextStyle(
                         color: Colors.black,
                         fontSize: 14,
                         fontWeight: FontWeight.bold
                     ),
                   ) ,
                   Expanded(
                     child: Container (
                       height:40,
                       padding: const EdgeInsets.only( right:20),
                       alignment: Alignment.centerRight,
                       child:const Text("Ver Todos",style: TextStyle(
                         color: Colors.black54
                       ),),
                     ),
                   )
                 ],
               ),
             ),
             const  SizedBox(height:20),
             Stack(
               children: [
                   AnimatedBuilder(
                     animation: _listController,
                     builder: (context, child){
                       return  Transform.translate(
                            offset: _listPosition.value ,
                            child: child,
                          );
                       },
                     child:CardListCount(
                       color: Colors.primaries[sequenceColor],
                       lista: LIST_ACCOUNT[sequenceColor].histories,
                     ),
                   )
               ],
             )
          ],
        ),
      ),
    )) ,
      bottomNavigationBar: Container(
        width: 120,
        height: 60,
        alignment:Alignment.center,
        padding: const EdgeInsets.only(bottom: 20 ,left: 60,right: 60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           const  Icon(Icons.home,color:Colors.black54, size: 30,)
            ,Icon(Icons.settings,color: Colors.grey.shade300,  size: 30,),
           Icon(Icons.person,color: Colors.grey.shade300,  size: 30,)
          ],
        ),
      ),
    );

  }

  Widget _topMenuUser() {
    Size media = MediaQuery.of(context).size;
    return Container(
      width: media.width,
      padding: const  EdgeInsets.only(right: 20, top: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(
                     left: 10
                  ) ,
                  child: Text("Good Morning"),
                ),
                Text(
                  "Mario Carlos Chita",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey.shade400, width: 1)),
            child: const Icon(
              Icons.refresh,
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }

  Widget _topDashBoard() {
    Size media = MediaQuery.of(context).size;

    return Container(
      width: media.width,
      height: 350,
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Stack(
        alignment: Alignment.center,
        children: List.generate(LIST_ACCOUNT.length, (index) {
          return CardBankWidget(
            index: index,
            animationController: listAnimationManagers[index].animationController,
            cardBank: LIST_ACCOUNT[index],
            positionCardBank: listAnimationManagers[index].offset,
            progressionSequence: listAnimationManagers[index].progressionSequence,
            lista: listAnimationManagers,
            widget: listAnimationManagers[index].widget,
            voidCallback: () => _onSelectedCardBank(index: index),
          );
        }),
      ),
    );
  }
  void _onInitLoadAnimation() {
    for (int index = 0; index < LIST_ACCOUNT.length; ++index) {
      AnimationController animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
      Animation<Offset> offset = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-300, 0))
          .animate(CurvedAnimation(
              parent: animationController,
              curve: Curves.easeIn
       ));

      double progressionSequence = 100.0 + (15 * index);

      AnimationManager animationManager = AnimationManager(
          animationController: animationController,
          cardBank: LIST_ACCOUNT[index],
          offset: offset,
          progressionSequence: progressionSequence,
          widget: CardBankItem(
            index: index,
            cardBank: LIST_ACCOUNT[index],
          ));
      listAnimationManagers.add(animationManager);
    }
  }
  _onSelectedCardBank({required int index}) {

    late Widget tempCurrent;
    for (int index =  LIST_ACCOUNT.length -1 ; index >= 0 && LIST_ACCOUNT.length > 1; --index) {
      if (index == LIST_ACCOUNT.length - 1) {
        setState(() {
          tempCurrent = listAnimationManagers[index].widget;
        });
      } else {
        setState(() {
          listAnimationManagers[index + 1].widget = listAnimationManagers[index].widget;
        });
      }
    }
    if (listAnimationManagers.length > 1) {
      setState(() {
        listAnimationManagers[0].widget = tempCurrent;
        if (sequenceColor > 0){
            sequenceColor --;
        } else {
          sequenceColor = listAnimationManagers.length -1;
        }
      });
    }

    _listController.forward();

  }
}
