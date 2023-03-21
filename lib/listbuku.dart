import 'package:flutter/material.dart';
import 'data_buku.dart';
import 'detailbuku.dart';

class halamanList extends StatelessWidget {
  const halamanList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Data Buku'),
      ),
      body: ListView.builder(
          itemCount: listBuku.length,
          itemBuilder: (context, index) {
            final DataBuku buku = listBuku[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => detailBuku(buku: buku)));
              },
              child: Card(
                child: Row(
                  children: [
                    Container(
                      width:MediaQuery.of(context).size.width/3,
                      child: Image.network(buku.imageLink),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(buku.title,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                          ),
                          SizedBox(height: 10,),
                          Text(buku.author,
                          style: TextStyle(fontStyle: FontStyle.italic),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
