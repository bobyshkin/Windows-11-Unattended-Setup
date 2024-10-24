# Removes Preinstalled Bloatware Apps
# C:\Windows\Setup\Scripts\remove-packages.ps1

Get-AppxProvisionedPackage -Online | Where-Object -Property 'DisplayName' -In -Value @(
  'Microsoft.Microsoft3DViewer';
  'Microsoft.BingSearch';
  'Microsoft.WindowsCamera';
  'Clipchamp.Clipchamp';
  'Microsoft.WindowsAlarms';
  'Microsoft.549981C3F5F10';
  'Microsoft.Windows.DevHome';
  'MicrosoftCorporationII.MicrosoftFamily';
  'Microsoft.WindowsFeedbackHub';
  'Microsoft.GetHelp';
  'microsoft.windowscommunicationsapps';
  'Microsoft.WindowsMaps';
  'Microsoft.ZuneVideo';
  'Microsoft.BingNews';
  'Microsoft.MicrosoftOfficeHub';
  'Microsoft.Office.OneNote';
  'Microsoft.OutlookForWindows';
  'Microsoft.MSPaint';
  'Microsoft.People';
  'Microsoft.Windows.Photos';
  'Microsoft.PowerAutomateDesktop';
  'MicrosoftCorporationII.QuickAssist';
  'Microsoft.SkypeApp';
  'Microsoft.ScreenSketch';
  'Microsoft.MicrosoftSolitaireCollection';
  'Microsoft.MicrosoftStickyNotes';
  'MSTeams';
  'Microsoft.Getstarted';
  'Microsoft.Todos';
  'Microsoft.WindowsSoundRecorder';
  'Microsoft.BingWeather';
  'Microsoft.ZuneMusic';
  'Microsoft.WindowsTerminal';
  'Microsoft.Xbox.TCUI';
  'Microsoft.XboxApp';
  'Microsoft.XboxGameOverlay';
  'Microsoft.XboxGamingOverlay';
  'Microsoft.XboxIdentityProvider';
  'Microsoft.XboxSpeechToTextOverlay';
  'Microsoft.GamingApp';
  'Microsoft.YourPhone';
  'Microsoft.OneDrive';
  'Microsoft.549981C3F5F10';
  'Microsoft.MixedReality.Portal';
  'Microsoft.Windows.Ai.Copilot.Provider';
  'Microsoft.WindowsMeetNow';
) | Remove-AppxProvisionedPackage -AllUsers -Online

Get-WindowsCapability -Online |
Where-Object -FilterScript {
  ($_.Name -split '~')[0] -in @(
    'Browser.InternetExplorer';
    'MathRecognizer';
    'OpenSSH.Client';
    'Microsoft.Windows.PowerShell.ISE';
    'App.Support.QuickAssist';
    'App.StepsRecorder';
    'Microsoft.Windows.WordPad';
  );
} | Remove-WindowsCapability -Online
