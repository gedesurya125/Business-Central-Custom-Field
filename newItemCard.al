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
        field("Custom Product Code"; Rec."Custom Product Code"){
          ApplicationArea= All;
          TableRelation = CustomProductTable;
          Visible = true;
          Editable = true;
          // ensure the look up page is correct
          LookupPageId = CustomProductListPage;
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
  layout{
    area(Content){
      repeater(Group){
        field(Code; Rec.Code){
            ApplicationArea = All;
            Caption = 'Code';
        }

        field(Description; Rec.Dsecription){
        //? wrong typing Dsecription
            ApplicationArea = All;
            Caption = 'Description';
        }
      }
    }
  }

  actions{
  // ! This action is not working, the button is not showing up
    area(Processing){
      action(NewRecord){
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




page 50103 "CustomProductListPage" {
  PageType=List;
  SourceTable=CustomProductTable;
  ApplicationArea= All;
  Caption = 'Custom Product List Page';
  UsageCategory=Lists;
  Editable=true;
  InsertAllowed= true; //ensure the inline insert is allowed to enable the add new button
  // DeleteAllowed= true;
  // ModifyAllowed= true;
  layout{
    area(Content)
      {
        repeater(Group)
        {
          field(Code; Rec.Code)
          {
            ApplicationArea = All;
            Caption = 'Code';
          }

          field(Title; Rec.Title) //? wrong typing Dsecription
          {
              ApplicationArea = All;
              Caption = 'Title';
          }
          field(Description; Rec.Description) //? wrong typing Dsecription
          {
            ApplicationArea = All;
            Caption = 'Description';
          }
        }
    }
  }
  actions{
    area(Processing){
      action("Add New Value")
      {
        Caption = '+ Add New';
        ApplicationArea = All;
        Image = Add;

        trigger OnAction()
        begin
            Page.RunModal(Page::"New Custom Product List Value");
        end;
      }
    }
  }
}

page 50104 "New Custom Product List Value"{
  PageType = Card;
  SourceTable = CustomProductTable;
  ApplicationArea = All;
  layout{
    area(Content){
      group(Group){
        field(Code; Rec.Code) { Caption = 'Enter New Value'; }
        field(Title; Rec.Title) { Caption = 'Enter New Value'; }
        field(Description; Rec.Description) { Caption = 'Enter New Value'; }
      }
    }
  }
  actions{
    area(Processing){
      action("Save"){
        Caption = 'Save';
        ApplicationArea = All;
        trigger OnAction()
        begin
            Rec.Insert();
            Message('New value added!');
            CurrPage.Close();
        end;
      }
    }
  }
}




// ? Exposing the api
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