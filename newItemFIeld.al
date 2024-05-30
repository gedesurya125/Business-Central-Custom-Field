//? the number we allow to register is 50.000 to 99.999 (developer extension number). Below that is microsoft has, and above that is for external extension.
//? the range is defined in the app.json file in the idRanges key
tableextension 50100 "New Item Field" extends Item {
  fields{
    field(50100; "Last Counted"; Date)
    {
      Caption = 'Last Counted';
      DataClassification = ToBeClassified;
    }
    field(50101; "Basis Factor"; Decimal)
    {
      MinValue = 0;
      MaxValue = 100;
    }
    field(50102; "Basis Price Unit"; Enum WEIGHT_UNIT)
    {
      Caption = 'Basis Price Unit';
      DataClassification = ToBeClassified;
    }
  }
}