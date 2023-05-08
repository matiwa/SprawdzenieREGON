program SprawdzenieREGON;
uses
SysUtils;

var

REGON : array [0..13] of Integer;
poprawnosc : boolean;
ciagREGON : String;
dlugoscREGON : Integer = 0;


function sprawdzenieSumyKontrolnej9(): boolean;
var
suma : integer;
begin
suma := 8 * REGON[0] +
9 * REGON[1] +
2 * REGON[2] +
3 * REGON[3] +
4 * REGON[4] +
5 * REGON[5] +
6 * REGON[6] +
7 * REGON[7];
suma := suma mod 11;
if suma = 10 then
suma := 0;

if suma = REGON[8] then
result := true
else
result := false;
end;


function sprawdzenieSumyKontrolnej14(): boolean;
var
suma : integer;
begin
suma := 2 * REGON[0] +
4 * REGON[1] +
8 * REGON[2] +
5 * REGON[3] +
0 * REGON[4] +
9 * REGON[5] +
7 * REGON[6] +
3 * REGON[7] +
6 * REGON[8] +
1 * REGON[9] +
2 * REGON[10] +
4 * REGON[11] +
8 * REGON[12];
suma := suma mod 11;
if suma = 10 then
suma := 0;

if suma = REGON[13] then
result := true
else
result := false;
end;


function sprawdzenieSumyKontrolnej(): boolean;
begin
if dlugoscREGON = 9 then
result := sprawdzenieSumyKontrolnej9()
else
result := (sprawdzenieSumyKontrolnej9() and sprawdzenieSumyKontrolnej14());
end;


procedure sprawdzenieREGON(numerREGON: String);
var
i : integer;
begin

if (length(numerREGON) <> 9) and (length(numerREGON) <> 14) then
poprawnosc := false
else
begin
dlugoscREGON := length(numerREGON);
for i := 0 to dlugoscREGON - 1  do
REGON[i] := StrToInt(numerREGON[i+1]);
if (sprawdzenieSumyKontrolnej()) then
poprawnosc := true
else
poprawnosc := false;
end;
end;


begin
write('Wprowadz numer REGON: ');
readln(ciagREGON);

sprawdzenieREGON(ciagREGON);

if poprawnosc then
begin
writeln('REGON: OK');
end
else
begin
writeln('REGON: Bledny');
end;
readln;
end.
