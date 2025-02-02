unit uManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  u_module,
  strutils,
  uUpdateUI,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, MemDS, DBAccess, MyAccess, Vcl.Mask, AdvSpin;

type
  TfmManager = class(TForm)
    page_holder: TPageControl;
    page_login: TTabSheet;
    page_home: TTabSheet;
    btn_logIN: TButton;
    GridPanel1: TGridPanel;
    pnl01: TPanel;
    pnl02: TPanel;
    pnl03: TPanel;
    pnl04: TPanel;
    pnl05: TPanel;
    pnl06: TPanel;
    pnl07: TPanel;
    pnl08: TPanel;
    pnl09: TPanel;
    pnl10: TPanel;
    Panel11: TPanel;
    Label1: TLabel;
    edt_name01: TEdit;
    Panel12: TPanel;
    Label2: TLabel;
    edt_location01: TEdit;
    Panel13: TPanel;
    Label3: TLabel;
    edt_location_detail01: TEdit;
    Panel14: TPanel;
    Panel15: TPanel;
    btn_detail01: TButton;
    Panel16: TPanel;
    Label8: TLabel;
    lbl_hum01: TLabel;
    Label10: TLabel;
    Panel17: TPanel;
    Label11: TLabel;
    lbl_temp01: TLabel;
    Label13: TLabel;
    Panel18: TPanel;
    Label14: TLabel;
    lbl_press01: TLabel;
    Label16: TLabel;
    Button2: TButton;
    Panel3: TPanel;
    btn_create_components: TButton;
    mem_info: TMemo;
    btn_stop: TButton;
    edt_password: TEdit;
    Label4: TLabel;
    Label15: TLabel;
    edt_user: TEdit;
    btn_refresh: TButton;
    Button4: TButton;
    spin_interval: TAdvSpinEdit;
    Panel1: TPanel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btn_logINClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btn_create_componentsClick(Sender: TObject);
    procedure btn_stopClick(Sender: TObject);
    procedure edt_passwordKeyPress(Sender: TObject; var Key: Char);
    procedure btn_refreshClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure create_components(acount : Integer);
    function clear_components : Boolean;

    procedure set_profiles;


    procedure open_details(Sender: TObject);

    //
    procedure terminate_UpdateUI;


    var
      twodigit : String;
      apanel,pnl_top1,pnl_top2,pnl_top3,pnl_client,pnl_bottom : TPanel;
      edt_input,edt_inputloc : TEdit;
      lblname : Tlabel;
      pnl_clTop,pnl_clBottom,pnl_clCl : Tpanel;
      the_button : TButton;

      components_made : Boolean;

      nUpdateUI : array of TUpdateUI;
  end;

var
  fmManager: TfmManager;

implementation
  uses
    uthcodebase,udetails;

{$R *.dfm}

procedure TfmManager.btn_create_componentsClick(Sender: TObject);
begin
    btn_create_components.Enabled := false;
    btn_stop.Enabled := true;
    clear_components;
    set_profiles;
end;

procedure TfmManager.btn_logINClick(Sender: TObject);
begin
   if (edt_user.text = 'bonsys') and (edt_password.Text = 'bonsys') then
   hide_pages(page_holder,1)
   else
   ShowMessage('LogIn 실패!');
end;

procedure TfmManager.btn_refreshClick(Sender: TObject);
begin
       if clear_components then
     begin
        components_made := false;
        terminate_UpdateUI;
     end
     else
     begin
       components_made := true;
     end;
     set_profiles;
end;

procedure TfmManager.Button2Click(Sender: TObject);
var
   aedit : Tedit;
   albl : Tlabel;
   i : integer;
begin
   mem_info.Lines.Clear;
  for I := 1 to 10 do
   begin
    twodigit := format('%.2d', [I]);
    aedit := FindComponent('edt_location'+twodigit) as TEdit;
    albl := FindComponent('lbl_hum'+twodigit) as Tlabel;
    if (assigned(aedit)) and (assigned(albl)) then
     begin
       mem_info.Lines.Add(aedit.text + ' - > '+ albl.Caption);
       mem_info.Lines.Add('-------');
     end
     else
     begin
       mem_info.Lines.Add('not found ' + i.ToString);
     end;
   end;
