unit uthcodebase;


interface

  uses
     vcl.comctrls;

 procedure hide_pages(apageHolder : TPageControl;unhide : Integer);

implementation

procedure hide_pages(apageHolder : TPageControl;unhide : Integer);
var
  i : Integer;
begin
   for I := 0 to apageHolder.PageCount-1 do
    begin
      apageHolder.Pages[i].TabVisible := false;
    end;
      apageHolder.ActivePageIndex := unhide;
end;

end.
