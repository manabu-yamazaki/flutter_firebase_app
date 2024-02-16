import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/model/memo.dart';
import 'package:flutter_firebase_app/pages/add_edit_memo_page.dart';
import 'package:flutter_firebase_app/pages/memo_detail_page.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key, required this.title});

  final String title;

  @override
  State<TopPage> createState() => _TopPageState();
}
class _TopPageState extends State<TopPage> {
  final memoCollection = FirebaseFirestore.instance.collection('memo');
  // List<Memo> memoList = [];

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
  
  //   });
  // }

  Future<void> deleteMemo(String id) async {
    final doc = FirebaseFirestore.instance.collection('memo').doc(id);
    await doc.delete();
  }

  // @override
  // void initState() {
  //   debugPrint('test');
  //   super.initState();
  //   fetchMemo();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: memoCollection.orderBy('createdDate', descending: true).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if(!snapshot.hasData) {
            return const Center(child: Text('データがありません'),);
          }

          final docs = snapshot.data!.docs;
          return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index){
                Map<String, dynamic> data = docs[index].data() as Map<String, dynamic>;
                final Memo fetchMemo = Memo(
                  id: docs[index].id,
                  title: data['title'],
                  detail: data['detail'],
                  createdDate: data['createdDate'],
                  updatedDate: data['updatedDate'],
                );
                return ListTile(
                  title: Text(fetchMemo.title),
                  trailing: IconButton(
                    onPressed: () {
                      showModalBottomSheet(context: context, builder: (context) {
                        return SafeArea(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => AddEditMemoPage(currentMemo: fetchMemo)));
                                },
                                leading: const Icon(Icons.edit),
                                title: const Text('編集'),
                              ),
                              ListTile(
                                onTap: () async {
                                  await deleteMemo(fetchMemo.id);
                                  Navigator.pop(context);
                                },
                                leading: const Icon(Icons.delete),
                                title: const Text('削除'),
                              ),
                            ],
                          ),
                        );
                      });
                    },
                    icon: const Icon(Icons.edit)
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MemoDetailPage(fetchMemo)));
                  },
                );
              }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const AddEditMemoPage()));
              },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
