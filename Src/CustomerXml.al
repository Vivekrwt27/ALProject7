xmlport 50100 CustomerImport
{
    schema
    {
        textelement(Root)
        {
            tableelement(Customer_Rec; Customer)
            {
                fieldattribute(No; Customer_Rec."No.")
                {

                }
                fieldattribute(Name; Customer_Rec.Name)
                {

                }

            }
        }
    }

}