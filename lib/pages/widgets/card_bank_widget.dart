import 'package:animation_sequence/pages/models/animation_maneger.dart';
import 'package:animation_sequence/pages/models/card_bank.dart';
import 'package:flutter/material.dart';

class CardBankWidget  extends  StatefulWidget{

  final AnimationController animationController;
  final Animation<Offset> positionCardBank;
  final CardBank cardBank;
  final List<AnimationManager>  lista;
  final int index;
  final double progressionSequence;
  final Widget widget;
  final VoidCallback voidCallback;

  CardBankWidget({
    required this.animationController,
    required this.cardBank,
    required this.positionCardBank,
    required this.index,
    required this.progressionSequence ,
    required this.lista,
    required this.widget,
    required this.voidCallback
  });
  _CardBankWidget createState() => _CardBankWidget();
}

class _CardBankWidget extends State<CardBankWidget>{


  @override
  void initState() {
    super.initState();
    widget.animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
         widget.animationController.reset();
         widget.voidCallback();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 600),
      top: widget.progressionSequence,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: widget.animationController,
        builder: (context, child) {
          return Transform.translate(
            offset: widget.positionCardBank.value,
            child: child,
          );
        },
        child: Transform.scale(
          scale: 1 - (.05 * (1 - widget.index)),
          child: InkWell(
            onTap: (){
              if (widget.lista.length > 1){
                   widget.animationController.forward();
              }
            },
            child: widget.widget,
          ),
        ),
      ),
    );
  }


}
