table 50102 ThresholdSetupTable
{
    DataClassification = CustomerContent;
    Caption = 'Threshold Setup';

    fields
    {
        field(1; "PrimaryKey"; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Threshold 1 Value"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Threshold 2 Value"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Threshold 1 Style"; Enum StyleType)
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Threshold 2 Style"; Enum StyleType)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(pk; PrimaryKey)
        {
            Clustered = true;
        }
    }


}