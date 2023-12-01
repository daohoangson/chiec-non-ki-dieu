Uses crt;

Const non: array[1..36] Of Integer = (700,500,300,400,2,600,500,900,3,800,100,200,1,500,600,100,200,700,
                                      400,300,200,600,500,3,900,800,100,200,4,800,500,900,700,100,2,600);

Var f1,f2,fhd,fhs: text;
    f: file of char;
    i,j,k,n,d,dn,rd,s: byte;
    so_diem,l: Integer;
    diem,tg_d: Real;
    Ch,tiep,tgc: char;
    a,kq,tgs,thuong,hoa,o_diem,tg_t,fn: String;
    dung,OK,thoat: Boolean;
    bh,bkq: Array [1..50] Of String;
    dong: Array [1..7] Of String;
    bhs_t: Array [1..6] Of String;
    bhs_d: Array [1..6] Of Real;
(*********************************PROCEDURE**********************************)
Procedure hoi;
Begin
 Assign(f1,'hoi.dat'); Reset(f1); Readln(f1,n);
 Assign(f2,'dap.dat'); Reset(f2);
 Assign(fhs,'h_score.dat'); Reset(fhs);
 For i:=1 to n do Readln(f1,bh[i]);
 For i:=1 to n do Readln(f2,bkq[i]);
 For i:=1 to 5 do Begin
                   Readln(fhs,bhs_t[i]);
                   Readln(fhs,bhs_d[i]);
                  End;
 (*******************************************************)
 d:=random(n-1)+1;
 GotoXY(1,1); Writeln(bh[d]);
 kq:=bkq[d]; s:=Length(kq); For i:=1 to s do tgs:=tgs+'*';
 GotoXY(2,3); Writeln(tgs);
 Readln;
End;

Procedure quay_diem;
Begin GotoXY(1,5); clreol;
      GotoXY(1,5); Write('Ban hay quay chiec non di!'); Readln;
 Repeat If i<30 then i:=i+1;
        If i=30 then i:=1;
        GotoXY(1,5); clreol;
        GotoXY(1,5); Write(non[i]);
        so_diem:=non[i];
        Delay(100);
 Until keypressed;
 Case so_diem Of
  1:o_diem:='may man';
  2:o_diem:='chia doi';
  3:o_diem:='nhan doi';
  4:o_diem:='mat diem';
 End;
 GotoXY(1,7); clreol;
 GotoXY(1,7); Case so_diem Of
               1..5:Writeln('Ban quay duoc o: ',o_diem,'.');
               100..900:Writeln('Ban quay duoc o: ',so_diem,' diem.');
              End;
 Readln;
End;

Procedure tinh_diem;
Begin
 Case so_diem Of
  1: Begin
       diem:=diem;
       GotoXY(1,5); clreol;
       GotoXY(1,5); Write('Ban muon lat chu cai o vi tri nao? '); Readln(i);
       tgs[i]:=kq[i];
       GotoXY(2,3); Write(tgs);
       GotoXY(1,7); clreol;
       GotoXY(1,7); Write('Vi tri ',i,' la chu cai: ',kq[i]); Readln;
      End;
  2: diem:=diem/2;
  3: If dung=True then diem:=diem*2;
  4: diem:=0;
  100..900: If dung=True then diem:=diem+so_diem;
 End;
 GotoXY(1,10); clreol;
 GotoXY(1,10);
 TextColor(12);
 Writeln('So diem hien thoi cua ban: ',diem:1:0,' diem ');
 TextColor(2);
 Writeln('Ban chi con duoc phep doan sai ',dn,' lan nua thoi!');
 TextColor(7);
End;

Procedure doan_sai;
Begin
 GotoXY(1,7); clreol;
 GotoXY(1,7);
 TextColor(2);
 rd:=random(byte(7));
 Case rd Of
 0: Write('Chu "',a,'"? Khong co chu "',a,'" nao trong tu can tim!');
 1: Write('Ban doan chu "',a,'" ? Ban da doan sai roi!');
 2: Write('Rat tiec ban khong gianh duoc ',so_diem,' diem roi!');
 3: Write('Nao hay co gang thu lai di!');
 4: Write('Ban vua co mot y kien toi te! Qua la phi!');
 5: Write('Vang ban vua de tuot mat ',so_diem,' diem do!');
 6: Write('Xin chia buon! Ban da doan sai roi.');
 7: Write('Toi hy vong lan sau ban se gianh duoc diem nhe!');
 End;
 Delay(2000);
 GotoXY(1,7);
 clreol;
 TextColor(7);
