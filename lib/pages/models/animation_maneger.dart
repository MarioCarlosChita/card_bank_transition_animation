
import 'package:animation_sequence/pages/models/card_bank.dart';
import 'package:flutter/cupertino.dart';

class AnimationManager{
  final AnimationController animationController;
  final Animation<Offset> offset;
  CardBank  cardBank ;
  Widget  widget;
  final double progressionSequence;

  AnimationManager({
    required this.animationController,
    required this.cardBank,
    required this.offset,
    required this.progressionSequence ,
    required this.widget
  });



}