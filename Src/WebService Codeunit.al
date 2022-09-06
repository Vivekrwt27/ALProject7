codeunit 50100 WebService
{
    trigger OnRun()
    begin

    end;

    procedure Import_Customer(CustomerData: BigText; StatusP: Boolean; MessageP: Text[2000])
    var
        CustomerXML: XmlPort 50100;
        XMLOutStream: OutStream;
        XMLInStream: InStream;
        XMLLineOutStream: OutStream;
        XMLLineInStream: InStream;
        TemplBlobCodeUnit: Codeunit "Temp Blob";
        Base64CodUnit: Codeunit "Base64 Convert";
        Text0001: Label 'Successfully Inserted';
    begin
        CLEAR(MessageP);
        CLEAR(StatusP);
        Clear(TemplBlobCodeUnit);
        TemplBlobCodeUnit.CreateOutStream(XMLOutStream);
        CustomerData.Write(XMLOutStream);
        XMLInStream := TemplBlobCodeUnit.CreateInStream();
        IF XMLPORT.IMPORT(50100, XMLInStream) THEN BEGIN
            StatusP := TRUE;
            MessageP := Text0001;
        end else
            MessageP := GetLastErrorText();
    end;

}