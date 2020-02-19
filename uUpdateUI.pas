unit uUpdateUI;

interface
  uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    //
    dateutils,
    //
    Vcl.StdCtrls,
    //TMyCOnnection Units
    Data.DB, DBAccess, MyAccess,
    //TMyQuery Units
    MemDS,
    //
    IdBaseComponent, IdComponent,
    IdTCPConnection, IdTCPClient, IdHTTP,
    //
    System.IOUtils,
    System.JSON,
    Dialogs;
  type
  TUpdateUI = class(TThread)
  private
    FTickEvent: THandle;
  protected
    procedure Execute; override;
  public
    constructor Create(apos,aname : String;ainterval : Integer);
    destructor Destroy; override;
    procedure FinishThreadExecution;
    procedure updateUI;

    var
      twodigit : String;
      thename : String;
      theInterval : Integer;
      myconn : TMyconnection;
      isConnected : boolean;

     // theConn : Tmyconnection;
  end;

implementation
  uses
    uManager;

{ TUpdateUI }



constructor TUpdateUI.Create(apos, aname: String; ainterval: Integer);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  FTickEvent := CreateEvent(nil, True, False, nil);
  twodigit := apos;
  thename := aname;
  theInterval := ainterval;

  myconn := tmyconnection.Create(nil);
  myconn.Options.UseUnicode := true;
  myconn.Disconnect;
  try
         myconn.Server := 'database.bonsys.co.kr';
         myconn.Port := 33061;
         myconn.Username := 'chavo';
         myconn.Password := 'bonsys09';
         myconn.Database := 'bonsys_intranet';
         myconn.LoginPrompt := False;
         myconn.Open;
         isConnected := true;
  except
  on E : Exception do
  begin
    isConnected := false;
         Synchronize(procedure
        begin
          fmmanager.mem_info.Lines.Add(e.message);
        end
       );
  end;

  end;

end;

destructor TUpdateUI.Destroy;
begin
  CloseHandle(FTickEvent);
  inherited;
end;

procedure TUpdateUI.Execute;
begin

  while not Terminated do
  begin
    if WaitForSingleObject(FTickEvent, theInterval) = WAIT_TIMEOUT then
    begin
      updateUI;
     // FinishThreadExecution;
    end;
  end;

end;

procedure TUpdateUI.FinishThreadExecution;
begin
  Terminate;
  SetEvent(FTickEvent);
end;

procedure TUpdateUI.updateUI;
var
  lbl_temp,lbl_press,lbl_hum : TLabel;
  aquery : tmyquery;
begin
      lbl_hum := fmManager.FindComponent('lbl_hum'+twodigit) as TLabel;
      lbl_temp := fmManager.FindComponent('lbl_temp'+twodigit) as TLabel;
      lbl_press := fmManager.FindComponent('lbl_press'+twodigit) as TLabel;
       Synchronize(procedure
      begin
        fmmanager.mem_info.Lines.Add(theInterval.ToString);
      end
     );
       if isConnected then
       begin
        aquery := TMyQuery.Create(nil);
        aquery.Connection := myconn;
        try
          with aquery do
            begin
                 close;
                 sql.Clear;
                 sql.Add('select thtemp,thhum,thpress,edited');
                 sql.Add(' from thdata');
                 sql.Add('where thname like :thname');
                 sql.Add('order by edited desc limit 1');
                 parambyname('thname').AsString := thename;
                 open;
                 if not isempty then
                  begin
                    if assigned(lbl_temp) then
                    begin
                       Synchronize(procedure
                      begin
                        lbl_temp.Caption :=  fieldbyname('thtemp').asfloat.ToString;
                      end
                     );
                  end;
                     //
                    if assigned(lbl_hum) then
                    begin
                       Synchronize(procedure
                      begin
                        lbl_hum.Caption :=  fieldbyname('thhum').asfloat.ToString;
                      end
                     );
                  end;
                     //
                    if assigned(lbl_press) then
                    begin
                       Synchronize(procedure
                      begin
                        lbl_press.Caption :=  fieldbyname('thpress').asfloat.ToString;
                      end
                     );
                    end;
                  {lbl_timestamp.Caption := 'TIMESTAMP : ' +
                    datetimetostr(fieldbyname('edited').AsDateTime);  }
                 end;
            end;
            finally
            aquery.Free;
          end;
      end;

end;

end.
