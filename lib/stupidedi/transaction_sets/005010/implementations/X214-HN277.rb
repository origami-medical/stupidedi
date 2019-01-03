# frozen_string_literal: true
module Stupidedi
  module TransactionSets
    module FiftyTen
      module Implementations
        module X214
          b = Builder
          d = Schema
          r = SegmentReqs
          e = ElementReqs
          s = SegmentDefs

          HN277 = b.build("HN", "277", "Health Care Claim Acknowledgement",
            d::TableDef.header("Table 1 - Header",
              b::Segment(100, s::ST, "Transaction Set Header",
                r::Required, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Transaction Set Identifier Code", b::Values("277")),
                b::Element(e::Required,    "Transaction Set Control Number"),
                b::Element(e::Required,    "Version, Release, or Industry Identifier", b::Values("005010X214"))),
              b::Segment(200, s::BHT, "Beginning of Hierarchical Transaction",
                r::Required, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Hierarchical Structure Code", b::Values("0085")),
                b::Element(e::Required,    "Transaction Set Purpose Code", b::Values("08")),
                b::Element(e::Required,    "Originator Application Transaction Identifier", b::MaxLength(30)),
                b::Element(e::Required,    "Transaction Set Creation Date"),
                b::Element(e::Required,    "Transaction Set Creation Time"),
                b::Element(e::Required,    "Transaction Type Code", b::Values("TH")))),

            d::TableDef.detail("Table 2 - Information Source Detail",
              d::LoopDef.build("2000A INFORMATION SOURCE LEVEL",
                d::RepeatCount.bounded(1),
                b::Segment(100, s::HL, "Information Source Level",
                  r::Required, d::RepeatCount.bounded(1),
                  b::Element(e::Required,    "Hierarchical ID Number"),
                  b::Element(e::NotUsed,     "Hierarchical Parent ID Number"),
                  b::Element(e::Required,    "Hierarchical Level Code", b::Values("20")),
                  b::Element(e::Required,    "Hierachical Child Code", b::Values("1"))),

                d::LoopDef.build("2100A INFORMATION SOURCE NAME",
                  d::RepeatCount.bounded(1),
                  b::Segment(500, s::NM1, "Information Source Name",
                    r::Required, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Entity Identifier Code", b::Values("AY", "PR")),
                    b::Element(e::Required,    "Entity Type Qualifier", b::Values("2")),
                    b::Element(e::Required,    "Information Source Name"),
                    b::Element(e::NotUsed,     "Name First"),
                    b::Element(e::NotUsed,     "Name Middle"),
                    b::Element(e::NotUsed,     "Name Prefix"),
                    b::Element(e::NotUsed,     "Name Suffix"),
                    b::Element(e::Required,    "Identification Code Qualifier", b::Values("46", "FI", "PI")),
                    b::Element(e::Required,    "Information Source Identifier"),
                    b::Element(e::NotUsed,     "Entity Relationship Code"),
                    b::Element(e::NotUsed,     "Entity Identifier Code"),
                    b::Element(e::NotUsed,     "Name Last or Organization Name"))),

                d::LoopDef.build("2200A TRANSMISSION RECEIPT CONTROL IDENTIFIER",
                  d::RepeatCount.bounded(1),
                  b::Segment( 900, s::TRN, "Transmission Receipt Control Identifier",
                    r::Required, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Trace Type Code", b::Values("1")),
                    b::Element(e::Required,    "Information Source Application Trace Identifier"),
                    b::Element(e::NotUsed,     "Originating Company Identifier"),
                    b::Element(e::NotUsed,     "Reference Identification")),
                  b::Segment(1200, s::DTP, "Information Source Receipt Date",
                    r::Required, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Date Time Qualifier", b::Values("050")),
                    b::Element(e::Required,    "Date Time Period Format Qualifier", b::Values("D8")),
                    b::Element(e::Required,    "Information Source Receipt Date")),
                  b::Segment(1200, s::DTP, "Information Source Process Date",
                    r::Required, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Date Time Qualifier", b::Values("009")),
                    b::Element(e::Required,    "Date Time Period Format Qualifier", b::Values("D8")),
                    b::Element(e::Required,    "Information Source Process Date"))))),

            d::TableDef.detail("Table 2 - Information Receiver Detail",
              d::LoopDef.build("2000B INFORMATION RECEIVER LEVEL",
                d::RepeatCount.bounded(1),
                b::Segment(100, s::HL, "Information Receiver Level",
                  r::Required, d::RepeatCount.bounded(1),
                  b::Element(e::Required,    "Hierarchical ID Number"),
                  b::Element(e::Required,    "Hierarchical Parent ID Number"),
                  b::Element(e::Required,    "Hierarchical Level Code", b::Values("21")),
                  b::Element(e::Required,    "Hierachical Child Code", b::Values("0", "1"))),

                d::LoopDef.build("2100B INFORMATION RECEIVER NAME",
                  d::RepeatCount.bounded(1),
                  b::Segment(500, s::NM1, "Information Receiver Name",
                    r::Required, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Entity Identifier Code", b::Values("41")),
                    b::Element(e::Required,    "Entity Type Qualifier", b::Values("1", "2")),
                    b::Element(e::Required,    "Information Receiver Last or Organizational Name"),
                    b::Element(e::Situational, "Information Receiver First Name"),
                    b::Element(e::Situational, "Information Receiver Middle Name or Initial"),
                    b::Element(e::NotUsed,     "Name Prefix"),
                    b::Element(e::NotUsed,     "Name Suffix"),
                    b::Element(e::Required,    "Identification Code Qualifier", b::Values("46")),
                    b::Element(e::Required,    "Information Receiver Primary Identifier"),
                    b::Element(e::NotUsed,     "Entity Relationship Code"),
                    b::Element(e::NotUsed,     "Entity Identifier Code"),
                    b::Element(e::NotUsed,     "Name Last or Organization Name"))),

                d::LoopDef.build("2200B INFORMATION RECEIVER APPLICATION TRACE IDENTIFIER",
                  d::RepeatCount.bounded(1),
                  b::Segment( 900, s::TRN, "Information Receiver Application Trace Identifier",
                    r::Required, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Trace Type Code", b::Values("2")),
                    b::Element(e::Required,    "Claim Transaction Batch Number"),
                    b::Element(e::NotUsed,     "Originating Company Identifier"),
                    b::Element(e::NotUsed,     "Reference Identification")),
                  b::Segment(1000, s::STC, "Information Receiver Status Information",
                    r::Required, d::RepeatCount.unbounded,
                    b::Element(e::Required,    "HEALTH CARE CLAIM STATUS",
                      b::Element(e::Required,    "Health Care Claim Status Category Code"), # @todo: CodeSource.external("507")
                      b::Element(e::Required,    "Health Care Claim Status Code"),          # @todo: CodeSource.external("508")
                      b::Element(e::Situational, "Entity Identifier Qualifier", b::Values("36", "40", "41", "AY", "PR")),
                      b::Element(e::NotUsed,     "Code List Qualifier Code")),
                    b::Element(e::Required,    "Status Information Effective Date"),
                    b::Element(e::Required,    "Action Code", b::Values("U", "WQ")),
                    b::Element(e::Required,    "Total Submitted Charges for Unit Work"),
                    b::Element(e::NotUsed,     "Monetary Amount"),
                    b::Element(e::NotUsed,     "Date"),
                    b::Element(e::NotUsed,     "Payment Method Code"),
                    b::Element(e::NotUsed,     "Date"),
                    b::Element(e::NotUsed,     "Check Number"),
                    b::Element(e::Situational, "HEALTH CARE CLAIM STATUS",
                      b::Element(e::Required,    "Health Care Claim Status Category Code"), # @todo: CodeSource.external("507")
                      b::Element(e::Required,    "Health Care Claim Status Code"),          # @todo: CodeSource.external("508")
                      b::Element(e::Situational, "Entity Identifier Qualifier", b::Values("36", "40", "41", "AY", "PR")),
                      b::Element(e::NotUsed,     "Code List Qualifier Code")),
                    b::Element(e::Situational, "HEALTH CARE CLAIM STATUS",
                      b::Element(e::Required,    "Health Care Claim Status Category Code"), # @todo: CodeSource.external("507")
                      b::Element(e::Required,    "Health Care Claim Status Code"),          # @todo: CodeSource.external("508")
                      b::Element(e::Situational, "Entity Identifier Qualifier", b::Values("36", "40", "41", "AY", "PR")),
                      b::Element(e::NotUsed,     "Code List Qualifier Code")),
                    b::Element(e::NotUsed,     "Free-form Message Text")),
                  b::Segment(1210, s::QTY, "Total Accepted Quantity",
                    r::Situational, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Quantity Qualifier", b::Values("90")),
                    b::Element(e::Required,    "Total Accepted Quantity"),
                    b::Element(e::NotUsed,     "COMPOSITE UNIT OF MEASURE"),
                    b::Element(e::NotUsed,     "Free-form Information")),
                  b::Segment(1210, s::QTY, "Total Rejected Quantity",
                    r::Situational, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Quantity Qualifier", b::Values("AA")),
                    b::Element(e::Required,    "Total Rejected Quantity"),
                    b::Element(e::NotUsed,     "COMPOSITE UNIT OF MEASURE"),
                    b::Element(e::NotUsed,     "Free-form Information")),
                  b::Segment(1220, s::AMT, "Total Accepted Amount",
                    r::Situational, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Amount Qualifier Code", b::Values("YU")),
                    b::Element(e::Required,    "Total Rejected Amount"),
                    b::Element(e::NotUsed,     "Credit/Debit Flag Code")),
                  b::Segment(1220, s::AMT, "Total Accepted Amount",
                    r::Situational, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Amount Qualifier Code", b::Values("YY")),
                    b::Element(e::Required,    "Total Accepted Amount"),
                    b::Element(e::NotUsed,     "Credit/Debit Flag Code"))))),

            d::TableDef.detail("Table 2 - Billing Provider of Service Detail",
              d::LoopDef.build("2000C BILLING PROVIDER OF SERVICE LEVEL",
                d::RepeatCount.bounded(1),
                b::Segment(100, s::HL, "Billing Provider of Service Level",
                  r::Situational, d::RepeatCount.bounded(1),
                  b::Element(e::Required,    "Hierarchical ID Number"),
                  b::Element(e::Required,    "Hierarchical Parent ID Number"),
                  b::Element(e::Required,    "Hierarchical Level Code", b::Values("19")),
                  b::Element(e::Required,    "Hierachical Child Code", b::Values("0", "1"))),

                d::LoopDef.build("2100C BILLING PROVIDER NAME",
                  d::RepeatCount.unbounded,
                  b::Segment(500, s::NM1, "Billing Provider Name",
                    r::Required, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Entity Identifier Code", b::Values("85")),
                    b::Element(e::Required,    "Entity Type Qualifier", b::Values("1", "2")),
                    b::Element(e::Required,    "Billing Provider Last or Organizational Name"),
                    b::Element(e::Situational, "Billing Provider First Name"),
                    b::Element(e::Situational, "Billing Provider Middle Name or Initial"),
                    b::Element(e::NotUsed,     "Name Prefix"),
                    b::Element(e::Situational, "Billing Provider Name Suffix"),
                    b::Element(e::Required,    "Identification Code Qualifier", b::Values("FI", "XX")),
                    b::Element(e::Required,    "Billing Provider Identifier"),
                    b::Element(e::NotUsed,     "Entity Relationship Code"),
                    b::Element(e::NotUsed,     "Entity Identifier Code"),
                    b::Element(e::NotUsed,     "Name Last or Organization Name"))),

                d::LoopDef.build("2200C PROVIDER OF SERVICE INFORMATION TRACE IDENTIFIER",
                  d::RepeatCount.bounded(1),
                  b::Segment( 900, s::TRN, "Provider of Service Information Trace Identifier",
                    r::Situational, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Trace Type Code", b::Values("1")),
                    b::Element(e::Required,    "Provider of Service Information Trace Identifier"),
                    b::Element(e::NotUsed,     "Originating Company Identifier"),
                    b::Element(e::NotUsed,     "Reference Identification")),
                  b::Segment(1000, s::STC, "Billing Provider Status Information",
                    r::Situational, d::RepeatCount.unbounded,
                    b::Element(e::Required,    "HEALTH CARE CLAIM STATUS",
                      b::Element(e::Required,    "Health Care Claim Status Category Code"), # @todo: CodeSource.external("507")
                      b::Element(e::Required,    "Health Care Claim Status Code"),          # @todo: CodeSource.external("508")
                      b::Element(e::Situational, "Entity Identifier Qualifier", b::Values("36", "40", "41", "77", "82", "85", "87", "AY", "PR")),
                      b::Element(e::NotUsed,     "Code List Qualifier Code")),
                    b::Element(e::NotUsed,     ""),
                    b::Element(e::Required,    "Action Code", b::Values("U", "WQ")),
                    b::Element(e::Required,    "Total Submitted Charges for Unit Work"),
                    b::Element(e::NotUsed,     "Monetary Amount"),
                    b::Element(e::NotUsed,     "Date"),
                    b::Element(e::NotUsed,     "Payment Method Code"),
                    b::Element(e::NotUsed,     "Date"),
                    b::Element(e::NotUsed,     "Check Number"),
                    b::Element(e::Situational, "HEALTH CARE CLAIM STATUS",
                      b::Element(e::Required,    "Health Care Claim Status Category Code"), # @todo: CodeSource.external("507")
                      b::Element(e::Required,    "Health Care Claim Status Code"),          # @todo: CodeSource.external("508")
                      b::Element(e::Situational, "Entity Identifier Qualifier", b::Values("36", "40", "41", "AY", "PR")),
                      b::Element(e::NotUsed,     "Code List Qualifier Code")),
                    b::Element(e::Situational, "HEALTH CARE CLAIM STATUS",
                      b::Element(e::Required,    "Health Care Claim Status Category Code"), # @todo: CodeSource.external("507")
                      b::Element(e::Required,    "Health Care Claim Status Code"),          # @todo: CodeSource.external("508")
                      b::Element(e::Situational, "Entity Identifier Qualifier", b::Values("36", "40", "41", "AY", "PR")),
                      b::Element(e::NotUsed,     "Code List Qualifier Code")),
                    b::Element(e::NotUsed,     "Free-form Message Text")),
                  b::Segment(1100, s::REF, "Provider Secondary Identifier",
                    r::Situational, d::RepeatCount.bounded(3),
                    b::Element(e::Required,    "Reference Identification Qualifier", b::Values("0B", "1G", "G2", "LU", "SY", "TJ")),
                    b::Element(e::Required,    "Billing Provider Additional Identifier"),
                    b::Element(e::NotUsed,     "Description"),
                    b::Element(e::NotUsed,     "REFERENCE IDENTIFIER")),
                  b::Segment(1210, s::QTY, "Total Accepted Quantity",
                    r::Situational, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Quantity Qualifier", b::Values("QA")),
                    b::Element(e::Required,    "Total Accepted Quantity"),
                    b::Element(e::NotUsed,     "COMPOSITE UNIT OF MEASURE"),
                    b::Element(e::NotUsed,     "Free-form Information")),
                  b::Segment(1210, s::QTY, "Total Rejected Quantity",
                    r::Situational, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Quantity Qualifier", b::Values("QC")),
                    b::Element(e::Required,    "Total Rejected Quantity"),
                    b::Element(e::NotUsed,     "COMPOSITE UNIT OF MEASURE"),
                    b::Element(e::NotUsed,     "Free-form Information")),
                  b::Segment(1220, s::AMT, "Total Accepted Amount",
                    r::Situational, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Amount Qualifier Code", b::Values("YU")),
                    b::Element(e::Required,    "Total Rejected Amount"),
                    b::Element(e::NotUsed,     "Credit/Debit Flag Code")),
                  b::Segment(1220, s::AMT, "Total Accepted Amount",
                    r::Situational, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Amount Qualifier Code", b::Values("YY")),
                    b::Element(e::Required,    "Total Accepted Amount"),
                    b::Element(e::NotUsed,     "Credit/Debit Flag Code"))))),

            d::TableDef.detail("Table 2 - Patient Detail",
              d::LoopDef.build("2000D PATIENT LEVEL",
                d::RepeatCount.bounded(1),
                b::Segment(100, s::HL, "Patient Level",
                  r::Situational, d::RepeatCount.bounded(1),
                  b::Element(e::Required,    "Hierarchical ID Number"),
                  b::Element(e::Required,    "Hierarchical Parent ID Number"),
                  b::Element(e::Required,    "Hierarchical Level Code", b::Values("PT")),
                  b::Element(e::NotUsed,     "Hierachical Child Code")),

                d::LoopDef.build("2100D PATIENT NAME",
                  d::RepeatCount.bounded(1),
                  b::Segment(500, s::NM1, "Patient Name",
                    r::Required, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Entity Identifier Code", b::Values("QC")),
                    b::Element(e::Required,    "Entity Type Qualifier", b::Values("1")),
                    b::Element(e::Required,    "Patient Last or Organizational Name"),
                    b::Element(e::Situational, "Patient First Name"),
                    b::Element(e::Situational, "Patient Middle Name or Initial"),
                    b::Element(e::NotUsed,     "Name Prefix"),
                    b::Element(e::Situational, "Patient Name Suffix"),
                    b::Element(e::Required,    "Identification Code Qualifier", b::Values("II", "MI")),
                    b::Element(e::Required,    "Patient Identification Number"),
                    b::Element(e::NotUsed,     "Entity Relationship Code"),
                    b::Element(e::NotUsed,     "Entity Identifier Code"),
                    b::Element(e::NotUsed,     "Name Last or Organization Name"))),

                d::LoopDef.build("2200D CLAIM STATUS TRACKING NUMBER",
                  d::RepeatCount.unbounded,
                  b::Segment( 900, s::TRN, "Claim Status Tracking Number",
                    r::Required, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Trace Type Code", b::Values("2")),
                    b::Element(e::Required,    "Patient Control Number"),
                    b::Element(e::NotUsed,     "Originating Company Identifier"),
                    b::Element(e::NotUsed,     "Reference Identification")),
                  b::Segment(1000, s::STC, "Claim Level Status Information",
                    r::Required, d::RepeatCount.unbounded,
                    b::Element(e::Required,    "HEALTH CARE CLAIM STATUS",
                      b::Element(e::Required,    "Health Care Claim Status Category Code"), # @todo: CodeSource.external("507")
                      b::Element(e::Required,    "Health Care Claim Status Code"),          # @todo: CodeSource.external("508")
                      b::Element(e::Situational, "Entity Identifier Qualifier", b::Values("03", "1P", "1Z", "40", "41", "71", "72", "73", "77", "82", "85", "87", "DK", "DN", "DQ", "FA", "GB", "HK", "IL", "LI", "MSC", "PR", "PRP", "QB", "QC", "QD", "SEP", "TL", "TTP", "TU")),
                      b::Element(e::NotUsed,     "Code List Qualifier Code")),
                    b::Element(e::Required,    "Status Information Effective Date"),
                    b::Element(e::Required,    "Action Code", b::Values("U", "WQ")),
                    b::Element(e::Required,    "Total Claim Charge Amount"),
                    b::Element(e::NotUsed,     "Monetary Amount"),
                    b::Element(e::NotUsed,     "Date"),
                    b::Element(e::NotUsed,     "Payment Method Code"),
                    b::Element(e::NotUsed,     "Date"),
                    b::Element(e::NotUsed,     "Check Number"),
                    b::Element(e::Situational, "HEALTH CARE CLAIM STATUS",
                      b::Element(e::Required,    "Health Care Claim Status Category Code"), # @todo: CodeSource.external("507")
                      b::Element(e::Required,    "Health Care Claim Status Code"),          # @todo: CodeSource.external("508")
                      b::Element(e::Situational, "Entity Identifier Qualifier", b::Values("36", "40", "41", "AY", "PR")),
                      b::Element(e::NotUsed,     "Code List Qualifier Code")),
                    b::Element(e::Situational, "HEALTH CARE CLAIM STATUS",
                      b::Element(e::Required,    "Health Care Claim Status Category Code"), # @todo: CodeSource.external("507")
                      b::Element(e::Required,    "Health Care Claim Status Code"),          # @todo: CodeSource.external("508")
                      b::Element(e::Situational, "Entity Identifier Qualifier", b::Values("36", "40", "41", "AY", "PR")),
                      b::Element(e::NotUsed,     "Code List Qualifier Code")),
                    b::Element(e::Situational, "Free Form Message Text")),
                  b::Segment(1100, s::REF, "Payer Claim Control Number",
                    r::Situational, d::RepeatCount.bounded(3),
                    b::Element(e::Required,    "Reference Identification Qualifier", b::Values("1K")),
                    b::Element(e::Required,    "Payer Claim Control Number"),
                    b::Element(e::NotUsed,     "Description"),
                    b::Element(e::NotUsed,     "REFERENCE IDENTIFIER")),
                  b::Segment(1100, s::REF, "Claim Identifier Number for Clearinghous and Other Transmission Intermediaries",
                    r::Situational, d::RepeatCount.bounded(3),
                    b::Element(e::Required,    "Reference Identification Qualifier", b::Values("D9")),
                    b::Element(e::Required,    "Clearinghouse Trace Number"),
                    b::Element(e::NotUsed,     "Description"),
                    b::Element(e::NotUsed,     "REFERENCE IDENTIFIER")),
                  b::Segment(1100, s::REF, "Institutional Bill Type Identification",
                    r::Situational, d::RepeatCount.bounded(3),
                    b::Element(e::Required,    "Reference Identification Qualifier", b::Values("BLT")),
                    b::Element(e::Required,    "Institutional Bill Type Identification"),
                    b::Element(e::NotUsed,     "Description"),
                    b::Element(e::NotUsed,     "REFERENCE IDENTIFIER")),
                  b::Segment(1200, s::DTP, "Claim Level Service Date",
                    r::Required, d::RepeatCount.bounded(1),
                    b::Element(e::Required,    "Date Time Qualifier", b::Values("472")),
                    b::Element(e::Required,    "Date Time Period Format Qualifier", b::Values("D8", "RD8")),
                    b::Element(e::Required,    "Claim Service Period")),

                  d::LoopDef.build("2220D SERVICE LINE INFORMATION",
                    d::RepeatCount.unbounded,
                    b::Segment(1800, s::SVC, "Service Line Information",
                      r::Situational, d::RepeatCount.bounded(1),
                      b::Element(e::Required,    "COMPOSITE MEDICAL PROCEDURE IDENTIFIER",
                        b::Element(e::Required,    "Procedure Code", b::Values("AD", "ER", "HC", "HP", "IV", "NU", "WK")),
                        b::Element(e::Required,    "Procedure Code"),
                        b::Element(e::Situational, "Procedure Modifier"),
                        b::Element(e::Situational, "Procedure Modifier"),
                        b::Element(e::Situational, "Procedure Modifier"),
                        b::Element(e::Situational, "Procedure Modifier"),
                        b::Element(e::NotUsed,     "Description"),
                        b::Element(e::NotUsed,     "Product/Service ID")),
                      b::Element(e::Required,    "Line Item Charge Amount"),
                      b::Element(e::NotUsed,     "Monetary Amount"),
                      b::Element(e::Situational, "Revenue Code"),
                      b::Element(e::NotUsed,     "Quantity"),
                      b::Element(e::NotUsed,     "COMPOSITE MEDICAL PROCEDURE IDENTIFIER"),
                      b::Element(e::Situational, "Original Units of Service Count")),
                    b::Segment(1900, s::STC, "Service Line Level Status Information",
                      r::Required, d::RepeatCount.unbounded,
                      b::Element(e::Required,    "HEALTH CARE CLAIM STATUS",
                        b::Element(e::Required,    "Health Care Claim Status Category Code"), # @todo: CodeSource.external("507")
                        b::Element(e::Required,    "Health Care Claim Status Code"),          # @todo: CodeSource.external("508")
                        b::Element(e::Situational, "Entity Identifier Qualifier", b::Values("03", "1P", "1Z", "40", "41", "71", "72", "73", "77", "82", "85", "87", "DK", "DN", "DQ", "FA", "GB", "HK", "IL", "LI", "MSC", "PR", "PRP", "QB", "QC", "QD", "SEP", "TL", "TTP", "TU")),
                        b::Element(e::NotUsed,     "Code List Qualifier Code")),
                      b::Element(e::NotUsed,     "Date"),
                      b::Element(e::Required,    "Action Code", b::Values("U")),
                      b::Element(e::NotUsed,     "Monetary Amount"),
                      b::Element(e::NotUsed,     "Monetary Amount"),
                      b::Element(e::NotUsed,     "Date"),
                      b::Element(e::NotUsed,     "Payment Method Code"),
                      b::Element(e::NotUsed,     "Date"),
                      b::Element(e::NotUsed,     "Check Number"),
                      b::Element(e::Situational, "HEALTH CARE CLAIM STATUS",
                        b::Element(e::Required,    "Health Care Claim Status Category Code"), # @todo: CodeSource.external("507")
                        b::Element(e::Required,    "Health Care Claim Status Code"),          # @todo: CodeSource.external("508")
                        b::Element(e::Situational, "Entity Identifier Qualifier", b::Values("36", "40", "41", "AY", "PR")),
                        b::Element(e::NotUsed,     "Code List Qualifier Code")),
                      b::Element(e::Situational, "HEALTH CARE CLAIM STATUS",
                        b::Element(e::Required,    "Health Care Claim Status Category Code"), # @todo: CodeSource.external("507")
                        b::Element(e::Required,    "Health Care Claim Status Code"),          # @todo: CodeSource.external("508")
                        b::Element(e::Situational, "Entity Identifier Qualifier", b::Values("36", "40", "41", "AY", "PR")),
                        b::Element(e::NotUsed,     "Code List Qualifier Code")),
                      b::Element(e::Situational, "Free Form Message Text")),
                    b::Segment(2000, s::REF, "Service Line Item Identification",
                      r::Required, d::RepeatCount.bounded(1),
                      b::Element(e::Required,    "Reference Identification Qualifier", b::Values("FJ")),
                      b::Element(e::Required,    "Line Item Control Number"),
                      b::Element(e::NotUsed,     "Description"),
                      b::Element(e::NotUsed,     "REFERENCE IDENTIFIER")),
                    b::Segment(2000, s::REF, "Pharmacy Prescription Number",
                      r::Situational, d::RepeatCount.bounded(1),
                      b::Element(e::Required,    "Reference Identification Qualifier", b::Values("XZ")),
                      b::Element(e::Required,    "Pharmacy Prescription Number"),
                      b::Element(e::NotUsed,     "Description"),
                      b::Element(e::NotUsed,     "REFERENCE IDENTIFIER")),
                    b::Segment(2100, s::DTP, "Service Line Date",
                      r::Required, d::RepeatCount.bounded(1),
                      b::Element(e::Required,    "Date Time Qualifier", b::Values("472")),
                      b::Element(e::Required,    "Date Time Period Format Qualifier", b::Values("D8", "RD8")),
                      b::Element(e::Required,    "Service Line Date")))))),

            d::TableDef.detail("Table 3 - Summary",
              b::Segment(2700, s::SE, "Transaction Set Trailer",
                r::Required, d::RepeatCount.bounded(1),
                b::Element(e::Required,    "Transaction Segment Count"),
                b::Element(e::Required,    "Transaction Set Control Number"))))

        end
      end
    end
  end
end
