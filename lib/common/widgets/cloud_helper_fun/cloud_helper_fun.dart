import 'package:flutter/material.dart';

class CloudHelperFun {
  static Widget? checkRecordState<p>(
      {required AsyncSnapshot<List<p>> snapshot,
      Widget? loader,
      Widget? error,
      Widget? nothingFound}) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) return loader;
      return const Center(child: CircularProgressIndicator());
    }
    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      if (nothingFound != null) return nothingFound;
      return const Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError) {
      if (error != null) return error;
      return const Center(child: CircularProgressIndicator());
    }
    return null;
  }
}
