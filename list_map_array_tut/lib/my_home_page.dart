import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  List name=[
    {
      "name":"suravi",
      "roll":"2",
      "age":"25",
      "address":[
        {
          "city":"kolkata",
          "state":"west bengal",
          "pin":"700010"
        }
      ]
    },
    {
      "name":"asda",
      "roll":"11",
      "age":"10",
      "address":[
        {
          "city":"kolkata",
          "state":"west bengal",
          "pin":"700010"
        }
      ]
    },
    {
      "name":"asas",
      "roll":"13",
      "age":"33",
      "address":[
        {
          "city":"kolkata",
          "state":"west bengal",
          "pin":"700010"
        }
      ]
    },
    {
      "name":"surazsavi",
      "roll":"23",
      "age":"34",
      "address":[
        {
          "city":"kolkata",
          "state":"west bengal",
          "pin":"700010"
        }
      ]
    },
    {
      "name":"assads",
      "roll":"34",
      "age":"32",
      "address":[
        {
          "city":"kolkata",
          "state":"west bengal",
          "pin":"700010"
        },
        {
          "city":"kolkata",
          "state":"west bengal",
          "pin":"700010"
        },

      ]
    }

  ];

  final List<Map<String, dynamic>> insuranceList =[
    {
      "CompanyName": "Aditya Birla General Insurance",
      "ProductName": "Health Insurance",
      "CoverAmount": "Rs. 500000",
      "nomineeDetails":[
        {"NomineeName": "Krishanu Sen",
          "NomineeRelation": "Father",
          "NomineeContact": "98765463512",},
        {
          "NomineeName": "Krishanu Sen",
          "NomineeRelation": "Father",
          "NomineeContact": "98765463512",
        }
      ]
    },
    {
      "CompanyName": "Aditya Birla General Insurance",
      "ProductName": "Health Insurance",
      "CoverAmount": "Rs. 500000",
      "nomineeDetails":[
        {"NomineeName": "Krishanu Sen",
          "NomineeRelation": "Father",
          "NomineeContact": "98765463512",},
        {
          "NomineeName": "Krishanu Sen",
          "NomineeRelation": "Father",
          "NomineeContact": "98765463512",
        }
      ]

    },
    {
      "CompanyName": "Aditya Birla General Insurance",
      "ProductName": "Health Insurance",
      "CoverAmount": "Rs. 500000",
      "nomineeDetails":[
        {"NomineeName": "Krishanu Sen",
          "NomineeRelation": "Father",
          "NomineeContact": "98765463512",},
        {
          "NomineeName": "Krishanu Sen",
          "NomineeRelation": "Father",
          "NomineeContact": "98765463512",
        }
      ]

    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:name.map((e) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("name: ${e["name"]}",style: const TextStyle(fontSize: 20),),
                          Text("roll: ${e["roll"]}",style: const TextStyle(fontSize: 20),),

                          Column(
                            children: e["address"].map<Widget>((address){
                            return  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("City: ${address["city"]}",style: const TextStyle(fontSize: 20),),
                                Text("State:  ${address["state"]}",style: const TextStyle(fontSize: 20),),
                                Text("Pin: :${address["pin"]}",style: const TextStyle(fontSize: 20),),
                              ],
                            );

                            }).toList(),
                          ),
                          SizedBox(height: 10,)
                        ],
                      );
                      }).toList()
    ),

                    SizedBox(height: 150,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:name.map((e) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e["name"].toString(),style: const TextStyle(fontSize: 20),),
                          SizedBox(height: 10,)
                        ],
                      );
                      }).toList()
    ),

                    SizedBox(height: 100,),

                    Column(
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: insuranceList.length,
                          itemBuilder: (context, index) {
                            var insurance =insuranceList[index];
                            return ListTile(
                              title: Text(insurance["CompanyName"]),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(insurance["ProductName"]),
                                  Text(insurance["CoverAmount"]),
                                  Column(
                                    children: insurance["nomineeDetails"].map<Widget>((e){
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(e["NomineeName"]),
                                          Text(e["NomineeContact"]),
                                          Text(e["NomineeRelation"]),
                                        ],
                                      );
                                    }).toList(),
                                  )
                                ],
                              ),
                            );

                        },)
                      ],
                    )



                  ],
                ),
              ),
            )
    );
  }

}