End;

Procedure doan_dung;
Begin
 GotoXY(1,7); clreol;
 GotoXY(1,7);
 TextColor(12);
 rd:=random(byte(7));
 Case rd of
 0: Write('Ban doan chu "',a,'"? Xin chuc mung ban, ban da doan dung!');
 1: Write('Ban vua gianh duoc: ',so_diem,' diem roi do, chuc mung!');
 2: Write('Ban thuc su la nguoi co tai day! Hay co gang len nao!');
 3: Write('Vang vang vang! Trong dap an co chu cai "',a,'".');
 4: Write('Woa! Toi rat vui khi ban vua gianh duoc diem cho minh!');
 5: Write('Toi rat kham phuc ban day!');
 6: Write('That tuyet voi! Qua tuyet voi! Hay co gang phat huy di nhe!');
 7: Write('Ban rat xung dang khi gianh duoc ',so_diem,' diem.');
 End;
 Delay(2000);
 GotoXY(1,7);
 clreol;
 TextColor(7);
End;

Procedure choi;
Begin
 quay_diem; dung:=False;
 If so_diem>1
  then
   Begin
    GotoXY(1,5); clreol;
    GotoXY(1,5); Write('Ban hay doan 1 chu cai: '); Readln(a);
    For i:=1 to k do If a=thuong[i] then a:=hoa[i];
    For i:=1 to s do If a[1]=kq[i] then Begin
                                         dung:=true;
                                         tgs[i]:=a[1];
                                         tinh_diem;
                                         doan_dung;
                                        End;
    If (a<>'thoat') and (dung=false) then Begin dn:=dn-1; tinh_diem; doan_sai; End;
    GotoXY(2,3); Write(tgs);
    GotoXY(1,5); clreol;
   End
  else tinh_diem;
 If a<>'thoat' then
 Repeat
  quay_diem; dung:=False;
  If so_diem>1
   then
    Begin
     GotoXY(1,5); clreol;
     GotoXY(1,5); Write('Ban doan tiep di nao: '); Readln(a);
     For i:=1 to k do If a=thuong[i] then a:=hoa[i];
     For i:=1 to s do If a[1]=kq[i] then Begin
                                          dung:=true;
                                          tgs[i]:=a[1];
                                          tinh_diem;
                                          doan_dung;
                                         End;
     If (a<>'thoat') and (dung=false) then Begin dn:=dn-1; tinh_diem; doan_sai; End;
     GotoXY(2,3); Write(tgs);
     GotoXY(1,5); clreol;
    End
   else tinh_diem;
 Until (tgs=kq) or (a='thoat') or (dn=-1);
 (**************NGUNG CHOI******************)
 If tgs=kq then
  Begin
   TextColor(14);
   clrscr;
   Writeln('CHUC MUNG BAN! BAN DA TRA LOI CHINH XAC!');
   TextColor(7);
  End;
 If a='thoat' then
  Begin
   clrscr;
   Write('Ban vua thoat khoi vong choi!');
  End;
 If dn=-1 then
  Begin
   Clrscr;
   Write('Ban da doan sai qua 5 lan, ban da bi thua!');
  End;
End;

