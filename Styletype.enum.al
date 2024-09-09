enum 50100 StyleType
{
    Extensible = true; // Questa proprietà indica che l'enumerazione è estensibile, il che significa che può essere estesa con nuovi valori in futuro.

    value(0; None) // Questo è il primo valore dell'enumerazione. Il valore è 0 e il nome del valore è None.
    {
        Caption = 'None';
    }

    value(1; Ambiguous) // Questo è il secondo valore dell'enumerazione. Il valore è 1 e il nome del valore è Ambiguous.
    {
        Caption = 'Ambiguous';
    }

    value(2; Attention) // Questo è il terzo valore dell'enumerazione. Il valore è 2 e il nome del valore è Attention.
    {
        Caption = 'Attention';
    }
}