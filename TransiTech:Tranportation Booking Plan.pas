program Transportation_Booking_Plan;
//Project Lab Daspro for UAS
uses crt;
type
  TTiket = record
    NamaPenumpang: string;
    StasiunKeberangkatan: string;
    StasiunTujuan: string;
    Harga: real;
    WaktuKeberangkatan: string;
    StasiunTransit: array[1..3] of string;
    NomorBangku: integer;
  end;

const
  Stasiun: array[1..8] of string = (
    'Medan', 'Tebing Tinggi', 'Siantar', 'Lubuk Pakam', 'Tanjung Balai', 'Kisaran', 'Padang Halaban', 'Rantau Prapat');
    
  HargaTiket: array[1..8, 1..8] of real = 
    ((0, 50000, 80000, 40000, 100000, 120000, 150000, 180000),
    (50000, 0, 40000, 20000, 80000, 100000, 120000, 150000),
    (80000, 40000, 0, 50000, 70000, 90000, 100000, 130000),
    (30000, 40000, 60000, 20000, 90000, 110000, 130000, 160000),
    (40000, 20000, 50000, 0, 85000, 105000, 125000, 155000),
    (100000, 80000, 70000, 85000, 0, 30000, 50000, 80000),
    (120000, 100000, 90000, 105000, 30000, 0, 20000, 60000),
    (150000, 120000, 100000, 125000, 50000, 20000, 0, 40000));
  WaktuKeberangkatan: array[1..8] of string =
   ('06:00', '07:30', '09:00', '10:30', '12:00', '13:30', '15:00', '16:30');

var
  Tiket: array[1..5] of TTiket;
  JumlahTiket, i, NomorBangku: integer;
  IndeksKeberangkatan, IndeksTujuan: integer;

// Prosedur untuk menampilkan daftar stasiun
procedure TampilkanStasiun;
var
  i: integer;
begin
  writeln('=== Here is a List of Available Station ===');
  for i := 1 to 8 do
    writeln(i, '. ', Stasiun[i]);
end;

// Fungsi untuk menghitung harga tiket
function HitungHargaTiket(Keberangkatan, Tujuan: integer): real;
begin
  HitungHargaTiket := HargaTiket[Keberangkatan, Tujuan];
end;

begin
  clrscr;
  writeln('------------------------------------------------------');
  writeln('Welcome to The TransiTech: Transportation Booking Plan');
  writeln('------------------------------------------------------');
  writeln;
  TampilkanStasiun;
  writeln;
  
  write('Input your ticket! (max. 5) '); readln(JumlahTiket);
  if (JumlahTiket < 1) or (JumlahTiket > 5) then
  begin
    writeln('The tickets reaches the maximum limit.');
    exit;
  end;

  NomorBangku := 1;  
  for i := 1 to JumlahTiket do
  begin
    writeln;
    writeln('Data for ticket ', i, ':');
    write('Passenger Name : ');
    readln(Tiket[i].NamaPenumpang);
    writeln;
    writeln('Select the Departure Station');
    writeln;
    TampilkanStasiun;
    write('Input the Number : '); readln(IndeksKeberangkatan);
    if (IndeksKeberangkatan < 1) or (IndeksKeberangkatan > 8) then
    begin
      writeln('The option is Invalid. Please select back your choice!');
      exit;
    end;
    Tiket[i].StasiunKeberangkatan := Stasiun[IndeksKeberangkatan];
    writeln;
    writeln('Select the Destination Station!');
    writeln;
    TampilkanStasiun;
    write('Input the Number : ');
    readln(IndeksTujuan);
    if (IndeksTujuan < 1) or (IndeksTujuan > 9) or (IndeksKeberangkatan = IndeksTujuan) then
    begin
      writeln('The option is Invalid. Please select back your choice!');
      exit;
    end;
    Tiket[i].StasiunTujuan := Stasiun[IndeksTujuan];
    Tiket[i].Harga := HitungHargaTiket(IndeksKeberangkatan, IndeksTujuan);
    Tiket[i].WaktuKeberangkatan := WaktuKeberangkatan[IndeksKeberangkatan];
    Tiket[i].NomorBangku := NomorBangku;  
    Inc(NomorBangku);  
    writeln;
    writeln('Input Transit Station! (max.3, enter for skip):');
    for NomorBangku := 1 to 3 do
    begin
      write('Transit ', NomorBangku, ': ');
      readln(Tiket[i].StasiunTransit[NomorBangku]);
    end;
    writeln;
  end;

  clrscr;
  writeln('=== TransiTech Train Ticket ===');
  writeln;
  for i := 1 to JumlahTiket do
  begin
    writeln('Ticket ', i, ':');
    writeln('Passenger Name    : ', Tiket[i].NamaPenumpang);
    writeln('Departure         : ', Tiket[i].StasiunKeberangkatan);
    writeln('Destination       : ', Tiket[i].StasiunTujuan);
    writeln('Price             : Rp', Tiket[i].Harga:0:2);
    writeln('Departure Time    : ', Tiket[i].WaktuKeberangkatan);
    writeln('Seat Number       : ', Tiket[i].NomorBangku);
    write('Transit           : ');
    for NomorBangku := 1 to 3 do
      if Tiket[i].StasiunTransit[NomorBangku] <> '' then
        write(Tiket[i].StasiunTransit[NomorBangku], ' ');
    writeln;
  end;
    writeln;
    writeln('---------------------------------------------------------------------------------------------');
    writeln('Thank you for choosing TransiTech. We look forward to seeing u again soon! ^_^');
    writeln('---------------------------------------------------------------------------------------------');
    writeln;
  readln;
end.
