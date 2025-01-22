import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import '../payment_services/payment_service.dart';

class PlanList extends StatefulWidget {
  final int duration;
  final int price;
  final int discount;

  PlanList(
      {super.key,
      required this.duration,
      required this.price,
      required this.discount});

  @override
  State<PlanList> createState() => _PlanListState();
}

class _PlanListState extends State<PlanList> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.duration}-Month Plan",
                    style: TextStyle(
                      fontSize: screenSize.width * 0.045,
                      fontWeight: FontWeight.bold,
                      // color: darkMode.value ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "\$${widget.price}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                        ),
                      ),
                      Gap(14),
                      (widget.discount == 0)
                          ? SizedBox()
                          : Text(
                              "Save ${widget.discount}%",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade400,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: Icon(
                Icons.payment,
                color: Colors.white,
              ),
              label: Text(
                context.translator.pay,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onPressed: () async {
                await PaymentService.paymentService.makePayment(widget.price);
              },
            ),
          ],
        ),
      ],
    );
  }
}
