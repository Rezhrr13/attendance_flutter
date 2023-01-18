class HistoryList {
  HistoryList({
    this.date = '',
    this.clockindate = '',
    this.clockoutdate = '',
  });

  String date;
  String clockindate;
  String clockoutdate;

  static List<HistoryList> cardList = <HistoryList>[
    // HistoryList(
    //   date: '17 Jan 2022',
    //   clockindate: '07:45',
    //   clockoutdate: '17:45',
    // ),
  ];
  static List<HistoryList> cardList2 = <HistoryList>[
    // HistoryList(
    //   date: '17 Jan 2022',
    //   clockindate: '07:45',
    //   clockoutdate: '17:45',
    // ),
  ];
}

class AttnList {
  AttnList({
    this.date = '',
    this.id,
    this.clockindate = '',
    this.clockoutdate = '',
  });

  int id;
  String date;
  String clockindate;
  String clockoutdate;

  static List<AttnList> cardList = <AttnList>[
    // AttnList(
    //   date: '17 Jan 2022',
    //   clockindate: '07:45',
    //   clockoutdate: '17:45',
    // ),
  ];
}
