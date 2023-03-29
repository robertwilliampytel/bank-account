program Bank_Account;
uses crt;

var
  choice : integer;
  balance: real;
  amount : real;

procedure show_balance(amount : real);
begin
  writeln('Balance: ', amount:7:2);
end;

function withdraw(amount, frombalance : real) : real;
begin
  if frombalance <= 0 then begin withdraw := 0.0 end;
  if (frombalance - amount) < 0.0 then begin withdraw := frombalance end
  else withdraw := frombalance - amount;
end;

function deposit(amount, intobalance : real) : real;
begin
  deposit := amount + intobalance;
end;

begin
  
  textbackground(black);
  textcolor(white);  
  
  choice := 0;
  balance:= 0.0;
  amount := 0.0;

  while not (choice = 3) do
  begin
    clrscr;      (* clears the screen *)
    gotoxy(1, 1);
    
    writeln('--- Main Menu ---');
    writeln('1   Withdraw');
    writeln('2   Deposit ');
    writeln('3   Goodbye ');
    writeln;
    show_balance(balance);
    
    readln (choice);
    
    if choice = 1 then
    begin
      writeln('Please input an amount to withdraw:');
      readln (amount);
      balance := withdraw(amount, balance);
    end;
    
    if choice = 2 then
    begin
      writeln('Please input an amount to deposit:');
      readln (amount);
      balance := deposit(amount, balance);
    end;
  end;
end.
