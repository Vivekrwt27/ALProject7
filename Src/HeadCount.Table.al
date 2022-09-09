table 50004 "Head Count"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; Vertical; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Department Owner 1"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Department Owner 2"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Department Owner 3"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Department Owner 4"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Department Owner 5"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Department Owner 6"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Department Owner 7"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Department Owner 8"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Department Owner 9"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Department Owner 10"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Month; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Dept/Manager/Dimension"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Headcount In dept"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "posted Boolean"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

