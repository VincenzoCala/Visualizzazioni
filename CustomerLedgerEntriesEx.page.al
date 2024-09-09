pageextension 50106 CustomerLedgerEntriesEx extends "Customer Ledger Entries"
{
    layout
    {
        addlast(Control1) // nuovo controllo
        {
            field(NumberofDaysExpired; NumberofDaysExpired) // campo NumberofDaysExpired
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Number of Days Expired';
                ToolTip = 'The number of days this entry is expired, based upon Due Date and today.';
                StyleExpr = DaysExpiredStyle; // stile del campo
            }



        }
    }
    views
    {
        addfirst // aggiunge una nuova vista
        {
            view("Open Entries") // nome della vista
            {
                Caption = 'Open Entries';
                OrderBy = ascending("Due Date"); // ordina le voci in base alla data di scadenza in ordine crescente
                Filters = where(Open = const(true)); // applica un filtro per visualizzare solo le voci aperte
                SharedLayout = false; // specifica che il layout non è condiviso con altre viste

                layout
                {
                    movefirst(Control1; NumberofDaysExpired) // sposta il controllo NumberofDaysExpired come primo elemento nel layout della vista
                    moveafter(NumberofDaysExpired; "Due Date") // sposta il campo numberofDaysExpired dopo il campo "Due Date" nel layout della vista
                }

            }


        }









    }


    var
        NumberOfdaysExpired: Integer; // dichiarazione variabile NumberOfdaysExpired di tipo Integer che memorizza il numero di giorni scaduti
        DaysExpiredStyle: Text; // una variabile di tipo text che memorizza lo stile da applicare in base ai giorni scaduti
        ThresholdSetup: Record ThresholdSetupTable; // una variabile di tipo record che fa riferimento alla tabella

    trigger OnOpenPage()
    begin
        if not ThresholdSetup.Get() then begin // se non esiste alcun record nella tabella ThresholdSetupTable
            ShowThresholdSetupNotification(); // mostra la notifica per eseguire il Threshold Setup
            CurrPage.Update();// aggiorna la pagina corrente
        end;
    end;

    trigger OnAfterGetRecord() // viene eseguito dopo che il record è stato recuperato dalla tabella associata alla pagina
    begin
        NumberOfDaysExpired := rec.GetNumberOfDaysExpired(); // assegna il valore restituito dalla funzione getnumberofdaysexpired dal record corrente (rec) alla variabile NumberOfDaysExpired
        case NumberOfDaysExpired of // inizia una struttura di controllo case per valutare il valore di numberofdaysexpired
            ThresholdSetup."Threshold 1 Value" .. ThresholdSetup."Threshold 2 Value": // se il numero è compreso tra 1 e 2,esegue il blocco di codice associato
                DaysExpiredStyle := format(ThresholdSetup."Threshold 1 Style"); // assegna il valore di threshold 1 style formattato alla variabile daysexpiredstyle, lo stile applicato sarà quello di threshold style 1
            ThresholdSetup."Threshold 2 Value" .. 99999: // se il numero rientra in questo intervallo viene eseguito il codice associato, quindi se il numero è maggiore o uguale a threhsold 2 lo stile sarà di threshold 2
                DaysExpiredStyle := format(ThresholdSetup."Threshold 2 Style");
            else
                DaysExpiredStyle := 'None'; // questo codice viene eseguito se il numero non rientra in nessuno dei due intervalli, quindi lo stile sarà None
        end;
    end;

    local procedure ShowThresholdSetupNotification()
    var
        ThresholdSetupNotification: Notification;
        labelMessage: Label 'You need to run the Threshold Setup: '; // etichetta per il messaggio della notifica
        labelAction: Label 'Click here to run the ThresholdSetup'; // etichetta per l'azione della notifica
    begin
        ThresholdSetupNotification.Message('You need to run the Threshold Setup: ');// messaggio della notifica
        ThresholdSetupNotification.AddAction(labelAction, Codeunit::"ThresholdCodeUnit" /* codeunite da eseguire*/,/*nome della funzione */ 'RunThresholdSetup'); // aggiunge un'azione alla notifica , questa azione permette all'utente di cliccare su un link nella notifica per eseguire una funzione specifica
        ThresholdSetupNotification.Send(); // invia la notifica all'utente, dopo questa chiamata l'utente vedrà la notifica con il messaggio specifficato.
    end;// La procedura ShowThresholdSetupNotification crea e invia una notifica all'utente. La notifica contiene un messaggio che informa l'utente della necessità di eseguire la configurazione delle soglie (Threshold Setup). Inoltre, la notifica include un'azione che permette all'utente di cliccare su un link per eseguire la funzione RunThresholdSetup nel codeunit "ThresholdCodeUnit".
}