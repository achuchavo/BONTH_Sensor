unit ubonth;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  //
    u_module,
    System.JSON,
    System.Win.Registry,
  //
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CPort, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Data.DB,
  MemDS, DBAccess, MyAccess, Vcl.Mask, AdvSpin, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  Tfmbonth = class(TForm)
    ths_port: TComPort;
    Memo1: TMemo;
    Button3: TButton;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edt_ip: TEdit;
    Label2: TLabel;
    edt_loc: TEdit;
    Label3: TLabel;
    edt_detail_loc: TEdit;
    Label4: TLabel;
    edt_name: TEdit;
    btn_save: TButton;
    Panel2: TPanel;
    lbl_status: TLabel;
    pnl_status: TPanel;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    btn_connect: TButton;
    Label6: TLabel;
    pnl_connect: TPanel;
    cmb_port: TComboBox;
    Panel4: TPanel;
    Timer1: TTimer;
    btn_start: TButton;
    Label7: TLabel;
    spin_interval: TAdvSpinEdit;
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
    btn_stop: TButton;
    thG: TDBGridEh;
    Edit3: TEdit;
    lbl_timestamp: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_connectClick(Sender: TObject);
    procedure btn_startClick(Sender: TObject);
    procedure btn_stopClick(Sender: TObject);
    procedure ths_portRxChar(Sender: TObject; Count: Integer);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure checkonlinestatus;
    procedure getdiviceinfo;
    procedure loadcomport;
    procedure getportinfo;
    function savedata(thname,thip : String;
             thtemp,thhum,thpress : double) : boolean;
    procedure getthdata;

    var
      isMonitoring : boolean;
      start_monitoring : boolean;

      thQ : Tmyquery;
      thD : Tdatasource;


     arealvalue_temp,arealvalue_hum,arealvalue_press : double;
  end;

var
  fmbonth: Tfmbonth;

implementation

{$R *.dfm}

procedure Tfmbonth.btn_connectClick(Sender: TObject);
var
 aquery : Tmyquery;
begin
    if MessageDlg('연결 할 까요?', mtConfirmation, mbYesNo, 0) = mrYes then
     begin
      ths_port.Port := cmb_port.Text;
      ths_port.Open;
      if ths_port.Connected then
        begin


           ismonitoring := true;
           pnl_connect.Color := clGreen;
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
                     sql.Add('select * from thdevice where ip like :ip');
                     parambyname('ip').AsString := edt_ip.Text;
                     open;
                     if isempty then
                      begin
                         ShowMessage('기계 정보 저장 하세요!');
                         exit;
                      end
                      else
                      begin
                       close;
                       sql.Clear;
                       sql.Add('select * from thsettings where thip like :thip');
                       parambyname('thip').AsString := edt_ip.Text;
                       open;
                       if not isempty then
                         begin
                           edit;
                           fieldbyname('thport').AsString := cmb_port.Text;
                           fieldbyname('theinterval').AsInteger := spin_interval.value;
                           updaterecord;
                           post;
                         end
                         else
                         begin

                           close;
                           sql.Clear;
                           sql.Add('insert into thsettings (thip,thport,theinterval)');
                           sql.Add('values');
                           sql.Add('(:thip,:thport,:theinterval)');
                           ParamByName('thip').AsString := edt_ip.text;
                           ParamByName('thport').AsString := cmb_port.text;
                           ParamByName('theinterval').AsInteger := spin_interval.value;
                           execsql;

                         end;
                         btn_start.Enabled := true;
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
        end
        else
        begin
          ismonitoring := False;
          ShowMessage('연결 실폐!');
        end;
      end;
end;

procedure Tfmbonth.btn_saveClick(Sender: TObject);
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
               sql.Add('select * from thdevice where ip like :ip');
               parambyname('ip').AsString := edt_ip.Text;
               open;
               if not isempty then
                 begin
                   edit;
                   fieldbyname('thloc').AsString := edt_loc.Text;
                   fieldbyname('thdetailloc').AsString := edt_detail_loc.Text;
                   fieldbyname('thname').AsString := edt_name.Text;
                   updaterecord;
                   post;
                 end
                 else
                 begin

                   close;
                   sql.Clear;
                   sql.Add('insert into thdevice (ip,thloc,thdetailloc,thname)');
                   sql.Add('values');
                   sql.Add('(:ip,:thloc,:thdetailloc,:thname)');
                   ParamByName('ip').AsString := edt_ip.text;
                   ParamByName('thloc').AsString := edt_loc.text;
                   ParamByName('thdetailloc').AsString := edt_detail_loc.text;
                   ParamByName('thname').AsString := edt_name.text;
                   execsql;

                 end;
               ShowMessage('저장 완료!');
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

