# RustWorkshopIconSwaper
Replaces Default Icon_Background.png Of The Rust Item With Custom One

1. First Download Files & Put In a Folder Name Whatever 
2. Find The Background You Want To Use (MAKE SURE ITS CALLED icon_background.png) Right Click The Background & Copy as path
3. Then Right Click On Run.ps1 & Open With Text Editor Of Choise Example: Notepad or Vscode
4. Then Change Where It Says [Line 2] ($sourceFile = "PASTE/YOUR/BACKGROUND/PATH/HERE") Paste The Path, Should Look Like This ($sourceFile = "C:\Users\Tom\Desktop\MyRustSkins\icon_background.png") Save & Exit
5. Now Where You Downloaded The Files Find Start.bat & Right Click & Copy as path Then Open With Text Editor Of Choise Example: Notepad or Vscode
6. Then Change "PASTE YOUR LOCATION/PATH/Run.ps1" Should Look Like This -File "C:\Users\Tom\Desktop\RustWorkshopIconSwaper\Run.ps1" Save & Exit
7. Now Run The Start.bat if You Get a Error You Need To Use This Command (Set-ExecutionPolicy RemoteSigned -Scope CurrentUser) In Administator Powershell
