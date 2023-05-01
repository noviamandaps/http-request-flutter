import 'package:flutter/material.dart';
import 'package:http_request/api_data_source.dart';
import 'package:http_request/detail_model.dart';

class DetailUsers extends StatefulWidget {
  final int idUser;

  const DetailUsers({required this.idUser, Key? key}) : super(key: key);

  @override
  State<DetailUsers> createState() => _DetailUsersState();
}

class _DetailUsersState extends State<DetailUsers> {
  late Future<DetailModel> _futureDetailModel;

  @override
  void initState() {
    super.initState();
    _futureDetailModel = ApiDataSource.instance.loadDetailUser(widget.idUser).then((json) => DetailModel.fromJson(json));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail User ${widget.idUser}"),
      ),
      body: _buildDetailUserBody(),
    );
  }

  Widget _buildDetailUserBody() {
    return Center(
      child: FutureBuilder<DetailModel>(
        future: _futureDetailModel,
        builder: (BuildContext context, AsyncSnapshot<DetailModel> snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }
          if (snapshot.hasData) {
            DetailModel detailModel = snapshot.data!;
            return Column(
              children: [
                Image.network(detailModel.data!.avatar!),
                Text(
                  detailModel.data!.firstName! + " " + detailModel.data!.lastName!,
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  detailModel.data!.email!,
                  style: TextStyle(fontSize: 17),
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

}