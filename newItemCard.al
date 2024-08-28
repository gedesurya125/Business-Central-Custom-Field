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
      }
    }
  }
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

          field(Description; Rec.Dsecription) //? wrong typing Dsecription
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


page 50102 CustomCodeApiPage
{
    PageType = API;
    DelayedInsert= true;
    SourceTable = CustomCategoryTable;
    APIPublisher = 'suryacompany';
    APIGroup = 'customfields';
    APIVersion = 'v1.0';
    EntityName = 'customcategory';
    EntitySetName = 'customcategories';
    Caption = 'Custom Categories';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    Caption = 'Code';
                    ApplicationArea = All;
                }

                field(Description; Rec.Dsecription)//? wrong typing Dsecription
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                }
            }
        }
    }
}

//? This code below allow the published api in the business central access the Custom Table
permissionset 50103 CustomAPIPermissions 
  {
    Assignable = true;
    Caption = 'Custom Field Permissionset';
    Permissions = tabledata CustomCategoryTable = RM;
  }
permissionsetextension 50104 CustomAPIPermissionsExtension extends "D365 BUS FULL ACCESS"
{
    Permissions =
        TableData CustomCategoryTable = RM; // Include your permissions here
}

// // ? This add the Navigation Link : Not working yet
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
//                     RunObject = page CustomCategoryListPage;
//                     Caption = 'Custom Category List Page';
//                 }
//             }
//         }
//     }
// }