pageextension 50100 "Field on item card" extends "Item Card" {
  layout{
    addbefore(InventoryGrp){
      group("Custom Fields") {
        field("Last Counted";Rec."Last Counted"){
          ApplicationArea = all;
        }
      }
    }
  }
}
