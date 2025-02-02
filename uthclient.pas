unit uthclient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  //
    u_module,
    dateutils,
    DBGridehImpExp,
  //
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Data.DB, MemDS, DBAccess, MyAccess;

type
  Tfmthclient = class(TForm)
    page_main: TPageControl;
    page_login: TTabSheet;
    page_home: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    fakers: TPanel;
    edt_ip: TEdit;
    edt_name: TEdit;
    pnl_login: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    pnl_title: TPanel;
    Panel5: TPanel;
    Label8: TLabel;
    lbl_hum: TLabel;
    Label10: TLabel;
    Panel6: TPanel;
    Label11: TLabel;
    lbl_temp: TLabel;
    Label13: TLabel;
    Panel7: TPanel;
    Label14: TLabel;
    lbl_press: TLabel;
    Label16: TLabel;
    btn_start: TButton;
    btn_stop: TButton;
    lbl_info: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    thG: TDBGridEh;
    btn_excel: TButton;
    Label4: TLabel;
    date1: TDateTimePicker;
    Label5: TLabel;
    date2: TDateTimePicker;
    btn_search: TButton;
    SaveDialog1: TSaveDialog;
    Timer1: TTimer;
    lbl_timestamp: TLabel;
    procedure FormShow(Sender: TObject);
    procedure pnl_loginMouseEnter(Sender: TObject);
    procedure pnl_loginMouseLeave(Sender: TObject);
    procedure pnl_loginClick(Sender: TObject);
    procedure btn_searchClick(Sender: TObject);
    procedure btn_excelClick(Sender: TObject);
    procedure btn_startClick(Sender: TObject);
    procedure btn_stopClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure hide_pages;
    procedure getthdata;

    var

      thQ : Tmyquery;
      thD : Tdatasource;
      theinterval : integer;
  end;

var
  fmthclient: Tfmthclient;

implementation

{$R *.dfm}

{ Tfmthclient }

procedure Tfmthclient.btn_excelClick(Sender: TObject);
begin
   if savedialog1.Execute then
       begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXlsx,thG,savedialog1.filename +'.xlsx',true);
       end;
end;

procedure Tfmthclient.btn_searchClick(Sender: TObject);
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
             sql.Add('order by edited desc');
             parambyname('date1').AsDate := dateof(date1.date);
             parambyname('date2').AsDate := dateof(date2.date);
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

procedure Tfmthclient.btn_startClick(Sender: TObject);
begin
    if theinterval < 1 then
     begin
       theinterval := 30;
     end;

     timer1.Interval := theinterval * 1000;
     timer1.Enabled := true;
     btn_start.Enabled := false;
     btn_stop.Enabled := true;
     lbl_info.Caption := '실시간 모니토링 하고 있습니다!';
end;

procedure Tfmthclient.btn_stopClick(Sender: TObject);
begin

     timer1.Enabled := true;
     btn_stop.Enabled := false;
     btn_start.Enabled := true;
     lbl_info.Caption := '실시간 모니토링 중단!';
end;

procedure Tfmthclient.FormShow(Sender: TObject);
begin
    hide_pages;
    page_main.ActivePage := page_login;

    //
    date1.Date := now;
    date2.Date := now;

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

procedure Tfmthclient.getthdata;
var
 aquery : Tmyquery;
begin

     if d_module.isConnected2 then
       begin
        // hide_tabs;
        // tab_holder.ActivePage := tab_home;
        aquery := TMyQuery.Create(self);
        aquery.Connection := d_module.myConn2;
        try
          with aquery do
            begin
                 close;
                 sql.Clear;
                 sql.Add('select thtemp,thhum,thpress,edited');
                 sql.Add(' from thdata');
                 sql.Add('where thname like :thname and thip like :thip ');
                 sql.Add('order by edited desc limit 1');
                 parambyname('thip').AsString := edt_ip.Text;
                 parambyname('thname').AsString := edt_name.Text;
                open;
               if not isempty then
                 begin
                  lbl_hum.Caption :=  fieldbyname('thhum').asfloat.ToString;
                  lbl_temp.Caption :=  fieldbyname('thtemp').asfloat.ToString;
                  lbl_press.Caption :=  fieldbyname('thpress').asfloat.ToString;
                  lbl_timestamp.Caption := 'TIMESTAMP : ' +
                    datetimetostr(fieldbyname('edited').AsDateTime);
                 end;
            end;
        finally
            aquery.Free;
        end;
       end
       else
       begin
        //ShowMessage('Connection Failed!');
        lbl_timestamp.Caption := 'Connection Failed!';
       end;
end;

procedure Tfmthclient.hide_pages;
var
  i : Integer;
begin
       for I := 0 to page_main.PageCount-1 do
          begin
            page_main.Pages[i].TabVisible := false;
          end;
end;

procedure Tfmthclient.pnl_loginClick(Sender: TObject);
var
 aquery : Tmyquery;
begin

    if edt_name.Text = '' then
     begin
       showmessage('이름 필수입니다!');
       exit;
     end;
     d_module._Ip := 'database.bonsys.co.kr';
     d_module._Port :=33061;
     d_module._Username :='chavo';
     d_module._Password :='bonsys09';
     d_module._db :='bonsys_intranet';

     if d_module.isConnected then
       begin
        // hide_tabs;
        // tab_holder.ActivePage := tab_home;
        aquery := TMyQuery.Create(self);
        aquery.Connection := d_module.myConn;
        try
          with aquery do
            begin
               close;
               sql.Clear;
               sql.Add('select ip,thname,thdetailloc from thdevice where ip like :ip and thname like :thname');
               parambyname('ip').AsString := edt_ip.Text;
               parambyname('thname').AsString := edt_name.Text;
               open;
               if not isempty then
                 begin
                  pnl_title.Caption := fieldbyname('ip').AsString + ' : ' +
                     fieldbyname('thname').AsString  + ' : ' +
                     fieldbyname('thdetailloc').AsString;
                   close;
                   sql.Clear;
                   sql.Add('select theinterval from thsettings where thip like :thip');
                   parambyname('thip').AsString := edt_ip.Text;
                   open;
                   theinterval := fieldbyname('theinterval').AsInteger;
                  page_main.ActivePage := page_home;
                 end
                 else
                 begin
                    ShowMessage('LogIn Failed!');
                    exit;
                 end;

            end;
        finally
            aquery.Free;
        end;
       end
       else
       begin
        ShowMessage('Connection Failed!');
       end;

end;

procedure Tfmthclient.pnl_loginMouseEnter(Sender: TObject);
begin
     pnl_login.Color := clwhite;
     pnl_login.Font.Size := 13;
end;

procedure Tfmthclient.pnl_loginMouseLeave(Sender: TObject);
begin
     pnl_login.Color :=    $00C08000;
     pnl_login.Font.Size := 10;
end;

procedure Tfmthclient.Timer1Timer(Sender: TObject);
begin
   //  timer1.Enabled := false;
     getthdata;
   //  timer1.Enabled := true;
end;

end.
