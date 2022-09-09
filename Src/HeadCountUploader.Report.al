report 50008 "Head Count Uploader"
{
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    trigger OnPostReport()
    begin
        ExcelBuf.DELETEALL();
        IF GETLASTERRORTEXT = '' THEN BEGIN
            MESSAGE('Import Successfully');
        END;
    end;

    trigger OnPreReport()
    begin
        CLEARLASTERROR();
        ReadExcelSheet(ServerFileName, SheetName);
    end;

    var
        ExcelBuf: Record 370;
        FileMgt: Codeunit 419;
        FileName: Text;
        ServerFileName: Text;
        SheetName: Text;
        Text001: Label 'Import Excel File';
        Text002: Label 'You must enter a file name.';
        Text003: Label 'Analyzing Data...';
        Text004: label 'You Must Enter a Sheet Name';
        DataStartLineNo: Integer;
        TotalRecNo: Integer;
        RecNo: Integer;
        Window: Dialog;
        intNo: Integer;
        TotalCol: Integer;
        oLineNo: Integer;
        X: Integer;
        TotalRow: Integer;
        RecHeadCount: Record 50004;
        Num: Integer;

        Namefile: Text;
        Instr: InStream;

    procedure ReadExcelSheet(p_FileName: Text[250]; p_SheetName: Text[250])
    var
        oLineNo: Integer;
        NoFileFoundMsg: Label 'No excel file is to upload';
    begin
        UploadIntoStream(FileName, '', '', Namefile, Instr);
        IF Namefile <> '' then begin
            FileName := FileMgt.GetFileName(Namefile);
            SheetName := ExcelBuf.SelectSheetsNameStream(Instr);
        end else
            Error(NoFileFoundMsg);

        ExcelBuf.OpenBookStream(Instr, SheetName);
        ExcelBuf.LOCKTABLE;
        ExcelBuf.ReadSheet;
        ExcelBuf.SETRANGE("Row No.", 1);
        TotalCol := ExcelBuf.COUNT();
        ExcelBuf.RESET();
        IF ExcelBuf.FINDLAST THEN
            TotalRow := ExcelBuf."Row No.";
        RecHeadCount.RESET();
        IF RecHeadCount.FINDLAST THEN
            Num := RecHeadCount."Line No" + 1;
        FOR X := 2 TO TotalRow DO BEGIN
            RecHeadCount.INIT();
            EVALUATE(RecHeadCount.Month, GetExcelCell(X, 1));
            EVALUATE(RecHeadCount.Vertical, GetExcelCell(X, 2));
            EVALUATE(RecHeadCount."Department Owner 1", GetExcelCell(X, 3));
            EVALUATE(RecHeadCount."Department Owner 2", GetExcelCell(X, 4));
            EVALUATE(RecHeadCount."Department Owner 3", GetExcelCell(X, 5));
            EVALUATE(RecHeadCount."Department Owner 4", GetExcelCell(X, 6));
            EVALUATE(RecHeadCount."Department Owner 5", GetExcelCell(X, 7));
            EVALUATE(RecHeadCount."Department Owner 6", GetExcelCell(X, 8));
            EVALUATE(RecHeadCount."Department Owner 7", GetExcelCell(X, 9));
            EVALUATE(RecHeadCount."Department Owner 8", GetExcelCell(X, 10));
            EVALUATE(RecHeadCount."Department Owner 9", GetExcelCell(X, 11));
            EVALUATE(RecHeadCount."Department Owner 10", GetExcelCell(X, 12));
            EVALUATE(RecHeadCount."Dept/Manager/Dimension", GetExcelCell(X, 13));
            EVALUATE(RecHeadCount."Headcount In dept", GetExcelCell(X, 14));
            RecHeadCount."Line No" := Num;
            RecHeadCount.INSERT();
            Num += 1;
        END;//data uploading end
    end;


    procedure GetExcelCell(p_RowNo: Integer; p_ColumnNo: Integer) Text: Text[250]
    begin
        IF ExcelBuf.GET(p_RowNo, p_ColumnNo) THEN
            EXIT(ExcelBuf."Cell Value as Text");
        EXIT('');
    end;
}

