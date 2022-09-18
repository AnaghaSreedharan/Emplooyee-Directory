import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Models/EmployeeDbModel.dart';
import '../../Resource/Strings.dart';
import '../../Resource/colors.dart';
class EmployeeDetails extends StatelessWidget {
  const EmployeeDetails({Key? key, required this.data}) : super(key: key);
  final EmployeeDbModel data;


  @override
  Widget build(BuildContext context) {
    const double verticalGap = 20;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        centerTitle: false,
        leading: InkWell(
          onTap: (){
           Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text("Emplooyee Details",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Poppins-Regular',
              fontWeight: FontWeight.normal
          ),),

      ),
      backgroundColor:Colors.white,
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Card(
                      color: Colors.white,
                      elevation: 3,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child:
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5.0),
                                      topLeft: Radius.circular(5.0)),
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.fitWidth,
                                      imageUrl: data.profile_image.toString(),
                                      errorWidget: (context, url, error) =>
                                          Image.asset('lib/Assets/Images/img.png'),
                                    ),
                                  ),
                                ),),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only( left: 10, right: 10),
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 7,),
                                      Text( data.name??"Not available",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Poppins-Regular')),
                                      SizedBox(height: 7,),
                                      Text(data.email??"",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Poppins-Regular')),
                                      SizedBox(height: 7,),
                                      Text(data.phone??Strings.notAvailable,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Poppins-Regular')),
                                      SizedBox(height: 7,),


                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      )),
                ),

                Card(
                    elevation: 5,
                    shadowColor: Colors.grey.shade100,
                    margin: const EdgeInsets.all(15),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: verticalGap,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          child:
                          Text(
                            "Website",
                            style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontSize: 14,
                                color: textColor,
                                fontWeight: FontWeight.normal),
                          ),),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          child:
                          Text(
                            data.website??"Not Available",
                            style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),),
                        const SizedBox(
                          height: verticalGap,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          child:
                          Text(
                            "Address",
                            style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontSize: 14,
                                color: textColor,
                                fontWeight: FontWeight.normal),
                          ),),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          child:
                          Text(
                            data.address??Strings.notAvailable,
                            style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),),
                        const SizedBox(
                          height: verticalGap,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          child:
                          Text(
                            "Company",
                            style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontSize: 14,
                                color: textColor,
                                fontWeight: FontWeight.normal),
                          ),),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          child:
                          Text(
                            data.company_name??Strings.notAvailable,
                            style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),),

                        const SizedBox(
                          height: verticalGap,
                        ),
                      ],
                    )


                ),

                SizedBox(height: 10,),

              ]
          ),
        ),),

    );
  }
}