procedure Tfmbonth.btn_startClick(Sender: TObject);
begin
     timer1.Interval := spin_interval.Value * 1000;
     timer1.Enabled := true;
     start_monitoring  := true;
     btn_start.Enabled := false;
     btn_connect.Enabled := false;
     btn_save.Enabled := false;
     btn_stop.Enabled := true;
end;

procedure Tfmbonth.btn_stopClick(Sender: TObject);
begin
     timer1.Enabled := false;
     start_monitoring  := false;
     btn_stop.Enabled := false;
     btn_start.Enabled := true;
     btn_connect.Enabled := true;
     btn_save.Enabled := true;
end;

procedure Tfmbonth.Button3Click(Sender: TObject);
var
  value : string;
  c : Integer;
  str_data : String;
  datatype : String;
  datavalue : String;
  arealvalue : double;
begin

  if ismonitoring then
   begin
    try
     c :=   ths_port.ReadStr(value,16);
     memo1.Lines.Add(value);
     str_data := trim(value);
     datatype := copy(str_data,2,1);
     datavalue := trim(copy(str_data,Length(str_data)-(7),8));
      arealvalue := strtofloat(datavalue);
      arealvalue := arealvalue / 10;
       if datatype = '1' then
        begin
          memo1.Lines.Add('습도 : ' + arealvalue.ToString);
          lbl_hum.Caption :=  arealvalue.ToString;
        end
        else if datatype = '2' then
         begin
          memo1.Lines.Add('온도 : ' + arealvalue.ToString);
          lbl_temp.Caption :=  arealvalue.ToString;

         end
         else if datatype = '3' then
        begin
          memo1.Lines.Add('기압 : ' + arealvalue.ToString);
          lbl_press.Caption :=  arealvalue.ToString;

        end;
    except on e : exception do
      begin
        memo1.Lines.Add(e.Message);
      end;

    end;
   end
   else
   begin
     ShowMessage('연결 먼저 하세요!');
   end;

end;

procedure Tfmbonth.checkonlinestatus;
begin
     if d_module.GetPublicIPAddress <> '' then
      begin
         pnl_status.Color := clGreen;
         lbl_status.Caption := 'ONLINE';
      end
      else
      begin
         pnl_status.Color := clRed;
         lbl_status.Caption := 'OFFLINE';
      end;

end;

procedure Tfmbonth.FormShow(Sender: TObject);
begin
     d_module.RoundCornerOf(pnl_status,100);
     d_module.RoundCornerOf(pnl_connect,100);
     edt_ip.Text := d_module.GetPublicIPAddress;
     checkonlinestatus;
     getdiviceinfo;
     loadcomport;
     getportinfo;
     btn_stop.Enabled := false;
     btn_start.Enabled := false;

     d_module._Ip := 'database.bonsys.co.kr';
     d_module._Port :=33061;
     d_module._Username :='chavo';
     d_module._Password :='bonsys09';
     d_module._db :='bonsys_intranet';

     if d_module.isConnected2 then
       begin
         thQ := TMyQuery.Create(self);
         thQ.Connection := d_module.myConn2;
         thD := TDataSource.Create(self);
         thD.DataSet := thQ;
         thG.DataSource := thD;

         getthdata;
       end;
end;

procedure Tfmbonth.getdiviceinfo;
var
 aquery : Tmyquery;
begin
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
               sql.Add('select * from thdevice where ip like :ip');
               parambyname('ip').AsString := edt_ip.Text;
               open;
               if not isempty then
                 begin
                   edt_loc.Text := fieldbyname('thloc').AsString;
                   edt_detail_loc.Text  :=  fieldbyname('thdetailloc').AsString;
                   edt_name.Text  :=  fieldbyname('thname').AsString;
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

procedure Tfmbonth.getportinfo;
var
 aquery : Tmyquery;
begin
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
               sql.Add('select thport,theinterval from thsettings where thip like :thip');
               parambyname('thip').AsString := edt_ip.Text;
               open;
               if not isempty then
                 begin
                   cmb_port.Text := fieldbyname('thport').AsString;
                   spin_interval.value := fieldbyname('theinterval').asinteger;
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

procedure Tfmbonth.getthdata;
var
  i : integer;
begin
     try
          with thq do
            begin
               close;
               sql.Clear;
               sql.Add('select thtemp as 온도,thhum as 습도,thpress as 기압, ');
               sql.Add('edited as TIMESTAMP from thdata where thip like :thip');
               sql.Add(' order by edited desc limit 20');
               parambyname('thip').AsString := edt_ip.Text;
               open;

              for I := 0 to thg.Columns.Count-1 do
               begin
                   thg.Columns[i].OptimizeWidth;
                   thg.Columns[i].Alignment := tacenter;
                   thg.Columns[i].Title.Alignment := taCenter;
               end;

            end;
        except on e : exception do
          begin
            memo1.Lines.Add('Exception when trying to Get Data From Database!');
            memo1.Lines.Add(e.message);
            memo1.Lines.Add('TIMESTAMP : ' + datetimetostr(now));
            memo1.Lines.Add('------------------------------');

          end;
        end;
