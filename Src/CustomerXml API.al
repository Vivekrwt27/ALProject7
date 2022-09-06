xmlport 50101 CustomerImportAPI
{
    Format = VariableText;
    //UseRequestPage = true;
    RecordSeparator = ';';
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Customer_Rec; Customer)
            {
                AutoSave = true;
                AutoUpdate = true;
                fieldelement(No; Customer_Rec."No.")
                {

                }
                fieldelement(Name; Customer_Rec.Name)
                {

                }

            }
        }
    }

}