Procedure high_score;
Begin
 For i:=5 downto 1 do If (diem>bhs_d[i]) then j:=i;
 If j<=5 then Begin clrscr;
                    Write('Hay cho chung thoi biet ten cua ban: '); Readln(bhs_t[6]);
                                                                      bhs_d[6]:=diem;
              End;
 For j:=1 to 5 do
    For i:=1 to 5 do
      If bhs_d[i]<bhs_d[i+1] then Begin tg_d:=bhs_d[i];
                                              bhs_d[i]:=bhs_d[i+1];
                                                        bhs_d[i+1]:=tg_d;
                                        tg_t:=bhs_t[i];
                                              bhs_t[i]:=bhs_t[i+1];
                                                        bhs_t[i+1]:=tg_t;
                                  End;

 (***Viet ra man hinh***)
 GotoXY(5,5);
 Writeln('HIGH SCORE');
 Rewrite(fhs);
 For i:=1 to 5 do Begin
                   GotoXY(1,5+i);
                   If bhs_t[i]='' then bhs_t[i]:='<unknownname>';
                   Write(bhs_t[i]);
                   Writeln(fhs,bhs_t[i]);
                   GotoXY(20,5+i);
                   Write(bhs_d[i]:1:0);
                   Writeln(fhs,bhs_d[i]:1:0)
                  End;
 Readln;
 clrscr;
End;

Procedure PLAY;
Begin
 Repeat
  dn:=5;
  clrscr;
  tgs:='';
  GotoXY(1,10); clreol;
  TextColor(12);
  Writeln('So diem hien thoi cua ban: ',diem:1:0,' diem ');
  TextColor(2);
  Writeln('Ban chi duoc phep doan sai ',dn,' lan nua !');
  TextColor(7);
  hoi;
  choi;
  GotoXY(1,3); TextColor(15); Write('Ban co muon choi tiep khong?(C/K) '); Readln(tiep);
                              Write('Ban da ghi duoc tong cong: ',diem,' diem.');
                              TextColor(7);
 Until tiep in ['K','k'];
 high_score;
 Close(fhs);
End;

Procedure huong_dan;
Begin
 Clrscr;
 TextColor(12); Writeln('HUONG DAN SU DUNG:');
 TextColor(7); Writeln('ßßßßßßßßßßßßßßßßßß');
 Writeln;
 Assign(fhd,'data.hdn'); Reset(fhd);
 Repeat
  Readln(fhd,tgs);
  Writeln(tgs);
 Until eof(fhd);
 Readln;
End;

Procedure Sorry;
Begin
 Clrscr;
 TextColor(12+128); Writeln('Hien tai phan nay chua the hoat dong!'); TextColor(7);
 TextColor(15); Writeln;
                Writeln('Toi dang co gang hoan thien phan nay.');
                Writeln('Mong ban het suc thong cam.');
                Writeln('Cam on vi da su dung chuong trinh!'); TextColor(7);
 Readln;
End;