end;

procedure TfmManager.btn_stopClick(Sender: TObject);
begin

    if clear_components then
     begin
        btn_create_components.Enabled := true;
        btn_stop.Enabled := false;
        components_made := false;
        terminate_UpdateUI;
     end
     else
     begin
        btn_create_components.Enabled := false;
        btn_stop.Enabled := true;
       components_made := true;
     end;

end;

procedure TfmManager.Button4Click(Sender: TObject);
begin
     terminate_UpdateUI;
end;

function TfmManager.clear_components: Boolean;
var
  i,x : Integer;
  apnl : TPanel;
  acontrol : TControl;
begin
     result := false;
     try
       for I := 1 to 10 do
        begin
          twodigit := format('%.2d', [I]);
          apnl := FindComponent('pnl'+twodigit) as TPanel;
          if Assigned(apnl) then
          begin
            for x := apnl.ControlCount-1 downto 0 do
              begin
                acontrol := apnl.Controls[x];
                acontrol.Free;
              end;
          end;
        end;
        result := true;
        components_made := false;
     except on e : exception do
      begin
        mem_info.Lines.Add(e.Message);
        result := false;
      end;

     end;
end;

procedure TfmManager.create_components(acount : Integer);
var
  i : Integer;
begin
   if components_made then
   begin
     ShowMessage('Components Ready!');
     exit;
   end;
    for I := 1 to acount do
      begin
        twodigit := format('%.2d', [I]);
        apanel := FindComponent('pnl'+twodigit) as TPanel;
        if assigned(apanel) then
         begin
           //detail location
           pnl_top1 := TPanel.Create(apanel);
           pnl_top1.Parent := apanel;
           pnl_top1.BevelInner := bvNone;
           pnl_top1.BevelKind := bkNone;
           pnl_top1.BevelOuter := bvNone;
           pnl_top1.Name := 'pnl_top1'+twodigit;
           pnl_top1.Caption := '';
           pnl_top1.Align := alTop;
           pnl_top1.Height := 34;
             lblname := Tlabel.Create(pnl_top1);
             lblname.Parent := pnl_top1;
             lblname.Layout := tlCenter;
             lblname.Alignment := taRightJustify;
             lblname.Align := alLeft;
             lblname.AutoSize := false;
             lblname.Width := 65;
             lblname.Font.Style := lblname.Font.Style + [fsBold];
             lblname.Caption := '상세 위치: ';

             edt_input := Tedit.Create(self);
             edt_input.Parent := pnl_top1;
             edt_input.Name := 'edt_location_detail'+twodigit;
             edt_input.Align := alClient;
             edt_input.AlignWithMargins := true;
             edt_input.Text := edt_input.Name;
             edt_input.BorderStyle := bsNone;
             edt_input.BevelOuter := bvNone;
             edt_input.BevelKind := bkFlat;

           //location
           pnl_top2 := TPanel.Create(apanel);
           pnl_top2.Parent := apanel;
           pnl_top2.BevelInner := bvNone;
           pnl_top2.BevelKind := bkNone;
           pnl_top2.BevelOuter := bvNone;
           pnl_top2.Name := 'pnl_top2'+twodigit;
           pnl_top2.Caption := '';
           pnl_top2.Align := alTop;
           pnl_top2.Height := 34;
             lblname := Tlabel.Create(pnl_top2);
             lblname.Parent := pnl_top2;
             lblname.Layout := tlCenter;
             lblname.Alignment := taRightJustify;
             lblname.Align := alLeft;
             lblname.AutoSize := false;
             lblname.Width := 65;
             lblname.Font.Style := lblname.Font.Style + [fsBold];
             lblname.Caption := '위치: ';

             edt_input := Tedit.Create(self);
             edt_input.Parent := pnl_top2;
             edt_input.Name := 'edt_location'+twodigit;
             edt_input.Align := alClient;
             edt_input.AlignWithMargins := true;
             edt_input.Text := edt_input.Name;
             edt_input.BorderStyle := bsNone;
             edt_input.BevelOuter := bvNone;
             edt_input.BevelKind := bkFlat;

           //name
           pnl_top3 := TPanel.Create(apanel);
           pnl_top3.Parent := apanel;
           pnl_top3.BevelInner := bvNone;
           pnl_top3.BevelKind := bkNone;
           pnl_top3.BevelOuter := bvNone;
           pnl_top3.Name := 'pnl_top3'+twodigit;
           pnl_top3.Caption := '';
           pnl_top3.Align := alTop;
           pnl_top3.Height := 34;
             lblname := Tlabel.Create(pnl_top3);
             lblname.Parent := pnl_top3;
             lblname.Layout := tlCenter;
             lblname.Alignment := taRightJustify;
             lblname.Align := alLeft;
             lblname.AutoSize := false;
             lblname.Width := 65;
             lblname.Font.Style := lblname.Font.Style + [fsBold];
             lblname.Caption := '이름: ';

             edt_input := Tedit.Create(self);
             edt_input.Parent := pnl_top3;
             edt_input.Name := 'edt_name'+twodigit;
             edt_input.Align := alClient;
             edt_input.AlignWithMargins := true;
             edt_input.Text := edt_input.Name;
             edt_input.BorderStyle := bsNone;
             edt_input.BevelOuter := bvNone;
             edt_input.BevelKind := bkFlat;


           //bottom
           pnl_bottom := TPanel.Create(apanel);
           pnl_bottom.Parent := apanel;
           pnl_bottom.BevelInner := bvNone;
           pnl_bottom.BevelKind := bkFlat;
           pnl_bottom.BevelOuter := bvNone;
           pnl_bottom.Name := 'pnl_bottom'+twodigit;
           pnl_bottom.Caption := '';
           pnl_bottom.Align := albottom;
           pnl_bottom.Height := 34;
           pnl_bottom.AlignWithMargins := true;
              the_button := Tbutton.Create(self);
              the_button.Parent := pnl_bottom;
              the_button.Align := alRight;
              the_button.Name := 'btn_detail' + twodigit;
              the_button.Width := 75;
              the_button.Caption := '현황';
              the_button.onclick := open_details;

           //client
           pnl_client := TPanel.Create(apanel);
           pnl_client.Parent := apanel;
           pnl_client.BevelInner := bvNone;
           pnl_client.BevelKind := bkNone;
           pnl_client.BevelOuter := bvNone;
           pnl_client.Name := 'pnl_client'+twodigit;
           pnl_client.Caption := '';
           pnl_client.Align := alClient;
           pnl_client.Height := 163;
               //client TOP
               pnl_clTop := TPanel.Create(self);
               pnl_clTop.Parent := pnl_client;
               pnl_clTop.Height := 50;
               pnl_clTop.Name := 'pnl_clTop'+twodigit;
               pnl_clTop.caption := '';
               pnl_clTop.BevelInner := bvNone;
               pnl_clTop.BevelKind := bkFlat;
               pnl_clTop.BevelOuter := bvNone;
               pnl_clTop.Align := alTop;
               pnl_clTop.AlignWithMargins := true;
                 lblname := Tlabel.Create(self);
                 lblname.Parent := pnl_clTop;
                 lblname.Layout := tlCenter;
                 lblname.Alignment := taLeftJustify;
                 lblname.Align := alLeft;
                 lblname.AutoSize := false;
                 lblName.AlignWithMargins := true;
                 lblname.Width := 24;
                 lblname.Font.Size := 10;
                 lblname.Caption := '습도';

                 lblname := Tlabel.Create(self);
                 lblname.Parent := pnl_clTop;
                 lblname.Layout := tlCenter;
                 lblname.Alignment := taLeftJustify;
                 lblname.Align := alRight;
                 lblname.AutoSize := false;
                 lblName.AlignWithMargins := true;
                 lblname.Width := 42;
                 lblname.Font.Size := 15;
                 lblname.Caption := '%';
                 //Humidity
                 lblname := Tlabel.Create(self);
                 lblname.Name := 'lbl_hum'+twodigit;
                 lblname.Parent := pnl_clTop;
                 lblname.Layout := tlCenter;
                 lblname.Alignment := taCenter;
                 lblname.Align := alClient;
                 lblname.AutoSize := false;
                 lblName.AlignWithMargins := true;
                 lblname.Font.Size := 20;
                 lblname.Caption := '...';
                 lblname.Font.Style := lblname.Font.Style + [fsBold];
               //Client Bottom
               pnl_clbottom := TPanel.Create(self);
               pnl_clbottom.Parent := pnl_client;
               pnl_clbottom.Height := 50;
               pnl_clbottom.Name := 'pnl_clbottom'+twodigit;
               pnl_clbottom.caption := '';
               pnl_clbottom.BevelInner := bvNone;
               pnl_clbottom.BevelKind := bkFlat;
               pnl_clbottom.BevelOuter := bvNone;
               pnl_clbottom.Align := alTop;
               pnl_clbottom.AlignWithMargins := true;
                 lblname := Tlabel.Create(self);
                 lblname.Parent := pnl_clbottom;
                 lblname.Layout := tlCenter;
                 lblname.Alignment := taLeftJustify;
                 lblname.Align := alLeft;
                 lblname.AutoSize := false;
                 lblName.AlignWithMargins := true;
                 lblname.Width := 24;
                 lblname.Font.Size := 10;
                 lblname.Caption := '온도';

                 lblname := Tlabel.Create(self);
                 lblname.Parent := pnl_clbottom;
                 lblname.Layout := tlCenter;
                 lblname.Alignment := taLeftJustify;
                 lblname.Align := alRight;
                 lblname.AutoSize := false;
                 lblName.AlignWithMargins := true;
                 lblname.Width := 42;
                 lblname.Font.Size := 15;
                 lblname.Caption := '°C';
                 //Humidity
                 lblname := Tlabel.Create(self);
                 lblname.Name := 'lbl_temp'+twodigit;
                 lblname.Parent := pnl_clbottom;
                 lblname.Layout := tlCenter;
                 lblname.Alignment := taCenter;
                 lblname.Align := alClient;
                 lblname.AutoSize := false;
                 lblName.AlignWithMargins := true;
                 lblname.Font.Size := 15;
                 lblname.Caption := '...';
                 lblname.Font.Style := lblname.Font.Style + [fsBold];
               //Client Client
               pnl_clcl := TPanel.Create(self);
               pnl_clcl.Parent := pnl_client;
               pnl_clcl.Height := 50;
               pnl_clcl.Name := 'pnl_clcl'+twodigit;
               pnl_clcl.caption := '';
               pnl_clcl.BevelInner := bvNone;
               pnl_clcl.BevelKind := bkFlat;
               pnl_clcl.BevelOuter := bvNone;
               pnl_clcl.Align := alTop;
               pnl_clcl.AlignWithMargins := true;
                 lblname := Tlabel.Create(self);
                 lblname.Parent := pnl_clcl;
                 lblname.Layout := tlCenter;
                 lblname.Alignment := taLeftJustify;
                 lblname.Align := alLeft;
                 lblname.AutoSize := false;
                 lblName.AlignWithMargins := true;
                 lblname.Width := 24;
                 lblname.Font.Size := 10;
                 lblname.Caption := '기압';

                 lblname := Tlabel.Create(self);
                 lblname.Parent := pnl_clcl;
                 lblname.Layout := tlCenter;
                 lblname.Alignment := taLeftJustify;
                 lblname.Align := alRight;
                 lblname.AutoSize := false;
                 lblName.AlignWithMargins := true;
                 lblname.Width := 42;
                 lblname.Font.Size := 15;
                 lblname.Caption := 'hPa';
                 //Humidity
                 lblname := Tlabel.Create(self);
                 lblname.Name := 'lbl_press'+twodigit;
                 lblname.Parent := pnl_clcl;
                 lblname.Layout := tlCenter;
                 lblname.Alignment := taCenter;
                 lblname.Align := alClient;
                 lblname.AutoSize := false;
                 lblName.AlignWithMargins := true;
                 lblname.Font.Size := 20;
                 lblname.Caption := '...';
                 lblname.Font.Style := lblname.Font.Style + [fsBold];

         end;
      end;
      components_made := true;
