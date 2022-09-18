import 'package:employee_app/Models/EmployeeModel.dart';
import 'package:employee_app/Utils/Utils.dart';
import 'package:flutter/material.dart';

import '../../Models/EmployeeDbModel.dart';
import '../../Resource/Strings.dart';
import '../../Services/EmployeeService.dart';
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
          .where((text) => text.name!.toLowerCase().contains(value.toLowerCase())||text.email!.toLowerCase().contains(value.toLowerCase()))
          .toList(); // I don't understand your Word list.
    });
  }
  _HomeState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        this.actionIcon = IconButton(
          icon: Icon(
            Icons.search,
            size: 23,
          ), onPressed: () {  },
        );

        setState(() {
          _IsSearching = false;
          _searchText = "";
          // _searchResultFinalList.clear();
        });
      } else {
        _IsSearching = true;
        _searchText = _searchQuery.text;

        this.actionIcon = IconButton(
          icon: Icon(
            Icons.close,
            size: 23,
          ), onPressed: () {
          _searchText="";
          _searchQuery.text = "";
          setState(() {

          });

        },
        );

        _filterList(_searchText);
      }
    });
  }

  List<EmployeeModel> employeeList = [];
  //
  getEmployeeList() async {
    try {
      employeeList = await EmployeeService.getEmployeeList();
      showToast(employeeList.length.toString());
    } catch (e) {
      showErrorMessage(e);
    }
  }
@override
void initState() {
    getEmployeeList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
        actions: [

        ],
      ),
      backgroundColor: Colors.white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _customAppBar(),
          Expanded(child:  _buildEmployeeListView())
        ],
      )

/*
      Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return PatientItem();
              },
            )
          ],
        ),
      ),
*/
    );
  }

_buildEmployeeListView() {
  return FutureBuilder(
    future: DBProvider.db.getAllEmployees(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        if (!doItJustOnce) {
          //You should define a bool like (bool doItJustOnce = false;) on your state.
          list = snapshot.data;
          filteredList = list;
          doItJustOnce = !doItJustOnce; //this line helps to do just once.
        }
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.black12,
          ),
          itemCount: filteredList.length,
          itemBuilder: (BuildContext context, int index) {
            return EmployeeItem(data: filteredList[index]);
          },
        );
      }
    },
  );
}

Widget _customAppBar() {
  return Container(
    child: Column(
      children: <Widget>[
        Row(
          children: [
            Expanded(
                child: Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 10,top:10),
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
                      contentPadding: EdgeInsets.all(10),
                      alignLabelWithHint: false,
                      hintText: Strings.search,
                      // hintText: "Search makes, models or features...",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins_Regular',
                      ),
                      enabled: true,
                      prefixIcon: IconButton(
                        icon: new Icon(Icons.arrow_back),
                        color: Colors.black,
                        onPressed: () => {Navigator.pop(context)},
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _searchQuery.clear();
                            this.actionIcon = IconButton(
                              icon: Icon(
                                Icons.search,
                                size: 23,
                                color: Colors.black,
                              ), onPressed: () {  },
                            );
                            setState(() {});
                          },
                          icon: actionIcon),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ],
    ),
  );
}

final TextEditingController _searchQuery = new TextEditingController();
// List<SearchHomeModel> _searchResultFinalList = [];
bool _IsSearching = false;
String _searchText = "";
IconButton actionIcon = IconButton(
  icon: Icon(
    Icons.search,
    size: 23,
    color: Colors.black,
  ), onPressed: () {  },
);



}