end;

procedure Tfmbonth.loadcomport;
 var
 reg:  TRegistry;
 I:Integer;
begin
   Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('HARDWARE\DEVICEMAP\SERIALCOMM', false) then
    begin
      Reg.GetValueNames(cmb_port.Items);
      for I := 0 to cmb_port.Items.Count - 1 do
          cmb_port.Items[i] := Reg.ReadString(cmb_port.Items[i]);
    end;
    cmb_port.Sorted := true;
  finally
    Reg.Free;
  end;
end;

function Tfmbonth.savedata(thname, thip: String; thtemp, thhum,
  thpress: double): boolean;
var
 aquery : Tmyquery;
begin

    try
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
                   sql.Add('insert into thdata (thname,thip,thtemp,thhum,thpress)');
                   sql.Add('values');
                   sql.Add('(:thname,:thip,:thtemp,:thhum,:thpress)');
                   ParamByName('thname').AsString := thname;
                   ParamByName('thip').AsString := thip;
                   ParamByName('thtemp').asfloat := thtemp;
                   ParamByName('thhum').asfloat := thhum;
                   ParamByName('thpress').asfloat := thpress;
                   execsql;

                 end;
        finally
            aquery.Free;
        end;
       end
       else
       begin
        memo1.Lines.Add('Connection Failed When trying to Add Data to Database!');
        memo1.Lines.Add('TIMESTAMP : ' + datetimetostr(now));
        memo1.Lines.Add('------------------------------');
       end;
    except on e : exception do
      begin
        memo1.Lines.Add('Exception when trying to Add Data to Database!');
        memo1.Lines.Add(e.message);
        memo1.Lines.Add('TIMESTAMP : ' + datetimetostr(now));
        memo1.Lines.Add('------------------------------');

      end;

    end;

end;

procedure Tfmbonth.ths_portRxChar(Sender: TObject; Count: Integer);
var
  data: string;
  alen : Integer;
  str_temp,str_hum,str_press : String;
  str_data : string;
  str_raw_data : string;
  datavalue : string;
begin
   try
       ths_port.ReadStr(data, Count);
       edit3.text := edit3.text + data;
       str_data := edit3.text;
       str_raw_data := str_data;
       if length(str_data) > 45 then
       begin
         edit3.Text := '';
         str_data := '';
         str_raw_data := trim(str_raw_data);
         alen :=  length(str_raw_data);
         if alen = 46 then
           begin
            if start_monitoring then
             begin
             //extract and display himidity value
               str_hum := copy(str_raw_data,1,14);
               datavalue := trim(copy(str_hum,Length(str_hum)-(7),8));
               arealvalue_hum := strtofloat(datavalue);
               arealvalue_hum := arealvalue_hum / 10;
              // lbl_hum.Caption :=  arealvalue_hum.ToString;
               //exract and display temperature value
               str_temp := copy(str_raw_data,17,14);
               datavalue := trim(copy(str_temp,Length(str_temp)-(7),8));
               arealvalue_temp := strtofloat(datavalue);
               arealvalue_temp := arealvalue_temp / 10;
              // lbl_temp.Caption :=  arealvalue_temp.ToString;
               //extract and display pressure value
               str_press := copy(str_raw_data,33,14);
               datavalue := trim(copy(str_press,Length(str_press)-(7),8));
               arealvalue_press := strtofloat(datavalue);
               arealvalue_press := arealvalue_press / 10;
             //  lbl_press.Caption :=  arealvalue_press.ToString;

              // lbl_timestamp.Caption := datetimetostr(now);
             end;
           end;
         str_raw_data := '';
       end;
   except on e : exception do
    begin
        memo1.Lines.Add('Exception when trying to Get Data from Device!');
        memo1.Lines.Add(e.message);
        memo1.Lines.Add('TIMESTAMP : ' + datetimetostr(now));
        memo1.Lines.Add('------------------------------');

    end;

   end;

end;

procedure Tfmbonth.Timer1Timer(Sender: TObject);
begin
  timer1.Enabled := false;
  if start_monitoring then
    begin
      lbl_hum.Caption :=  arealvalue_hum.ToString;
      lbl_temp.Caption :=  arealvalue_temp.ToString;
      lbl_press.Caption :=  arealvalue_press.ToString;
      savedata(edt_name.text,edt_ip.text,arealvalue_temp,arealvalue_hum,arealvalue_press);
      getthdata;
      lbl_timestamp.Caption := datetimetostr(now);
    end;
  timer1.Enabled := true;
end;

end.
