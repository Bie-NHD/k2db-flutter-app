import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:k2dbmoneyapp/core/extensions/extension_textstyle.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/dimension.dart';
import '../../../core/constant/text.dart';

// ignore: camel_case_types
class Detailed_Invoice extends StatelessWidget {
  DateTime? dateTime;
  Detailed_Invoice({Key? key, this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    dateTime ?? DateTime.now();
    dateTime = DateTime.now();
    return Scaffold(
      backgroundColor: ColorsApp.backgroundLight,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsApp.primaryColor,
        title: Text("Detailed Invoice",
          style: TextStyles.defaultStyle.semiBold.sizeAppbar.colorAppBarText,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: k8Margin / 2,),
          Center(
            child: Text('Cửa hàng A',
              style: TextStyles.defaultStyle.sizeHeading.semiBold.colorDefaultText,
            ),
          ),
          Text('Mã đơn hàng: 000111',
            style: TextStyles.defaultStyle.sizeTitleAndButton.regular.colorDefaultText,
          ),
          Text('Ngày lập hđ: $dateTime',
            style: TextStyles.defaultStyle.sizeTitleAndButton.regular.colorDefaultText,
          ),
          Text('Hình thức thanh toán: Chuyển khoản qua QR Pay',
            style: TextStyles.defaultStyle.sizeTitleAndButton.regular.colorDefaultText,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: k24Padding,
              dataRowHeight: size.height * 0.04,
              columns: [
                DataColumn(label: Text('Số lượng')),
                DataColumn(label: Text('Tên sản phẩm')),
                DataColumn(label: Text('Đơn giá')),
                DataColumn(label: Text('Thành tiền')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Sữa ông thọ')),
                  DataCell(Text('20000')),
                  DataCell(Text('20000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Sữa ông thọ đặc nhiều sữa ít đường')),
                  DataCell(Text('20000')),
                  DataCell(Text('20000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Sữa ông thọ')),
                  DataCell(Text('20000')),
                  DataCell(Text('20000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Sữa ông thọ')),
                  DataCell(Text('20000')),
                  DataCell(Text('20000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Sữa ông thọ')),
                  DataCell(Text('20000')),
                  DataCell(Text('20000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Sữa ông thọ')),
                  DataCell(Text('20000')),
                  DataCell(Text('20000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Sữa ông thọ')),
                  DataCell(Text('20000')),
                  DataCell(Text('20000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Sữa ông thọ')),
                  DataCell(Text('20000')),
                  DataCell(Text('20000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Sữa ông thọ')),
                  DataCell(Text('20000')),
                  DataCell(Text('20000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Sữa ông thọ')),
                  DataCell(Text('20000')),
                  DataCell(Text('20000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Sữa ông thọ')),
                  DataCell(Text('20000')),
                  DataCell(Text('20000')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Sữa ông thọ')),
                  DataCell(Text('20000')),
                  DataCell(Text('20000')),
                ]),
              ],
            ),
          ),
          SizedBox(height: k12Margin,),
          Divider(thickness: k8Margin / 4, height: k8Margin / 4, color: ColorsApp.hintTextColor,),
          SizedBox(height: k8Margin,),
          Row(
            children: [
              SizedBox(width: size.width * 0.35,),
              Text('Tổng cộng: 575000 VNĐ', textAlign: TextAlign.right, style: TextStyles.defaultStyle.sizeAppbar.semiBold.colorDefaultText,),
            ],
          ),
        ],
      ),
    );
  }
}