end;

procedure TfmManager.edt_passwordKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
     btn_logINClick(btn_logIN);
   end;
end;

procedure TfmManager.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    terminate_UpdateUI;
end;

procedure TfmManager.FormShow(Sender: TObject);
begin
    hide_pages(page_holder,0);
    edt_user.SetFocus;
    clear_components;

     d_module._Ip := 'database.bonsys.co.kr';
     d_module._Port :=33061;
     d_module._Username :='chavo';
     d_module._Password :='bonsys09';
     d_module._db :='bonsys_intranet';
        btn_create_components.Enabled := true;
        btn_stop.Enabled := false;
end;

procedure TfmManager.open_details(Sender: TObject);
var
  edt_aname : TEdit;
  str_aname : String;
begin
   str_aname := 'edt_name' + AnsiRightStr(TButton(Sender).name, 2);
   //mem_info.Lines.Add(str_aname);
   edt_aname := fmmanager.FindComponent(str_aname) as Tedit;
   if Assigned(edt_aname) then
   begin
    // mem_info.Lines.Add(edt_aname.Text + ' CLICKED!');
     fmdetail := Tfmdetail.Create(self);
     fmdetail.pnl_title.Caption := ' 이름 : ' + edt_aname.Text;
     fmdetail.thename := edt_aname.Text;
     fmdetail.btn_searchClick(fmdetail.btn_search);
     fmdetail.Show;
   end
   else
   begin
      mem_info.Lines.Add('not found')
   end;
 //  showmessage( TButton(Sender).Caption + ' -> edt_name' + AnsiRightStr(TButton(Sender).Caption, 2));
