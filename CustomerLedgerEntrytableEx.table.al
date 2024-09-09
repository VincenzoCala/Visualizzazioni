tableextension 50105 CustomerLedgerEntrytableEx extends "Cust. Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    procedure GetNumberOfDaysExpired(): Integer
    var
        DueDate: Date; // per memorizzare la data di scadenza del record corrente
        CurrentDate: Date; // per memorizzare la data corrente
        DaysExpired: Integer; // per memorizzare il numero di giorni scaduti
    begin
        DueDate := Rec."Due Date"; // recupera la data di scadenza del record corrente
        CurrentDate := Today; // recupera la data corrente

        if CurrentDate > DueDate then // se la data corrente è maggiore della data di scadenza
            DaysExpired := Abs(CurrentDate - DueDate) // la funzione abs() restituisce il valore assoluto della differenza, assicurando che il risultato sia un numero positivo
        else
            DaysExpired := 0;

        exit(DaysExpired);
    end;
}