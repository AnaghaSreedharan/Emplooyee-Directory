import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/EmployeeDbModel.dart';
import '../../Resource/Strings.dart';
import '../../providers/api_provider.dart';
import '../../providers/db_provider.dart';
import 'EmployeeItem.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<EmployeeDbModel> list = [];
  List<EmployeeDbModel> filteredList = [];
  bool doItJustOnce = false;

  void _filterList(value) {
    setState(() {
      filteredList = list
          .where((text) =>
              text.name!.toLowerCase().contains(value.toLowerCase()) ||
              text.email!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  _HomeState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        this.actionIcon = IconButton(
          icon: const Icon(
            Icons.search,
            size: 23,
          ),
          onPressed: () {},
        );

        setState(() {
          _searchText = "";
        });
      } else {
        _searchText = _searchQuery.text;
        this.actionIcon = IconButton(
          icon: const Icon(
            Icons.close,
            size: 23,
          ),
          onPressed: () {
            _searchQuery.clear();
            _searchText = "";
            filteredList = list;
          },
        );

        _filterList(_searchText);
      }
    });
  }

  @override
  void initState() {
    final getData = Provider.of<GetDataProvider>(context, listen: false);
    getData.getData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final getDataProvider = Provider.of<GetDataProvider>(context);
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          centerTitle: false,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: const Text(
            "Employees List",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins-Regular',
                fontWeight: FontWeight.normal),
          ),
        ),
        backgroundColor: Colors.white,
        body: getDataProvider.loading
            ? Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _searchBox(),
                  Expanded(child: _buildEmployeeListView())
                ],
              )
        );
  }

  _buildEmployeeListView() {
    return FutureBuilder(
      future: DBProvider.db.getAllEmployees(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (!doItJustOnce) {
            //You should define a bool like (bool doItJustOnce = false;) on your state.
            list = snapshot.data;
            filteredList = list;
            doItJustOnce = !doItJustOnce; //this line helps to do just once.
          }
          return ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (BuildContext context, int index) {
              return EmployeeItem(data: filteredList[index]);
            },
          );
        }
      },
    );
  }

  Widget _searchBox() {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 50,
          margin:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          child: TextFormField(
            controller: _searchQuery,
            autofocus: true,
            minLines: 1,
            maxLines: 1,
            onChanged: (value) {
              _filterList(value);
            },
            cursorColor: Colors.black,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              alignLabelWithHint: false,
              hintText: Strings.search,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: 'Poppins_Regular',
              ),
              enabled: true,
              suffixIcon: IconButton(
                  onPressed: () {
                    _searchQuery.clear();
                    this.actionIcon = IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 23,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    );
                    setState(() {});
                  },
                  icon: actionIcon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),
            ),
          ),
        )),
      ],
    );
  }

  final TextEditingController _searchQuery = TextEditingController();

  String _searchText = "";
  IconButton actionIcon = IconButton(
    icon: const Icon(
      Icons.search,
      size: 23,
      color: Colors.black,
    ),
    onPressed: () {},
  );
}
