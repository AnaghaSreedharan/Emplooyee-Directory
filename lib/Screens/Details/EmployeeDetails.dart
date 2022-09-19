import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Models/EmployeeDbModel.dart';
import '../../Resource/Strings.dart';
import '../../Resource/colors.dart';

class EmployeeDetails extends StatelessWidget {
  const EmployeeDetails({Key? key, required this.data}) : super(key: key);
  final EmployeeDbModel data;


  @override
  Widget build(BuildContext context) {
    const double verticalGap = 20;

    LatLng latlng =  LatLng(double.parse(data.latitude!), double.parse(data.longitude!));
    final Completer<GoogleMapController> _controller = Completer();
    Set<Marker> markers = {
      Marker(
          markerId: MarkerId('"1"'),
          position: latlng,
          infoWindow: InfoWindow(
              title: 'The title of the marker'
          )
      )
    };

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          Strings.employeeDetails,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Poppins-Regular',
              fontWeight: FontWeight.normal),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            topLeft: Radius.circular(5.0)),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitWidth,
                            imageUrl: data.profile_image.toString(),
                            errorWidget: (context, url, error) =>
                                Image.asset('lib/Assets/Images/img.png'),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 10, right: 10),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 7,
                            ),
                            Text(data.name ?? Strings.notAvailable,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins-Regular')),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 10,),
            Card(
                elevation: 5,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: verticalGap,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(
                        Strings.email,
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 14,
                            color: textColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        data.email ?? Strings.notAvailable,
                        style: const TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: verticalGap,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(
                        Strings.phone,
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 14,
                            color: textColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        data.phone ??  Strings.notAvailable,
                        style: const TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: verticalGap,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Website",
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 14,
                            color: textColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        data.website ?? "Not Available",
                        style: const TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: verticalGap,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Address",
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 14,
                            color: textColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        data.address ?? Strings.notAvailable,
                        style: const TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: verticalGap,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Company",
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 14,
                            color: textColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.company_name ?? Strings.notAvailable,
                            style: const TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),

                          ),
                          data.bs ==null?Container():Text(
                        data.bs!,
                        style: const TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),),
                          data.catchPhrase==null?Container():Text(
                            data.catchPhrase!,
                            style: const TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: verticalGap,
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Card(
                elevation: 5,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: verticalGap,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Location",
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 14,
                            color: textColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: double.infinity,
                        height: 220,
                        color: colorPrimary,
                        child: GoogleMap(
                          markers: markers,
                          initialCameraPosition: CameraPosition(target: latlng, zoom: 10.0),
                          mapType: MapType.normal,
                          zoomControlsEnabled: false,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        )),
                  ],
                )),


            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }
}
