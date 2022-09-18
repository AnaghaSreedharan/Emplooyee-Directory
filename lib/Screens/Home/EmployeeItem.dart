import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Models/EmployeeDbModel.dart';
import '../../Resource/colors.dart';
import '../Details/EmployeeDetails.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem({Key? key, required this.data}) : super(key: key);
  final EmployeeDbModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EmployeeDetails(
              data: data,
            ),
          ));
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
          color: Colors.white,
          child: Material(
            borderRadius: BorderRadius.circular(5),
            elevation: 2,
            child: Container(
                padding: const EdgeInsets.all(18),
                // width: double.infinity,
                color: primeGreen.withOpacity(0.1),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        width: 88,
                        height: 88,
                        alignment: Alignment.center,
                        imageUrl: data.profile_image.toString(),
                        placeholder: (context, url) => Center(
                            child: SizedBox(
                          height: 10,
                          width: 10,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColor),
                          ),
                        )),
                        errorWidget: (context, url, error) => Image.asset(
                          'lib/Assets/Images/img.png',
                          width: 88,
                          height: 88,
                          fit: BoxFit.cover,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name!,
                          style: const TextStyle(
                              fontFamily: "Poppins-Regular",
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 16.0),
                        ),
                        Text(
                          data.company_name ?? "Not available",
                          style: const TextStyle(
                              fontFamily: "Poppins-Regular",
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14.0),
                        ),
                        Text(
                          data.email ?? "Not available",
                          style: const TextStyle(
                              fontFamily: "Poppins-Regular",
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 12.0),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ));
  }
}
