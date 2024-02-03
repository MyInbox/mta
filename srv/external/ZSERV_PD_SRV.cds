/* checksum : 3068dfdafe28c058e62301dc0718d782 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZSERV_PD_SRV {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.content.version : '1'
entity ZSERV_PD_SRV.ServProfSet {
  @sap.unicode : 'false'
  @sap.label : 'ID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Sales Document'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Vbeln : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key ProfileId : String(6) not null;
  @sap.unicode : 'false'
  @sap.label : 'Threshold Perc'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ThresholdP : String(3) not null;
  @sap.unicode : 'false'
  @sap.label : 'Location ID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DeliveryPt : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ItemNo : String(6) not null;
  @sap.unicode : 'false'
  @sap.label : 'Calculated Value'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  CalculatedValue : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Location ID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  RedeliveryPt : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Service Profile'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ServProfile : String(20) not null;
  @sap.unicode : 'false'
  @sap.label : 'Clause Code'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ClauseCode : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Firm'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Firm : String(20) not null;
  @sap.unicode : 'false'
  @sap.label : 'Interruptable'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Interruptible : String(20) not null;
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 7
  @sap.unicode : 'false'
  @sap.label : 'Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ValidFrom : Timestamp;
  @sap.unicode : 'false'
  @sap.label : 'Path'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Path : String(20) not null;
  @odata.Type : 'Edm.DateTime'
  @odata.Precision : 7
  @sap.unicode : 'false'
  @sap.label : 'Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ValidTo : Timestamp;
  @sap.unicode : 'false'
  @sap.label : 'Rank'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Rank : String(20) not null;
  @sap.unicode : 'false'
  @sap.label : 'DCQ'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Dcq : String(20) not null;
  @sap.unicode : 'false'
  @sap.label : 'Threshold Reference'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ThreshRef : String(20) not null;
  @sap.unicode : 'false'
  @sap.label : 'Max DCQ'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MaxDcq : String(20) not null;
  @sap.unicode : 'false'
  @sap.label : 'Remark'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Remark : String(50) not null;
  @sap.unicode : 'false'
  @sap.label : 'Min DCQ'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MinDcq : String(20) not null;
  @sap.unicode : 'false'
  @sap.label : 'Fuel Provider'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  FuelProvider : String(20) not null;
  @sap.unicode : 'false'
  @sap.label : 'Fuel%'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  FuelPer : String(20) not null;
  @sap.unicode : 'false'
  @sap.label : 'AACQ'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Aacq : String(20) not null;
  @sap.unicode : 'false'
  @sap.label : 'Overrun allowed'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OverrunAllowed : String(20) not null;
  @sap.unicode : 'false'
  @sap.label : 'Underrun allowed'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  UnderrunAllowed : String(20) not null;
  @sap.unicode : 'false'
  @sap.label : 'Take or pay'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  TakePay : String(20) not null;
  @sap.unicode : 'false'
  @sap.label : 'Early Termination'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  EarlyTermCharge : String(20) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.content.version : '1'
entity ZSERV_PD_SRV.CreateSPSet {
  @sap.unicode : 'false'
  @sap.label : 'ID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : String(10) not null;
  @cds.ambiguous : 'missing on condition?'
  IdtoServiceNav : Association to many ZSERV_PD_SRV.ServProfSet on IdtoServiceNav.Id = Id;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Service Profile Get'
entity ZSERV_PD_SRV.ZServProf_Get {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales document'
  @sap.quickinfo : 'Sales Document'
  key Vbeln : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'ID'
  @sap.quickinfo : 'Id'
  key Id : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profile Id'
  key ProfileId : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Service Profile'
  key ServProfile : String(20) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Service Parameter'
  key ServiceParam : String(20) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sales Document Item'
  key ItemNo : String(6) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Service Parameter'
  key ClauseCode : String(20) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Parameter Value'
  @sap.quickinfo : 'Service Parameter Value'
  ParamValue : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Parameter Type'
  ParamType : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Delivery Point'
  DeliveryPt : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Redelivery Point'
  RedeliveryPt : String(10);
  @sap.display.format : 'Date'
  @sap.label : 'Valid From'
  ValidFrom : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Valid To'
  ValidTo : Date;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Threshold Perc'
  @sap.quickinfo : 'Threshold Percentage'
  ThresholdP : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Service Parameter'
  ThreshRef : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Remark'
  @sap.quickinfo : 'Remarks'
  Remark : String(50);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Calculated Value'
  CalculatedValue : String(10);
};

