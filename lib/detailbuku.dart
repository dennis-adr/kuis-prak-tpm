import 'package:flutter/material.dart';
import 'package:kuis123200169/data_buku.dart';

class detailBuku extends StatefulWidget {
  final DataBuku buku;
  const detailBuku({Key? key, required this.buku}) : super(key: key);

  @override
  State<detailBuku> createState() => _detailBukuState();
}

class _detailBukuState extends State<detailBuku> {
  statusbutton() {
    if (widget.buku.isAvailable == false) {
      return null;
    } else {
      return () {
        String pesan = " ";
        if (widget.buku.isAvailable == true) {
          setState(() {
            pesan = "Berhasil Meminjam Buku!";
            widget.buku.isAvailable = false;
          });
        }
        SnackBar snackBar = SnackBar(
          content: Text(pesan),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.buku.title),
        actions: [
          IconButton(
            onPressed: ()  {
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Container(
                  height: 300,
                  width: 200,
                  padding: const EdgeInsets.all(10),
                  child: Image.network(widget.buku.imageLink),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Judul                        : " +
                          widget.buku.title),
                      Text("Penulis                     : " +
                          widget.buku.author),
                      Text("Bahasa                     : " +
                          widget.buku.language),
                      Text("Jumlah Halaman    : " +
                          widget.buku.pages.toString()),
                      Text("Tahun Terbit            : " +
                          widget.buku.year.toString()),
                      Row(children: [
                        Text("Status                       : "),
                        widget.buku.isAvailable ?
                              Text("Tersedia", style: TextStyle(color: Colors.green))
                            : Text("Tidak tersedia", style: TextStyle(color: Colors.red)),
                      ]),
                    ]),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: statusbutton(),
                  child: const Text('Pinjam Buku'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
