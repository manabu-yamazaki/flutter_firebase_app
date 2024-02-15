// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/model/memo.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key, required this.title});

  final String title;

  @override
  State<TopPage> createState() => _TopPageState();
}
class _TopPageState extends State<TopPage> {
  List<Memo> memoList = [Memo(title: 'test',detail: 'test', createdDate: DateTime(2024))];

  // Future<void> fetchMemo() async {
  //   final memoCollection = await FirebaseFirestore.instance.collection('memo').get();
  //   final docs = memoCollection.docs;
  //   for(var doc in docs) {
  //     Memo fetchMemo = Memo(
  //         title: doc.data()['title'],
  //         detail: doc.data()['detail'],
  //         createdDate: doc.data()['createdDate']
  //     );
  //     memoList.add(fetchMemo);
  //   }
  //   setState(() {
  //
  //   });
  // }

  @override
  void inintState() {
    super.initState();
    // fetchMemo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: memoList.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(memoList[index].title),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
