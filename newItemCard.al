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
        field("Custom Category Code"; Rec."Custom Category Code"){
          ApplicationArea= All;
          TableRelation = CustomCategoryTable;
          Visible = true;
        }
        // field("CustomCode"; Rec."Custom Category Code")
        // {
        //   ApplicationArea = All;
        //   trigger OnLookup(var Text: Text): Boolean
        //   begin
        //       PAGE.Run(PAGE::CustomCategoryListPage, Rec);
        //       exit(true);
        //   end;
        // }
      }
    }
  }

  // actions
  // {
  //   addlast(Processing)
  //   {
  //     action(ManageCodes)
  //     {
  //       Caption = 'Manage Codes';
  //       Image = Add;
  //       trigger OnAction()
  //       begin
  //           PAGE.Run(PAGE::CustomCategoryListPage);
  //       end;
  //     }
  //   }
  // }
}


//? Create the Page to mannage th Custom Categoery
page 50101 "CustomCategoryListPage"{
   PageType = List;
    SourceTable = CustomCategoryTable;
    ApplicationArea = All;
    Caption = 'Custom Category List Page';
    UsageCategory = Lists; // this make the page accessible
    layout
    {
      area(Content)
      {
        repeater(Group)
        {
          field(Code; Rec.Code)
          {
              ApplicationArea = All;
              Caption = 'Code';
          }

          field(Description; Rec.Dsecription)
          {
              ApplicationArea = All;
              Caption = 'Description';
          }
        }
    }
    }

    actions
    {
        area(Processing)
      {
        action(NewRecord)
        {
          Caption = 'New Code';
          Image = New;

          trigger OnAction()
          begin
              Rec.Insert();
          end;
        }
      }
    }
}


// pageextension 50102 MyRoleCenterExtension extends "Business Manager Role Center"
// {
//     actions
//     {
//         addfirst(Navigation)
//         {
//             group(CustomGroup)
//             {
//                 action("Custom Codes")
//                 {
//                     RunObject = page 50101;
//                     Caption = 'Custom Category List Page';
//                 }
//             }
//         }
//     }
// }