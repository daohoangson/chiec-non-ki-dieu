USES crt;
VAR
 i: byte;
 tgi,kt: integer;
 tgs: string;
 Ch: char;
 f1,f2,f3,f4: text;
 chkfile,chktype,Chk1,Chk2: boolean;
 data: array [1..100] Of String;
 data_d: array [1..5] Of Real;

BEGIN
 Clrscr;
 Write('Day la chuong trinh chinh sua file cho chuong trinh Chiec non ki dieu (30/4).');
 Readln;
 Clrscr;
 Write('Ban hay an Enter de bat dau!');
 (*File High Score*)
 Writeln;
 Write('Kiem tra file...');
 Assign(f1,'H_SCORE.DAT'); {I-} Reset(f1); {I+}
 If IOResult=0 then chkfile:=True;
 If chkfile=True then Writeln(' OK')
                 else Writeln(' Error!');
 If chkfile=True then
  Begin
   Writeln;
   Write('Kiem tra kieu du lieu...');
   For i:=1 to 3 do
    Readln(f1,tgs);
   chktype:=True;
   Delete(tgs,1,length(tgs)-4);
   Val(tgs,tgi,kt);
   If (tgi>=1) and (tgi<=9999) then chktype:=False;
   If chktype=True then Writeln(' OK')
                   else Writeln(' Error!');
   If chktype=True then
    Begin
     Write('Bat dau chuyen doi...');
     Reset(f1);
     For i:=1 to 5 do
      Begin
       Readln(f1,data[i]);
       Readln(f1,data_d[i]);
      End;
     Close(f1);
     Rewrite(f1);
     For i:=1 to 5 do
      Begin
       Writeln(f1,data[i]);
       Writeln(f1,data_d[i]:1:0);
       Writeln(f1,'30 4 2004');
      End;
     Close(f1);
     Writeln(' OK');
     Chk1:=True;
    End;
  End;
 Readln;
 (*File index*)
 Writeln;
 Write('Kiem tra file...');
 Assign(f2,'HOI.DAT'); {I-} Reset(f2); {I+}
 Assign(f3,'INDEX.DAT');
 If IOResult=0 then chkfile:=True;
 If chkfile=True then Writeln(' OK')
                 else Writeln(' Error!');
 If chkfile=True then
  Begin
   Writeln;
   Write('Kiem tra kieu du lieu...');
   Readln(f2,tgs);
   Delete(tgs,1,length(tgs)-4);
   Val(tgs,tgi,kt);
   If tgi in [1..100] then chktype:=True;
   If chktype=True then Writeln(' OK')
                   else Writeln(' Error!');
   If chktype=True then
    Begin
     Write('Bat dau chuyen doi...');
     For i:=1 to tgi do
      Readln(f2,data[i]);
     Close(f2);
     Rewrite(f2);
     For i:=1 to tgi do
      Writeln(f2,data[i]);
     Close(f2);
     Rewrite(f3);
     Writeln(f3,tgi);
     Close(f3);
     Writeln(' OK');
     Chk2:=True;
    End;
  End;
 Readln;
 Writeln('Chu y: De tiep tuc, ban can nho xem ban da bao gio mo file DAP.DAT ra xem bao gio');
 Writeln(' chua, neu ban da tung mo ra va "nghich" no thi khong nen cho chay tiep!');
 Write('Ban co muon chay tiep khong(C/K): ');
 Repeat Ch:=readkey Until Ch in ['C','c','K','k'];
 If Ch in ['C','c'] then
  Begin
   Assign(f4,'DAP.DAT'); {I-} Append(f4); {I+}
   Writeln(f4,'');
  End;
 Readln;
 Writeln;
 Writeln('Tom tat qua trinh hoat dong: ');
 Write('+ Viec chinh sua file H_SCORE.DAT: '); If Chk1=True then Writeln('OK')
                                                            else Writeln('Error!');
 Write('+ Viec chinh sua file INDEX.DAT: '); If Chk2=True then Writeln('OK')
                                                          else Writeln('Error!');
 Write('+ Viec chinh sua file DAP.DAT: '); If Ch in ['C','c'] then Writeln('OK')
                                                              else Writeln('Not Select!');
 Readln;
 Write('Cam on ban da su dung chuong trinh!');
 Readln;
END.
