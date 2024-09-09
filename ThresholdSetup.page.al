page 50103 ThresholdSetupPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ThresholdSetupTable;
    InsertAllowed = false; // Questa proprietà impedisce agli utenti di inserire nuovi record nella tabella tramite la pagina. Quando è impostata su false, l'opzione per aggiungere nuovi record non sarà disponibile nell'interfaccia utente della pagina.
    DeleteAllowed = false; // Questa proprietà impedisce agli utenti di eliminare i record esistenti dalla tabella tramite la pagina. Quando è impostata su false, l'opzione per eliminare i record non sarà disponibile nell'interfaccia utente della pagina
    Caption = 'Threshold Setup';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Threshold 1 Value"; rec."Threshold 1 Value")
                {
                    ApplicationArea = All;
                }
                field("Threshold 2 Value"; rec."Threshold 2 Value")
                {
                    ApplicationArea = All;
                }
                field("Threshold 1 Style"; rec."Threshold 1 Style")
                {
                    ApplicationArea = All;
                }
                field("Threshold 2 Style"; rec."Threshold 2 Style")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        ThresholdSetupRec: Record ThresholdSetupTable; // dichiarazione variabile che rappresenta la tabella ThresholdSetupTable
    begin
        if not ThresholdSetupRec.Get() then begin // se non esiste alcun record nella tabella ThresholdSetupTable
            ThresholdSetupRec.Init(); // inizializza la variabile ThresholdSetupRec
            ThresholdSetupRec.Insert();// inserisce un nuovo record nella tabella ThresholdSetupTable
        end;
    end;
}
