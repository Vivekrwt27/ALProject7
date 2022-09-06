codeunit 50101 WebServiceAPI
{
    trigger OnRun()
    begin

    end;

    procedure Import_Customer(customerData: Text): Text
    var
        CustomerXML: XmlPort 50101;
        XMLOutStream: OutStream;
        XMLInStream: InStream;
        XMLLineOutStream: OutStream;
        XMLLineInStream: InStream;
        TemplBlobCodeUnit: Codeunit "Temp Blob";
        Text0001: Label 'Successfully Inserted';
    begin
        Clear(TemplBlobCodeUnit);
        TemplBlobCodeUnit.CreateOutStream(XMLOutStream);
        XMLOutStream.WriteText(CustomerData);
        TemplBlobCodeUnit.CreateInStream(XMLInStream);
        CustomerXML.SetSource(XMLInStream);
        IF CustomerXML.IMPORT THEN BEGIN
            exit(Text0001);
        end else
            exit(GetLastErrorText());
    end;

}