import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  List name = ["peter", "gerges", "shaady", "fady", "gogo"];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filterdata =
        name.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
        itemCount: query == "" ? name.length : filterdata.length,
        itemBuilder: (_, i) {
          return InkWell(
              onTap: () {
                query = query == "" ? name[i] : filterdata[i];
              },
              child: Container(
                  child: query != ""
                      ? Text("${filterdata[i]}")
                      : Text("${name[i]}")));
        });
  }
}