Procedure Nhap_fn;
Begin
 OK:=false; fn:='';
 Write('Ban hay nhap ten file can chuyen doi: ');
 Repeat
  If readkey in [#27,#13] then fn:=fn else fn:=fn+readkey;
 Until readkey in [#27,#13];
 Assign(f,fn); {$I-} Reset(f); {$I+}
 If IOResult<>0 then
                 Begin
                  Writeln('Chuong trinh khong the xu ly file ban vua nhap!');
                  Readln;
                 End
                else OK:=true;
End;

Procedure Chon_lua;
Begin
 Repeat
  If Ch in ['|','1','h','H','2','t','T'] then Write('') else Write('Ban hay chon lai!');
  Clrscr;
  TextColor(12);
  Writeln('File: ',fn);
  TextColor(7);
  Writeln('Ban da hoan thanh viec nhap ten file!');
  Writeln('Bay gio, ban hay chon cong viec minh muon thuc hien: ');
  Writeln('  1. Doi tat ca cac chu cai [h]oa thanh chu thuong.');
  Writeln('  2. Doi tat ca cac chu cai [t]huong thanh chu hoa.');
  TextColor(12);
  GotoXY(30,4); Write('h');
  GotoXY(30,5); Write('t');
  TextColor(7);
  Writeln;
  Ch:=readkey;
 Until Ch in ['1','h','H','2','t','T',#27];
End;

Procedure hoa_thuong;
Begin
 l:=-1;
 While not eof(f) do
  Begin
   l:=l+1;
   Seek(f,l);
   Read(f,tgc);
   If tgc in ['A'..'Z'] then
    Begin
     tgc:=chr(ord(tgc)+32);
     Seek(f,l);
     Write(f,tgc);
    End;
  End;
 Close(f);
End;

Procedure thuong_hoa;
Begin
 l:=-1;
 While not eof(f) do
  Begin
   l:=l+1;
   Seek(f,l);
   Read(f,tgc);
   If tgc in ['a'..'z'] then
    Begin
     tgc:=chr(ord(tgc)-32);
     Seek(f,l);
     Write(f,tgc);
    End;
  End;
 Close(f);
End;

Procedure quatang;
Begin
 Clrscr;
 TextColor(12+128);
 Write('Ban da tim duoc mon qua bi an cua toi!');
 TextColor(7);
 Readln;
 Writeln('Chuong trinh nay se thay doi cac ki tu trong mot file thanh dang hoa(thuong)!');
 Readln;
 Repeat
  Clrscr;
  Nhap_fn;
  If OK=True then
   Begin
    Ch:='|';
    Chon_lua;
    Case Ch of
     '1','h','H': hoa_thuong;
     '2','t','T': thuong_hoa;
     #27: exit;
    End;
    Writeln;
    Writeln('Chuong trinh dang xu ly!');
    Writeln('Da hoan thanh!');
    Writeln;
   End;
  Write('Ban co muon tiep tuc khong?(C/K) ');
  tiep:=readkey;
 Until tiep in ['K','k',#27];
End;

Procedure qucao;
Begin
 Clrscr;
 dong[1]:='******************************************************************************';
 dong[2]:='* Rat cam on ban da su dung chuong trinh cua toi, moi chi tiet xin lien he:  *';
 dong[3]:='* +So dien thoai: +844 5727843.                                              *';
 dong[4]:='* +Dia chi: P103 - A2 - Tap the Trung Tu - Quan Dong Da - Ha Noi - Viet Nam. *';
 dong[5]:='* +Fax: <Chua dang ki>                                                       *';
 dong[6]:='******************************************************************************';
 dong[7]:='Xin luu y: nhung thong tin tren co the thay doi ma khong can bao truoc!';
 i:=1; j:=1;
 Repeat
  If dong[i][j]<>' ' then Begin GotoXY(j,i); Write(dong[i][j]); Delay(5); End;
  j:=j+1;
  If j=81 then Begin i:=i+1; j:=1; End;
 Until KeyPressed or ((i=8) and (j=1));
 Readln;
End;

Procedure menu;
Begin
 Clrscr;
 GotoXY(30,1); TextColor(2); Write('----- MAIN MENU -----'); TextColor(7);
 GotoXY(1,3); For i:=1 to 80 do Begin TextColor(random(15-1)+1); Write('*'); End; TextColor(7);
 TextColor(15); GotoXY(5,5); Write('1. [B]at dau choi.');
                GotoXY(5,7); Write('2. [D]oc huong dan cach choi.');
                GotoXY(5,9); Write('3. [T]hem cau hoi vao thu vien.');
                GotoXY(5,11); Write('4. [G]ioi thieu ve tac gia.');
                GotoXY(5,13); Write('5. Th[o]at chuong trinh.'); TextColor(7);
 TextColor(12); GotoXY(9,5); Write('B');
                GotoXY(9,7); Write('D');
                GotoXY(9,9); Write('T');
                GotoXY(9,11); Write('G');
                GotoXY(11,13); Write('o'); TextColor(7);
 GotoXY(1,15); For i:=1 to 80 do Begin TextColor(random(15-1)+1); Write('*'); End; TextColor(7);
 GotoXY(3,17); Write('Ban chon: ');
 Repeat Ch:=readkey Until Ch in ['1','B','b','2','D','d','3','T','t','4','G','g','5','O','o',#27,'-'];
End;

(********************************MAIN PROGRAM********************************)
BEGIN
 thuong:='abcdefghijklmnopqrstuvwxyz'; k:=Length(thuong);
 hoa:='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
 randomize;
 Repeat
  menu;
  Case Ch Of
   '1','B','b': PLAY;
   '2','D','d': huong_dan;
   '3','T','t': Sorry;
   '4','G','g': qucao;
   '-': quatang;
  End;
 Until Ch in ['5','O','o'];
 qucao;
END.

