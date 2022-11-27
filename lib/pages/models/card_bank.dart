


class CardBank{

  final String titleUser;
  final String addressUser;
  final String cardMessage;
  final List<Movimentation> histories;
  CardBank({
   required this.titleUser,
   required this.addressUser,
   required this.cardMessage,
   required this.histories
  });
}


class Movimentation{
  final String bankName;
  final String data;
  final String discount;

  Movimentation({
   required this.bankName,
   required this.data,
   required this.discount
  });
}
