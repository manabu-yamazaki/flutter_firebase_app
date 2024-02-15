class Memo {
  String title;
  String detail;
  DateTime createdDate;
  DateTime? updatedDate;

  Memo({
    required this.title,
    required this.detail,
    required this.createdDate,
    this.updatedDate,
  });
}

void test() {
  Memo newMemo = Memo(
    title: 'title',
    detail: 'detail',
    createdDate: DateTime.now(),
  );
}