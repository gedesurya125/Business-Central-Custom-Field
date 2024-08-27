//? the number we allow to register is 50.000 to 99.999 (developer extension number). Below that is microsoft has, and above that is for external extension.
//? the range is defined in the app.json file in the idRanges key
//>
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
    field(50103; "Category"; Text[100])
    {
      DataClassification = ToBeClassified;
    }
    field(50104; "Custom Category Code"; Code[100]){
      Caption = 'Custom Category Code';
      TableRelation = CustomCategoryTable.Code;
      DataClassification = ToBeClassified;
    }
  }
}

table 50001 CustomCategoryTable
{
  DataClassification = ToBeClassified;
  Caption = 'Custom Category Table';
  fields
  {
    field(1;Code; Code[100])
    {
      Caption = 'Code';
      DataClassification = ToBeClassified;
    }
    field(2;Dsecription; Text[100])
    {
      Caption = 'Description';
      DataClassification = ToBeClassified;
    }
    field(3;Description; Text[100])
    {
      Caption = 'Description 2';
      DataClassification = ToBeClassified;
    }
  }
   keys
    {
        key(PK; Code) { Clustered = true; }
    }
}