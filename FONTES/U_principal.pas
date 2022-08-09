unit U_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls,
  Vcl.Imaging.pngimage;

type
  TFrm_Principal = class(TForm)
    Menu: TMainMenu;
    Panel: TPanel;
    Sair: TMenuItem;
    Produto1: TMenuItem;
    Timer: TTimer;
    StatusBar: TStatusBar;
    Produto2: TMenuItem;
    Image_1: TImage;
    Image_2: TImage;
    procedure TimerTimer(Sender: TObject);
    procedure Produto(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.dfm}

uses U_Dm, U_Produto;

Procedure TFrm_Principal.Produto(Sender: TObject);
  Begin
    Frm_Produto.Visible:= true;
    Frm_Principal.Visible:= false;
  End;

Procedure TFrm_Principal.Produto1Click(Sender: TObject);
  Begin
    Image_2.Visible:= true;
    Image_1.Visible:= false;
  End;

Procedure TFrm_Principal.SairClick(Sender: TObject);
  Begin
    Frm_Principal.Close;
    Frm_Produto.Close;
  End;

Procedure TFrm_Principal.TimerTimer(Sender: TObject);
  Begin
    Statusbar.Panels[3].Text:= 'Data: ' + FormatDateTime('dddd, dd "de" mmm "de" yyyy', Now);
    Statusbar.Panels[4].Text:= 'Hora: ' + FormatDateTime('hh:mm:ss', Now);
  End;

end.
