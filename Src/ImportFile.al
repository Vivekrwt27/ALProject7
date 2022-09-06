page 50100 Import
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    actions
    {
        area(Processing)
        {
            action(Import)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    UploadIntoStream('', '', '', FileName, FileInstream);
                    Xmlport.Import(50101, FileInStream);
                    Message('Imported');
                end;
            }
            action(Check)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message(APICodeUnit.Import_Customer('101,Customer'));
                end;
            }
        }
    }

    var

        FileName: Text;
        FileInstream: InStream;
        APICodeUnit: Codeunit 50101;
}