end;

procedure TfmManager.set_profiles;
var
  aquery : TMyquery;
  arecCount : Integer;
  athname,athloc,athdetailloc : String;
  acount : integer;
  aname,aloc,adetailloc : Tedit;
  ui_count : Integer;
  ainterval : integer;
begin
    //
    try
     if d_module.isConnected then
       begin
          aquery := tmyquery.Create(self);
          aquery.Connection := d_module.myConn;
          try
            with aquery do
            begin
              close;
              sql.Clear;
              sql.Add('select * from thdevice order by id asc');
              open;
              if not isempty then
              begin
                arecCount := RecordCount;
                create_components(arecCount);
                SetLength(nUpdateUI,arecCount);
                acount := 1;
                ui_count := 0;
                ainterval :=  spin_interval.value*1000;
                first;
                while not eof  do
                begin
                  athname := fieldbyname('thname').AsString;
                  athloc := fieldbyname('thloc').AsString;
                  athdetailloc := fieldbyname('thdetailloc').AsString;
                  twodigit := format('%.2d', [acount]);
                  //
                  aname := fmmanager.FindComponent('edt_name'+twodigit) as TEdit;
                  if Assigned(aname) then
                  begin
                    aname.Text := athname;
                    aname.ReadOnly := true;
                  end
                  else
                  begin
                    mem_info.Lines.Add('no found');
                  end;
                  //
                  aloc := fmmanager.FindComponent('edt_location'+twodigit) as TEdit;
                  if Assigned(aloc) then
                  begin
                    aloc.Text := athloc;
                    aloc.ReadOnly := true;
                  end
                  else
                  begin
                    mem_info.Lines.Add('no found aloc');
                  end;
                  //
                  adetailloc := fmmanager.FindComponent('edt_location_detail'+twodigit) as TEdit;
                  if Assigned(adetailloc) then
                  begin
                    adetailloc.Text := athdetailloc;
                    adetailloc.ReadOnly := true;
                  end
                  else
                  begin
                    mem_info.Lines.Add('no found dloc');
                  end;

                  next;
                  acount := acount + 1;
                  nupdateUI[ui_count] := TupdateUI.Create(twodigit,athname,ainterval);
                  ui_count := ui_count + 1;
                end;


              end
              else
              begin
                 clear_components;
              end;

            end;

          finally
            aquery.Free;
          end;
       end;
    except on e : exception do
     begin
       mem_info.Lines.Add(e.Message);
     end;

    end;
end;

procedure TfmManager.terminate_UpdateUI;
var
  I: Integer;
begin
    for I := length(nupdateUI)-1 downto 0 do
      begin
         if Assigned(nupdateUI[i]) then
         nupdateUI[i].FinishThreadExecution;
      end;
end;

end.
