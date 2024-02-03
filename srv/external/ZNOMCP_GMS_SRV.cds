/* checksum : 3c864a999801008ca263e2ec2297726e */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZNOMCP_GMS_SRV {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'GMS Nomination'
entity ZNOMCP_GMS_SRV.ZGMS_nom {
  @sap.display.format : 'Date'
  @sap.label : 'Gas Day'
  @sap.quickinfo : 'Gas Day Date'
  key Gasday : Date not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales document'
  @sap.quickinfo : 'Sales Document'
  key Vbeln : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sales Document Item'
  key Posnr : String(6) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Version'
  key Versn : String(3) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Nomination key'
  @sap.quickinfo : 'Nomination (technical) Key'
  key Nomtk : String(20) not null;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Short Time Stamp'
  @sap.quickinfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  key Timestamp : DateTime not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sold-To Party'
  Kunnr : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Document Type'
  Auart : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Priority'
  Rank : String(3);
  @sap.unit : 'PC5332959FA97B1B24F72095D9FE6B797'
  @sap.label : 'Daily ContractQty'
  @sap.quickinfo : 'DCQ'
  Dcq : Decimal(13, 3);
  @sap.label : 'Unit of Measure'
  @sap.quickinfo : 'Unit of Measurement'
  @sap.semantics : 'unit-of-measure'
  Uom1 : String(3);
  @sap.unit : 'PC5332959FA97B1B24F72095D9FE6B797'
  @sap.label : 'DNQ'
  @sap.quickinfo : 'daily nomination Quantity'
  PDnq : Decimal(13, 3);
  @sap.label : 'Unit of Measurement'
  @sap.semantics : 'unit-of-measure'
  Uom2 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Event Type'
  @sap.quickinfo : 'Nomination Event'
  Event : String(40);
  @sap.unit : 'PC5332959FA97B1B24F72095D9FE6B797'
  @sap.label : 'Approved DNQ'
  Adnq : Decimal(13, 3);
  @sap.unit : 'PC5332959FA97B1B24F72095D9FE6B797'
  @sap.label : 'RePublish DNQ'
  @sap.quickinfo : 'Re-Publish DNQ'
  Rpdnq : Decimal(13, 3);
  @sap.label : 'Unit of Measurement'
  @sap.semantics : 'unit-of-measure'
  Uom4 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Nomination Number'
  Znomtk : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Status'
  Zstat : String(4);
  @sap.label : 'Delivery Tolerace %'
  @sap.quickinfo : 'Delivery Tolerance %'
  Dtolp : Decimal(5, 2);
  @sap.unit : 'PC5332959FA97B1B24F72095D9FE6B797'
  @sap.label : 'Delivery Tolerace Q'
  @sap.quickinfo : 'Delivery Tolerance Quantity'
  Dtolq : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Potential Shortfall'
  ZpotentialSf : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Source'
  Src : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Delivery Point'
  ZdeliveryPoint : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Long comment'
  @sap.quickinfo : 'iSeries: Long comment of a table, view or table field'
  Remarks : String(255);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Nomination Flag'
  @sap.quickinfo : 'flag for customer nomination'
  Flag : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Action'
  Action : String(1);
  @sap.label : 'Service Param'
  @sap.quickinfo : 'Service Parameter'
  Srvparam1 : String(20);
  @sap.label : 'Service Param'
  @sap.quickinfo : 'Service Parameter'
  Srvparam2 : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Redelivery Point'
  @sap.quickinfo : 'Re-Delivery Ponit'
  ZredelivryPoint : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Path'
  Path : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Group'
  CustGrp : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Service Profile'
  SrvProfile : String(20);
};

