pageextension 50100 "Field on item card" extends "Item Card" {
  layout{
    addbefore(InventoryGrp){
      group("Custom Fields") {
        field("Last Counted";Rec."Last Counted"){
          ApplicationArea = All;
          Visible= true;
        }
        field("Basis Price Unit";Rec."Basis Price Unit"){
          ApplicationArea= All;
          Visible = true;
        }
        field("Basis Factor";Rec."Basis Factor"){
          ApplicationArea = All;
          Visible= true;
        }
        field("Category"; Rec."Category")
        {
          ApplicationArea = All;
          Visible= true;
        }
      }
    }
  }
}
