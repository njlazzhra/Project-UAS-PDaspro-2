program project_perpustakaan;
uses crt;
var
choice, i: integer;
valid, listbuku: boolean;
choicee, keluar: string;

X : array[1..5] of boolean;
Nama : array[1..5] of string;
label menu, list, pinjam, exitt;

procedure bukupinjam;
    begin 
        for i:= 1 to 5 do 
            begin
                if x[i] then
                    writeln(nama[i]);
            end;
    end;

begin
    keluar:='tidak';
    valid:= true;
    
    menu:
        clrscr;
        writeln('---------------------------------------------');
        writeln('Welcome to the BookVerse Digital Library ^_^');
        writeln('---------------------------------------------');
        writeln('Dive into and Find your own Good Book here!');
        writeln;
        writeln('Menu: ');
        writeln('1. Borrowing Books');
        writeln('2. Returning Books');
        writeln('3. Exit');
        writeln;
        write('Input your choice! '); readln(choice);

        Nama[1]:='[1] Algoritma dan Pemrograman: Teori dan Praktik dalam Pascal by Zarlis, M.';
        Nama[2]:='[2] Pemrograman Pascal by B. Zarlis, M.';
        Nama[3]:='[3] Dasar-Dasar Pemrograman Pascal: Teori dan Program Terapan by Andi';
        Nama[4]:='[4] Algoritma dan Pemrograman by D. Rinaldi Munir';
        Nama[5]:='[5] Algoritma dan Pemrograman Menggunakan Pascal, Edisi I by E. Kadir, Abdul, Heriy anto';

        case choice of
        1: //Peminjaman Buku
            begin
                list:
                clrscr;
                writeln('-List of Books-');
                writeln;
                writeln('[1] Algoritma dan Pemrograman: Teori dan Praktik dalam Pascal by Zarlis, M.');
                writeln('[2] Pemrograman Pascal by B. Zarlis, M.');
                writeln('[3] Dasar-Dasar Pemrograman Pascal: Teori dan Program Terapan by Andi');
                writeln('[4] Algoritma dan Pemrograman by D. Rinaldi Munir');
                writeln('[5] Algoritma dan Pemrograman Menggunakan Pascal, Edisi I by E. Kadir, Abdul, Heriyanto');
                writeln('[6] Back');
                
                if not valid then
                write('The option is Invalid. Please select back your choice!');
                valid:= true;

                //klik buku yang mau dipinjam
                writeln; readln(i);
                if (i = 6) then
                begin
                goto menu;
                end
                else if (i > 6) then
                begin
                valid := false;
                goto list;
                end
                else

                writeln;
                writeln(Nama[i]);
                write('Do you wanna borrow it? ');
                writeln('(yes/no) '); readln(choicee);

                if (choicee = 'yes') then
                    begin
                        x[i]:= true;
                        writeln;
                        write('Book successfully borrowed!');
                        readln;
                        goto list;
                    end
                else
                goto list;

            end;

        2: //Pengembalian Buku
            begin
                if x[1] or x[2] or x[3] or x[4] or x[5] then
                listbuku:= true;

                if listbuku then
                    begin
                        listbuku:= false;
                        goto pinjam;
                    end
                else
                    begin
                        writeln;
                        write('No books borrowed.'); readln;
                        goto menu;
                    end;
            
                pinjam:
                writeln;
                writeln('These are the books you borrowed.');
                bukupinjam;
                writeln;
                writeln('1. Returning Books');
                writeln('2. Back');
                write('Input your choice! ');

                if not valid then
                write('The option is Invalid. Please select back your choice!');
                valid:= true;
                write; readln(choice);
                writeln;

                if (choice = 1) then
                    begin
                        bukupinjam;
                        write('Input the Book Code! '); readln(i);
                        x[i]:= false;
                        writeln;
                        write('Books successfully returned!'); readln;
                        goto menu
                    end

                else if (choice = 2) then 
                goto menu

                else valid:= true;
                goto pinjam;
                end;

        3: //keluar program
            begin
                repeat
                clrscr;
                write('Exit? ');
                writeln('(yes/no?) '); readln(keluar);

                    if (keluar = 'yes') then
                        begin
                            valid:= true;
                            goto exitt;
                        end
                    else if (keluar = 'no') then
                        begin
                            valid:=true;
                            goto menu
                        end
                    else
                        valid:=false;

                until valid;
            end;
        end;
    exitt:
    clrscr;
    writeln;
    writeln('---------------------------------------------------------------------------------------------');
    writeln('Thank you for choosing BookVerse Digital library. We look forward to seeing u again soon! ^_^');
    writeln('---------------------------------------------------------------------------------------------');
    writeln;
end.
