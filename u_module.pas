unit u_module;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, MyAccess,
  //
    System.JSON,
    Vcl.Controls,
    Winapi.Windows,
    Winapi.Messages,
  //
  Winsock, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  Td_module = class(TDataModule)
    myConn: TMyConnection;
    myConn2: TMyConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    Function GetIPAddress():String;
    Function GetPublicIPAddress():String;
    procedure RoundCornerOf(Control: TWinControl;avalue : Integer) ;


    function isConnected : Boolean;
    function isConnected2 : Boolean;


    var
       //db settings
       _ip  : String;
       _port : Integer;
       _username : String;
       _password : String;
       _db : String;
  end;

var
  d_module: Td_module;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ Td_module }

function Td_module.GetIPAddress: String;
type
  pu_long = ^u_long;
var
  varTWSAData : TWSAData;
  varPHostEnt : PHostEnt;
  varTInAddr : TInAddr;
  namebuf : Array[0..255] of AnsiChar;
begin
  If WSAStartup($101,varTWSAData) <> 0 Then
  Result := 'No. IP Address'
  Else Begin
    gethostname(namebuf,sizeof(namebuf));
    varPHostEnt := gethostbyname(namebuf);
    varTInAddr.S_addr := u_long(pu_long(varPHostEnt^.h_addr_list^)^);
    Result := inet_ntoa(varTInAddr);
  End;
  WSACleanup;
end;

function Td_module.GetPublicIPAddress: String;
var
  LIdHTTP: TIdHTTP;
  resp: TMemoryStream;
  lReader: TStringReader;
  webdata : string;
  obj: TJSONObject;
  myip : String;
begin
     result := '';
    try
         LIdHTTP:= TIdHTTP.Create(nil);
         LIdHTTP.request.useragent := 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; MAAU)';
        // resp := TMemoryStream.Create;
                    try
                      lReader := TStringReader.Create(LIdHTTP.Get('http://ipinfo.io/json'));
                      webdata := lreader.ReadToEnd;
                    finally
                      LIdHTTP.Free;
                    end;
         obj := TJsonobject.create;
         obj := TJSONObject.ParseJSONValue(webdata) as TJSONObject;
         try
             myip := obj.Values['ip'].Value;
             result := myip;
         finally
           obj.free;
         end;
    except on e : exception do
      begin
          result := '';
         // showmessage(e.message);
      end;

    end;

end;

function Td_module.isConnected: Boolean;
begin
        result := false;
        myconn.Disconnect;
        try
               myconn.Server := _Ip;
               myconn.Port := _Port;
               myconn.Username := _Username;
               myconn.Password := _Password;
               myconn.Database := _db;
               myconn.LoginPrompt := False;
               myconn.Open;
               result := true;
        except
        on E : Exception do
        begin
          //showmessage(E.ClassName + ' Error Message: ' + E.Message);
          result := false;
        end;

        end;

end;

function Td_module.isConnected2: Boolean;
begin
        result := false;
        myconn2.Disconnect;
        try
               myconn2.Server := _Ip;
               myconn2.Port := _Port;
               myconn2.Username := _Username;
               myconn2.Password := _Password;
               myconn2.Database := _db;
               myconn2.LoginPrompt := False;
               myconn2.Open;
               result := true;
        except
        on E : Exception do
        begin
          //showmessage(E.ClassName + ' Error Message: ' + E.Message);
          result := false;
        end;

        end;

end;

procedure Td_module.RoundCornerOf(Control: TWinControl;avalue : Integer);
var
   R: TRect;
   Rgn: HRGN;
begin
   with Control do
   begin
     R := ClientRect;
     rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, avalue, avalue) ;
     Perform(EM_GETRECT, 0, lParam(@r)) ;
     InflateRect(r, - 4, - 4) ;
     Perform(EM_SETRECTNP, 0, lParam(@r)) ;
     SetWindowRgn(Handle, rgn, True) ;
     Invalidate;
   end;
end;

end.
