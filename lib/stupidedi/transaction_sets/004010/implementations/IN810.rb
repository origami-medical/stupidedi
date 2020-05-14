module Stupidedi
  module TransactionSets
    module FortyTen
      module Implementations
        b = Builder
        d = Schema
        r = SegmentReqs
        e = ElementReqs
        s = SegmentDefs
        IN810 = b.build("IN", "810", "Invoice",
                        d::TableDef.header("Heading",
                                           b::Segment(10, s:: ST, "Transaction Set Header", r::Required, d::RepeatCount.bounded(1),
                                                      b::Element(e::Required, "Transaction Set Identifier Code", b::Values("810")),
                                                      b::Element(e::Required, "Transaction Set Control Number")),
                                           b::Segment(20, s::BIG, "Beginning Segment for Invoice", r::Required, d::RepeatCount.bounded(1),
                                                      b::Element(e::Required,    "Date"),
                                                      b::Element(e::Required,    "Invoice Number"),
                                                      b::Element(e::Situational, "Date"),
                                                      b::Element(e::Situational, "Purchase Order Number"),
                                                      b::Element(e::Situational, "Release Number"),
                                                      b::Element(e::Situational, "Change Order Sequence Number"),
                                                      b::Element(e::Situational, "Transaction Type Code"),
                                                      b::Element(e::Situational, "Transaction Set Purpose Code"),
                                                      b::Element(e::Situational, "Action Code"),
                                                      b::Element(e::Situational, "Invoice Number")),
                                           b::Segment(30, s:: REF, "Reference Identification", r::Situational, d::RepeatCount.unbounded,
                                                      b::Element(e::Required,    "Reference Identification Qualifier"),
                                                      b::Element(e::Situational, "Reference Identification"),
                                                      b::Element(e::Situational, "Description"),
                                                      b::Element(e::Situational, "Description")),
                                           d::LoopDef.build("N1", d::RepeatCount.bounded(200),
                                                            b::Segment(110, s:: N1, "Name", r::Situational, d::RepeatCount.bounded(1),
                                                                       b::Element(e::Required,    "Entity Identifier Code"),
                                                                       b::Element(e::Situational, "Name"),
                                                                       b::Element(e::Situational, "Identification Code Qualifier"),
                                                                       b::Element(e::Situational, "Identification Code"),
                                                                       b::Element(e::Situational, "Code describing entity relationship"),
                                                                       b::Element(e::Situational, "Code identifying an organizational entity, a physical location, property or an individual")),
                                                            b::Segment(120, s:: N2, "Address Information", r::Situational, d::RepeatCount.bounded(2),
                                                                       b::Element(e::Situational,    "Name"),
                                                                       b::Element(e::Situational, "Name")),
                                                            b::Segment(130, s:: N3, "Address Information", r::Situational, d::RepeatCount.bounded(2),
                                                                       b::Element(e::Situational, "Address Information"),
                                                                       b::Element(e::Situational, "Address Information")),
                                                            b::Segment(140, s:: N4, "Geographic Location", r::Situational, d::RepeatCount.unbounded,
                                                                       b::Element(e::Situational, "City Name"),
                                                                       b::Element(e::Situational, "State or Province Code"),
                                                                       b::Element(e::Situational, "Postal Code"),
                                                                       b::Element(e::Situational, "Country Code"),
                                                                       b::Element(e::Situational, "Location Qualifier"),
                                                                       b::Element(e::Situational, "Location Identifier"))),
                                           b::Segment(200, s:: ITD, "Terms of Sale or Deferred Terms of Sale", r::Situational, d::RepeatCount.unbounded,
                                                      b::Element(e::Situational, "Terms Type Code"),
                                                      b::Element(e::Situational, "Terms Basis Date Code"),
                                                      b::Element(e::Situational, "Terms Discount Percent"),
                                                      b::Element(e::Situational, "Terms Discount Due Date"),
                                                      b::Element(e::Situational, "Terms Discount Days Due"),
                                                      b::Element(e::Situational, "Terms Net Due Date"),
                                                      b::Element(e::Situational, "Terms Net Days"),
                                                      b::Element(e::Situational, "Terms Discount Amount"),
                                                      b::Element(e::Situational, "Terms Deferred Due Date"),
                                                      b::Element(e::Situational, "Deferred Amount Due"),
                                                      b::Element(e::Situational, "Percent of Invoice Payable"),
                                                      b::Element(e::Situational, "Description"),
                                                      b::Element(e::Situational, "Day of Month"),
                                                      b::Element(e::Situational, "Payment Method Code"),
                                                      b::Element(e::Situational, "Percent"))
                        ), #end TableDef HEADING

                        d::TableDef.header("Detail",
                                           d::LoopDef.build("IT1", d::RepeatCount.bounded(100000),
                                                            b::Segment(10, s::IT1, "Baseline Item Data (Invoice)", r::Required, d::RepeatCount.bounded(1),
                                                                       b::Element(e::Situational, "Assigned Identification"),
                                                                       b::Element(e::Situational, "Quantity"),
                                                                       b::Element(e::Situational, "UOM"),
                                                                       b::Element(e::Situational, "Unit Price"),
                                                                       b::Element(e::Situational, "Basis of Unit Price Code"),
                                                                       b::Element(e::Situational, "Product/Service ID Qualifier"),
                                                                       b::Element(e::Situational, "Product/Service ID"),
                                                                       b::Element(e::Situational, "Product/Service ID Qualifier"),
                                                                       b::Element(e::Situational, "Product/Service ID"),
                                                                       b::Element(e::Situational, "Product/Service ID Qualifier"),
                                                                       b::Element(e::Situational, "Product/Service ID"),
                                                                       b::Element(e::Situational, "Product/Service ID Qualifier"),
                                                                       b::Element(e::Situational, "Product/Service ID"),
                                                                       b::Element(e::Situational, "Product/Service ID Qualifier"),
                                                                       b::Element(e::Situational, "Product/Service ID"),
                                                                       b::Element(e::Situational, "Product/Service ID Qualifier"),
                                                                       b::Element(e::Situational, "Product/Service ID"),
                                                                       b::Element(e::Situational, "Product/Service ID Qualifier"),
                                                                       b::Element(e::Situational, "Product/Service ID"),
                                                                       b::Element(e::Situational, "Product/Service ID Qualifier"),
                                                                       b::Element(e::Situational, "Product/Service ID"),
                                                                       b::Element(e::Situational, "Product/Service ID Qualifier"),
                                                                       b::Element(e::Situational, "Product/Service ID"),
                                                                       b::Element(e::Situational, "Product/Service ID Qualifier"),
                                                                       b::Element(e::Situational, "Product/Service ID")
                                                            ),
                                                            b::Segment(20, s::TXI, "Tax Information", r::Situational, d::RepeatCount.bounded(10),
                                                                       b::Element(e::Situational, "Tax Type Code"),
                                                                       b::Element(e::Situational, "Monetary Amount"),
                                                                       b::Element(e::Situational, "Percent"),
                                                                       b::Element(e::Situational, "Tax Jurisdiction Code Qualifier"),
                                                                       b::Element(e::Situational, "Tax Jurisdiction Code"),
                                                                       b::Element(e::Situational, "Tax Exempt Code"),
                                                                       b::Element(e::Situational, "Relationship Code"),
                                                                       b::Element(e::Situational, "Dollar Basis For Percent"),
                                                                       b::Element(e::Situational, "Tax Identification Number"),
                                                                       b::Element(e::Situational, "Assigned Identification")
                                                            ),
                                                            d::LoopDef.build("PID", d::RepeatCount.bounded(1000),
                                                                             b::Segment(30, s::PID, "Product/Item Description", r::Situational, d::RepeatCount.bounded(1),
                                                                                        b::Element(e::Situational, "Item Description Type"),
                                                                                        b::Element(e::Situational, "Process Characteristic Code"),
                                                                                        b::Element(e::Situational, "Agency Qualifier Code"),
                                                                                        b::Element(e::Situational, "Product Description Code"),
                                                                                        b::Element(e::Situational, "Description"),
                                                                                        b::Element(e::Situational, "Surface/Layer/Position Code"),
                                                                                        b::Element(e::Situational, "Source Subqualifier"),
                                                                                        b::Element(e::Situational, "Yes/No Condition or Response Code"),
                                                                                        b::Element(e::Situational, "Language Code")
                                                                             )
                                                            ),
                                                            b::Segment(40, s:: REF, "Reference Identification", r::Situational, d::RepeatCount.unbounded,
                                                                       b::Element(e::Required,    "Reference Identification Qualifier"),
                                                                       b::Element(e::Situational, "Reference Identification"),
                                                                       b::Element(e::Situational, "Description"),
                                                                       b::Element(e::Situational, "Description"))
                                           ) #end IT1 loop
                        ), #end TableDef Detail

                        d::TableDef.header("Summary",
                                           b::Segment(10, s::TDS, "Total Monetary Value Summary", r::Required, d::RepeatCount.bounded(1),
                                                      b::Element(e::Situational, "Amount"),
                                                      b::Element(e::Situational, "Amount"),
                                                      b::Element(e::Situational, "Amount"),
                                                      b::Element(e::Situational, "Amount")
                                           ),
                                           b::Segment(20, s::TXI, "Tax Information", r::Situational, d::RepeatCount.bounded(10),
                                                      b::Element(e::Situational, "Tax Type Code"),
                                                      b::Element(e::Situational, "Monetary Amount"),
                                                      b::Element(e::Situational, "Percent"),
                                                      b::Element(e::Situational, "Tax Jurisdiction Code Qualifier"),
                                                      b::Element(e::Situational, "Tax Jurisdiction Code"),
                                                      b::Element(e::Situational, "Tax Exempt Code"),
                                                      b::Element(e::Situational, "Relationship Code"),
                                                      b::Element(e::Situational, "Dollar Basis For Percent"),
                                                      b::Element(e::Situational, "Tax Identification Number"),
                                                      b::Element(e::Situational, "Assigned Identification")
                                           ),
                                           d::LoopDef.build("SAC", d::RepeatCount.bounded(25),
                                                            b::Segment(30, s::SAC, "Service, Promotion, Allowance, or Charge Information", r::Situational, d::RepeatCount.bounded(1),
                                                                       b::Element(e::Situational, "Allowance or Charge Indicator"),
                                                                       b::Element(e::Situational, "Service, Promotion, Allowance, or Charge Code"),
                                                                       b::Element(e::Situational, "Agency Qualifier Code"),
                                                                       b::Element(e::Situational, "Agency Service, Promotion, Allowance, or Charge Code"),
                                                                       b::Element(e::Situational, "Amount"),
                                                                       b::Element(e::Situational, "Allowance/Charge Percent Qualifier"),
                                                                       b::Element(e::Situational, "Percent"),
                                                                       b::Element(e::Situational, "Rate"),
                                                                       b::Element(e::Situational, "Unit or Basis for Measurement Code"),
                                                                       b::Element(e::Situational, "Quantity"),
                                                                       b::Element(e::Situational, "Quantity"),
                                                                       b::Element(e::Situational, "Allowance or Charge Method of Handling Code"),
                                                                       b::Element(e::Situational, "Reference Identification"),
                                                                       b::Element(e::Situational, "Option Number"),
                                                                       b::Element(e::Situational, "Description"),
                                                                       b::Element(e::Situational, "Language Code"))
                                           ),#end sac loop
                                           b::Segment(40, s::CTT, "Transaction Totals", r::Situational, d::RepeatCount.bounded(10),
                                                      b::Element(e::Situational, "Number of Line Items"),
                                                      b::Element(e::Situational, "Hash Total"),
                                                      b::Element(e::Situational, "Weight"),
                                                      b::Element(e::Situational, "Unit or Basis for Measurement Code"),
                                                      b::Element(e::Situational, "Volume"),
                                                      b::Element(e::Situational, "Unit or Basis for Measurement Code"),
                                                      b::Element(e::Situational, "Description")
                                           ),
                                           b::Segment(50, s:: SE, "Transaction Set Trailer", r::Required, d::RepeatCount.bounded(1),
                                                      b::Element(e::Required,    "Number of Included Segments"),
                                                      b::Element(e::Required,    "Transaction Set Control Number"))
                        )# end TableDef Summary

        ) #end builder



      end
    end
  end
end