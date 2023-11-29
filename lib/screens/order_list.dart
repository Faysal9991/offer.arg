

import 'package:arg_offer/provider/home_page_provider.dart';
import 'package:arg_offer/util/theme/app_colors.dart';
import 'package:arg_offer/util/theme/text.style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
 @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomePageProvider>(context, listen: false).tranjection();
        Provider.of<HomePageProvider>(context, listen: false).getMyOrder();
            Provider.of<HomePageProvider>(context, listen: false).getNotifcation();
    });

    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(

      builder: (context, provider,child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(children: [
              
            Container(
                        height: 200,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                            color: AppColors.primaryColorLight),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        offset: const Offset(-10, -10),
                                        blurRadius: 16.0,
                                        spreadRadius: 1),
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(4.0, 4.0),
                                        blurRadius: 16.0,
                                        spreadRadius: 1),
                                  ],
                                  color: const Color(0xFFEFEEEE),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: (){
                                       showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context).viewInsets.bottom),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Wrap(
                                      children: [
                                        Container(
                                          height: 400,
                                        child: ListView.builder(
                                          itemCount: provider.notification.length,
                                          itemBuilder: (context,index){
                                          return  SizedBox(
                                            width: MediaQuery.of(context).size.width/1.2,
                                            child: Card(
                                              
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(top: 10,bottom: 10),
                                                               child: Text(provider.notification[index].data==null?"":provider.notification[index].data!.message.toString()),
                                                                 ),
                                                            ),
                                          );
                
                                        })
                                        )],
                                    ),
                                  ),
                                );
                              },
                            );
                            
                                    },
                                    child: myAppBarIcon(Icons.notifications,provider.notification.length.toString()))
                              ),),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        offset: const Offset(-10, -10),
                                        blurRadius: 16.0,
                                        spreadRadius: 1),
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(4.0, 4.0),
                                        blurRadius: 16.0,
                                        spreadRadius: 1),
                                  ],
                                  color: const Color(0xFFEFEEEE),
                                ),
                                child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Balance: ",
                                          style: latoStyle700Bold,
                                        ),
                                        Text(
                                          provider.balance.balance ?? "0",
                                          style: latoStyle700Bold,
                                        )
                                      ],
                                    )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        offset: const Offset(-10, -10),
                                        blurRadius: 16.0,
                                        spreadRadius: 1),
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(4.0, 4.0),
                                        blurRadius: 16.0,
                                        spreadRadius: 1),
                                  ],
                                  color: const Color(0xFFEFEEEE),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:InkWell(
                                    onTap: (){
 showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context).viewInsets.bottom),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Wrap(
                                      children: [
                                        Container(
                                          height: 400,
                                        child: ListView.builder(
                                          itemCount: provider.oder.length,
                                          itemBuilder: (context,index){
                                          return  SizedBox(
                                            width: MediaQuery.of(context).size.width/1.2,
                                            child: Card(
                                              
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(top: 10,bottom: 10),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      children: [
                                                                        Text("Ammount :",style: latoStyle500Medium,),
                                                                          Text(" ${provider.oder[index].amount} ",style: latoStyle700Bold),
                                                                      ],
                                                                    ),
                                                    const SizedBox(height: 10,),
                                                                      Padding(
                                                                        padding: const EdgeInsets.all(8.0),
                                                                        child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                        crossAxisAlignment: CrossAxisAlignment.
                                                                        start,
                                                                        children: [
                                                                          Text("Offer details: ",style: latoStyle500Medium,),
                                                                            SizedBox(
                                                                              width: 200,
                                                                              child: Text(" ${provider.oder[index].title}  ",style: latoStyle700Bold)),
                                                                        ],
                                                          ),
                                                                      ),
                                          
                                                                    const SizedBox(height: 10,),
                                                                   Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      children: [
                                                                        Text("Status",style: latoStyle500Medium,),
                                                                          Text( provider.oder[index].status=="0"?"Pending":provider.oder[index].status=="1"?"Approved":provider.oder[index].status=="2"?"Decliend":"Refunded",style: latoStyle700Bold.copyWith(color: Colors.green)),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                          );
                
                                        })
                                        )],
                                    ),
                                  ),
                                );
                              },
                            );
                                    },
                                    child: myAppBarIcon(Icons.add_shopping_cart_outlined,provider.oder.length.toString()))
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                
                      
                const SizedBox(height: 20,),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Total deposit",style: latoStyle500Medium,),
                            Text(" ${provider.balance.totalDeposit} BDT",style: latoStyle700Bold),
                        ],
                      ),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Total order",style: latoStyle500Medium,),
                            Text(" ${provider.balance.totalOrder} BDT",style: latoStyle700Bold),
                        ],
                      ),
                    ),
                  ),
                ),
                  
                   Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("last_order: ",style: latoStyle500Medium,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/1.6,
                                  
                                    child: Text(" ${provider.balance.lastOrder!.title} ",style: latoStyle700Bold)),
                              ],
                            ),
                          ),
          const SizedBox(height: 10,),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("amount",style: latoStyle500Medium,),
                                Text(" ${provider.balance.lastOrder!.amount}  BDT",style: latoStyle700Bold),
                            ],
                          ),
          
                          const SizedBox(height: 10,),
                         Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Admin Notice",style: latoStyle500Medium,),
                                Text(" ${provider.balance.lastOrder!.adminNote}  BDT",style: latoStyle700Bold),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text("All  transactions",style: latoStyle800ExtraBold.copyWith(color: Colors.red),),
           const SizedBox(height: 10,),
           ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: provider.trajection.length,
            itemBuilder: (context,index){
            return       Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Ammount :",style: latoStyle500Medium,),
                                Text(" ${provider.trajection[index].amount} ",style: latoStyle700Bold),
                            ],
                          ),
          const SizedBox(height: 10,),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Payment method",style: latoStyle500Medium,),
                                Text(" ${provider.trajection[index].paymentMethod}  BDT",style: latoStyle700Bold),
                            ],
                          ),

                          const SizedBox(height: 10,),
                         Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Status",style: latoStyle500Medium,),
                                Text( provider.trajection[index].status=="0"?"Pending":provider.trajection[index].status=="1"?"Approved":provider.trajection[index].status=="2"?"Decliend":"Refunded",style: latoStyle700Bold.copyWith(color: Colors.green)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              
           })
                 ]),
          ),
        );
      }
    );
  }
}


Widget myAppBarIcon(IconData icon,String? length){
return Container(
  width: 30,
  height: 30,
  child: Stack(
    children: [
      Icon(
        icon,
       
        color: Colors.black,
        size: 30,
      ),
    length=="0"?const SizedBox.shrink():length==null?const SizedBox.shrink():length.isEmpty?const SizedBox.shrink(): Container(
        width: 30,
        height: 30,
        alignment: Alignment.topRight,
        margin: const EdgeInsets.only(top: 5),
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xffc32c37),
              border: Border.all(color: Colors.white, width: 1)),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Center(
              child: Text(
              length,
                style: const TextStyle(fontSize: 10,color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    ],
  ),
);
}