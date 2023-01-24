import 'package:flutter/material.dart';
import 'package:shopmy/Widget/load.dart';
import 'package:shopmy/data/myResponse.dart';


import '../Widget/OrderItem.dart';
class myOrder extends StatelessWidget {
  const myOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
        mainAxisAlignment: MainAxisAlignment.start,

          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back,color: Colors.black,),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("MyOrder",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),),
            ),
Spacer()
          ],
        ),

      ),
      body: FutureBuilder(
        future: myResponse.order_list(),

    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    if (snapshot.hasData) {

    return ListView(
    children: [
    for(int i=1;i<snapshot.data.length;i++)

    OrderItem(
      img: snapshot.data['data'][i]['product']['image'].toString(),

      id: snapshot.data['data'][i]['product']['id'].toString(),

      title: snapshot.data['data'][i]['product']['title'].toString(),
    //status
      status: snapshot.data['data'][i]['status'].toString(), price: '',

    ),
    ],
    );
    }
    else return loading();
    }
      ),
    );
  }
}
