unit udetails;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  u_module,
  dateutils,
  DBGridehImpExp,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, DBAccess, MyAccess, MemDS;

type
  Tfmdetail = class(TForm)
    Panel2: TPanel;
    fakers: TPanel;
    Panel8: TPanel;
    btn_excel: TButton;
    Panel9: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    date1: TDateTimePicker;
    date2: TDateTimePicker;
    btn_search: TButton;
    thG: TDBGridEh;
    Panel3: TPanel;
    pnl_title: TPanel;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure btn_searchClick(Sender: TObject);
    procedure btn_excelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    var
       thename : String;
       thQ : Tmyquery;
       thD : Tdatasource;
  end;

var
  fmdetail: Tfmdetail;

implementation

{$R *.dfm}

procedure Tfmdetail.btn_excelClick(Sender: TObject);
begin
   if savedialog1.Execute then
       begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXlsx,thG,savedialog1.filename +'.xlsx',true);
       end;
end;

procedure Tfmdetail.btn_searchClick(Sender: TObject);
var
  i : integer;
begin
     if d_module.isConnected then
      begin
         with thq do
           begin
             close;
             sql.Clear;
             sql.Add('select thtemp as 온도,thhum as 습도,thpress as 기압,');
             sql.Add('edited as ''TIMESTAMP'' from thdata');
             sql.Add('where date_format(edited,''%Y-%m-%d'') >= :date1 and ');
             sql.Add('date_format(edited,''%Y-%m-%d'') <= :date2 ');
             sql.Add('and thname like :thname ');
             sql.Add('order by edited desc');
             parambyname('date1').AsDate := dateof(date1.date);
             parambyname('date2').AsDate := dateof(date2.date);
             parambyname('thname').asstring := thename;
             open;
             for I := 0 to thg.Columns.Count-1 do
               begin
                   thg.Columns[i].OptimizeWidth;
                   thg.Columns[i].Alignment := tacenter;
                   thg.Columns[i].Title.Alignment := taCenter;
               end;
           end;
      end;
end;

procedure Tfmdetail.FormShow(Sender: TObject);
begin
     d_module._Ip := 'database.bonsys.co.kr';
     d_module._Port :=33061;
     d_module._Username :='chavo';
     d_module._Password :='bonsys09';
     d_module._db :='bonsys_intranet';


     if d_module.isConnected then
       begin
         thQ := TMyQuery.Create(self);
         thQ.Connection := d_module.myConn;
         thD := TDataSource.Create(self);
         thD.DataSet := thQ;
         thG.DataSource := thD;
       end;
end;

end.
