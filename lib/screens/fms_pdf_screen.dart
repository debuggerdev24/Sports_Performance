import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:sportperformance/extensions/context_extension.dart';

class FmsPdfScreen extends StatefulWidget {
  const FmsPdfScreen({super.key});

  @override
  State<FmsPdfScreen> createState() => _FmsPdfScreenState();
}

class _FmsPdfScreenState extends State<FmsPdfScreen> {
  late List testList;
  @override
  Widget build(BuildContext context) {
    testList = [
      context.translator.deepSquat,//"SENTADILLA PROFUNDA",
      context.translator.fencePass,//"PASO DE VALLA",
      context.translator.stringInLine,//"ZANCADA EN LINEA",
      context.translator.shoulderMobility,//"MOVILIDAD DE HOMBROS",
      context.translator.shoulderDiscardTest,//"PRUEBA DE DESCARTE DE HOMBRO",
      context.translator.shoulderMobilityAgain,//"MOVILIDAD DE HOMBROS",
      context.translator.activeStraightLegRaise,//"ELEVACIÓN ACTIVA DE PIERNARECTA",
      context.translator.trunkStabilityFlexion,//"FLEXIÓN CON ESTABILIDAD DE TRONCO",
      context.translator.extensionDiscardTest,//"PRUEBA DESCARTE EXTENSIÓN",
      context.translator.rotaryStability,//"ESTABILIDAD ROTATORIA",
      context.translator.flexionDiscardTest,//"PRUEBA DESCARTE FLEXIÓN",
      context.translator.ankleFlexibility,//"FLEXIBILIDAD DE TOBILLO"
    ];
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: PdfPreview(
        build: (format) => generatePdf(screenSize,testList),
      ),
    );
  }
}

Future<Uint8List> generatePdf(Size screenSize,List testList) async {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(children: [
        pw.Table(
          border: pw.TableBorder.all(color: const PdfColor.fromInt(0xff575757)),
          defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: pw.FixedColumnWidth(95),
            1: pw.FixedColumnWidth(80),
            2: pw.FixedColumnWidth(80),
            // 3: pw.FixedColumnWidth(75),
          },
          children: [
            //todo ---------------------> Table Head
            pw.TableRow(
              decoration: const pw.BoxDecoration(
                color: PdfColor.fromInt(0xffb5b3b3),
              ),
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8.0),
                  child: pw.Center(
                    child: pw.Text(
                      "TEST",
                      style: const pw.TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                pw.Center(
                  child: pw.Text(
                    "RAW SCORE",
                    style: const pw.TextStyle(fontSize: 18),
                  ),
                ),
                pw.Center(
                  child: pw.Text(
                    "FINAL SCORE",
                    style: const pw.TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            ...List.generate(
              testList.length,
              (index) => buildTableRow(testList[index], index,screenSize),
            ),
          ],
        ),
      ]),
    ),
  );
  return pdf.save();
}



pw.TableRow buildTableRow(String data, int index,Size screenSize) {
  return pw.TableRow(
    children: [
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 08, horizontal: 2),
        child: pw.Center(
          child: pw.Text(
            textAlign: pw.TextAlign.center,
            data,
            style: pw.TextStyle(fontSize: screenSize.width * 0.033),
          ),
        ),
      ),
      (index == 0 || index == 6 || index == 7 || index == 9)
          ? pw.Center(
              child: pw.Text("-"),
            )
          : pw.Table(
              border: pw.TableBorder.all(color: const PdfColor.fromInt(0xff575757)),
              defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: pw.FixedColumnWidth(40),
                1: pw.FixedColumnWidth(60),
                // 3: pw.FixedColumnWidth(75),
              },
              children: [
                pw.TableRow(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 4),
                      child: pw.Center(
                        child: pw.Text("I",style: pw.TextStyle(fontSize: screenSize.width * 0.038)),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 4),
                      child: pw.Center(
                        child: pw.Text("-"),
                      ),
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 4),
                      child: pw.Center(
                        child: pw.Text("D",style: pw.TextStyle(fontSize: screenSize.width * 0.038)),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 4),
                      child: pw.Center(
                        child: pw.Text("-"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            pw.Center(
              child: pw.Text("-"),
            ),
    ],
  );
}
