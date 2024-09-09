codeunit 50104 ThresholdCodeUnit
{
    procedure RunThresholdSetup(var TresholdSetupNotification: Notification) // rappresenta le notifiche)

    begin
        ThresholdSetupPage.Run(); // viene eseguito quando la procedura viene chiamata
    end;

    var

        ThresholdSetupPage: Page "ThresholdSetuppage"; // rappresenta la pagina
}